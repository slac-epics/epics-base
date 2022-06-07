/*************************************************************************\
* Copyright (c) 2018 Michael Davidsaver
* SPDX-License-Identifier: EPICS
* EPICS BASE is distributed subject to a Software License Agreement found
* in file LICENSE that is included with this distribution.
\*************************************************************************/

#include <stdlib.h>
#include <string.h>
#include "osiSock.h"

#include <testMain.h>
#include <epicsUnitTest.h>

#include <errSymTbl.h>
#include <epicsStdio.h>
#include <epicsString.h>
#include <osiFileName.h>
#include <errlog.h>

#include <asLib.h>

static char *asUser,
            *asHost;
static int asAsl;

static void setUser(const char *name)
{
    free(asUser);
    asUser = epicsStrDup(name);
}

static void setHost(const char *name)
{
    free(asHost);
    asHost = epicsStrDup(name);
}

static void testAccess(const char *asg, unsigned mask)
{
    ASMEMBERPVT asp = 0; /* aka dbCommon::asp */
    ASCLIENTPVT client = 0;
    long ret;

    ret = asAddMember(&asp, asg);
    if(ret) {
        testFail("testAccess(ASG:%s, USER:%s, HOST:%s, ASL:%d) -> asAddMember error: %s",
                 asg, asUser, asHost, asAsl, errSymMsg(ret));
    } else {
        ret = asAddClient(&client, asp, asAsl, asUser, asHost);
    }
    if(ret) {
        testFail("testAccess(ASG:%s, USER:%s, HOST:%s, ASL:%d) -> asAddClient error: %s",
                 asg, asUser, asHost, asAsl, errSymMsg(ret));
    } else {
        unsigned actual = 0;
        actual |= asCheckGet(client) ? 1 : 0;
        actual |= asCheckPut(client) ? 2 : 0;
        testOk(actual==mask, "testAccess(ASG:%s, USER:%s, HOST:%s, ASL:%d) -> %x == %x",
               asg, asUser, asHost, asAsl, actual, mask);
    }
    if(client) asRemoveClient(&client);
    if(asp) asRemoveMember(&asp);
}

static void testSyntaxErrors(void)
{
    static const char empty[] = "\n#almost empty file\n\n";
    long ret;

    testDiag("testSyntaxErrors()");

    eltc(0);
    ret = asInitMem(empty, NULL);
    testOk(ret==S_asLib_badConfig, "load \"empty\" config -> %s", errSymMsg(ret));
    eltc(1);
}
static const char hostname_config[] = ""
        "HAG(foo) {localhost,myHostName}\n"
        "ASG(DEFAULT) {RULE(0, NONE)}\n"
        "ASG(ro) {RULE(0, NONE)RULE(1, READ) {HAG(foo)}}\n"
        "ASG(rw) {RULE(1, WRITE) {HAG(foo)}}\n"
        ;

static void testHostNames(void)
{
    struct sockaddr_in addr;
    epicsUInt32 ip;
    char    localhostIP[24];

    testDiag("testHostNames()");
    asCheckClientIP = 0;

    testOk1(asInitMem(hostname_config, NULL)==0);
    /* now resolved to hostnames along w/ IPs */

    setUser("testing");
    setHost("myHostName");
    asAsl = 0;

    testAccess("invalid", 0);
    testAccess("DEFAULT", 0);
    testAccess("ro", 1);
    testAccess("rw", 3);

    if(aToIPAddr("localhost", 0, &addr)) {
        errlogPrintf("ACF: Unable to resolve localhost\n");
        strcat(localhostIP, "unresolved");
        setHost("127.121.122.123");
        testAccess("invalid", 0);
        testAccess("DEFAULT", 0);
        testAccess("ro", 0);
        testAccess("rw", 0);
    } else {
        ip = ntohl(addr.sin_addr.s_addr);
        epicsSnprintf(localhostIP, 24,
                      "%u.%u.%u.%u",
                      (ip>>24)&0xff,
                      (ip>>16)&0xff,
                      (ip>>8)&0xff,
                      (ip>>0)&0xff);
        setHost(localhostIP);
        testAccess("invalid", 0);
        testAccess("DEFAULT", 0);
        testAccess("ro", 1);
        testAccess("rw", 3);
    }

    setHost("guaranteed.invalid.");

    testAccess("invalid", 0);
    testAccess("DEFAULT", 0);
    testAccess("ro", 0);
    testAccess("rw", 0);
}

static void testUseIP(void)
{
    struct sockaddr_in addr;
    epicsUInt32 ip;
    char    localhostIP[24];

    testDiag("testUseIP()");
    asCheckClientIP = 1;

    /* still host names in .acf */
    testOk1(asInitMem(hostname_config, NULL)==0);
    /* now resolved to hostnames along w/ IPs */

    setUser("testing");
    setHost("localhost");
    asAsl = 0;

    testAccess("invalid", 0);
    testAccess("DEFAULT", 0);
    testAccess("ro", 1);
    testAccess("rw", 3);

    if(aToIPAddr("localhost", 0, &addr)) {
        errlogPrintf("ACF: Unable to resolve localhost\n");
        setHost("unresolved");

        testAccess("invalid", 0);
        testAccess("DEFAULT", 0);
        testAccess("ro", 0);
        testAccess("rw", 0);
    } else {
        ip = ntohl(addr.sin_addr.s_addr);
        epicsSnprintf(localhostIP, 24,
                      "%u.%u.%u.%u",
                      (ip>>24)&0xff,
                      (ip>>16)&0xff,
                      (ip>>8)&0xff,
                      (ip>>0)&0xff);
        setHost(localhostIP);

        testAccess("invalid", 0);
        testAccess("DEFAULT", 0);
        testAccess("ro", 1);
        testAccess("rw", 3);
    }

    setHost("guaranteed.invalid.");

    testAccess("invalid", 0);
    testAccess("DEFAULT", 0);
    testAccess("ro", 0);
    testAccess("rw", 0);
}

MAIN(aslibtest)
{
    testPlan(27);
    testSyntaxErrors();
    testHostNames();
    testUseIP();
    errlogFlush();
    return testDone();
}
