 #!/bin/bash

ANDROID_STUDIO_DIR=`cat android_studio_path`

[[ ! -d $ANDROID_STUDIO_DIR ]] && echo "Please insert your path to AndroidStudio folder location into the android_studio_path file!" && exit 1

PROJECT_TPL_DIR=$ANDROID_STUDIO_DIR/plugins/android/lib/templates/activities/MvvmProject
ACTIVITY_TPL_DIR=$ANDROID_STUDIO_DIR/plugins/android/lib/templates/other/MvvmActivity
FRAGMENT_TPL_DIR=$ANDROID_STUDIO_DIR/plugins/android/lib/templates/other/MvvmFragment
LIST_ADAPTER_TPL_DIR=$ANDROID_STUDIO_DIR/plugins/android/lib/templates/other/MvvmListAdapter

SHARED_MACROS_FTL=$ANDROID_STUDIO_DIR/plugins/android/lib/templates/gradle-projects/NewAndroidModule/root/shared_macros.ftl
BUILD_GRADLE_FTL=$ANDROID_STUDIO_DIR/plugins/android/lib/templates/gradle-projects/NewAndroidModule/root/build.gradle.ftl

rm -r $PROJECT_TPL_DIR
rm -r $ACTIVITY_TPL_DIR
rm -r $FRAGMENT_TPL_DIR
rm -r $LIST_ADAPTER_TPL_DIR

rm -r $SHARED_MACROS_FTL
rm -r $BUILD_GRADLE_FTL
[[ ! -f $SHARED_MACROS_FTL.backup ]] && cp $SHARED_MACROS_FTL.backup $SHARED_MACROS_FTL && rm -r $BUILD_GRADLE_FTL.backup
[[ ! -f $BUILD_GRADLE_FTL.backup ]] && cp $BUILD_GRADLE_FTL.backup $BUILD_GRADLE_FTL && rm -r $SHARED_MACROS_FTL.backup


echo "Done!"