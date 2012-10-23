/* IOC Shell Main */
/* Author:  Marty Kraimer Date:    17MAR2000 */
/* Additions by Till Strauman and Kukhee Kim Date: Summer 2012 */
/* The additions are needed to suport linuxRT */

#include <stddef.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>
#include <signal.h>

/* Add support for linuxRT */
#include <unistd.h>
#if _POSIX_MEMLOCK > 0
#include <sys/mman.h>
#endif


#include "epicsExit.h"
#include "epicsThread.h"
#include "iocsh.h"

#if defined(__linux__) && defined(__GNUC__)

#include <sched.h>
#include <sys/resource.h>

/* We must make sure this code is executed *before*
 * the epicsThread machinery is.
 * Not so easy since the latter eventually is fired
 * up by a c++ static constructor.
 * It is not possible in a portable way to enforce
 * an order of execution among such constructors if
 * they are defined in different compilation units.
 * Under GNU c++ we may use the 'init_priority'
 * attribute.
 * However, if this code is dynamically linked
 * against EPICS base then this doesn't work either
 * since the shared-library is initialized before
 * this code here.
 * Hence we stick a function pointer into the
 * '.preinit_array' section which is executed
 * before any shared libraries are.
 */
static void set_rtprio(int argc, char **argv, char **envp)
{
struct rlimit l;

        if ( getrlimit(RLIMIT_RTPRIO, &l) ) {
                perror("Warning: retrieving real-time priority limits failed");
        }
        /* If the current hard limit is unset the set to the maximum
         * otherwise leave it alone.
         */
        if ( 0 == l.rlim_max )
                l.rlim_max = sched_get_priority_max(SCHED_FIFO);

        l.rlim_cur = l.rlim_max;
        if ( setrlimit(RLIMIT_RTPRIO, &l) ) {
                perror("Warning: setting real-time priority limit failed");
        }
}

static void (*set_rtprio_hook)(int, char**, char**)
__attribute__((section(".preinit_array"),used)) =  set_rtprio;

#endif


int main(int argc,char *argv[])
{
    sigset_t set;


    #if _POSIX_MEMLOCK > 0
    if(mlockall(MCL_CURRENT | MCL_FUTURE) == -1) {
        printf("Fatal error: memory locking fail\n");
        return -1;
    }
    #endif

/* Blocking SIGIO signal for the _MAIN_ thread */
    sigemptyset(&set);
    sigaddset(&set, SIGIO);
    pthread_sigmask(SIG_BLOCK, &set, NULL);


    if(argc>=2) {    
        iocsh(argv[1]);
        epicsThreadSleep(.2);
    }
    iocsh(NULL);
    epicsExit(0);
    return(0);
}
