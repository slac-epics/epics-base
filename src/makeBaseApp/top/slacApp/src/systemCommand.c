#include <stdlib.h>
#include <epicsExport.h>
#include <registryFunction.h>
#include <iocsh.h>
#include <epicsStdio.h>
#include <epicsStdioRedirect.h>

static void systemCommand(const iocshArgBuf *args)
{
    int status;

    if(args) {  
        status = system(args[0].sval);
     }
}

static const iocshArg        systemCommandArg0   = {"system command (shell command)", iocshArgString};
static const iocshArg *const systemCommandArgs[] = { &systemCommandArg0 };
static const iocshFuncDef    systemCommandDef    = {"system", 1, systemCommandArgs};

static void systemCommandRegister()
{
    iocshRegister(&systemCommandDef, systemCommand);
}

epicsExportRegistrar(systemCommandRegister);

