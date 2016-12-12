#include <dlfcn.h>

%ctor {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *libraryPath = @"/Library/Application Support/DingDing/libDingTalkNoJailTweak.dylib";
        
      
            if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
                void *haldel = dlopen([libraryPath UTF8String], RTLD_NOW);
                if (haldel == NULL) {
                    char *error = dlerror();
                    NSLog(@"dlopen error: %s", error);
                } else {
                    NSLog(@"dlopen load  success.");
                }

                NSLog(@"dynameic  loaded %@", libraryPath);
            } else {
                NSLog(@"SSFLEXLoader file not exists %@", libraryPath);
            }
        

    [pool drain];
}
