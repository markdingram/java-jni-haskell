#include <jni.h>
#include <HsFFI.h>

JNIEXPORT jint JNICALL JNI_OnLoad( JavaVM *vm, void *pvt ) {
	// can set RTS options here - see https://downloads.haskell.org/~ghc/8.2.2/docs/html/users_guide/runtime_control.html
    hs_init(NULL, NULL);
    return JNI_VERSION_1_2;
}

JNIEXPORT void JNICALL JNI_OnUnload( JavaVM *vm, void *pvt ) {
    hs_exit();
}