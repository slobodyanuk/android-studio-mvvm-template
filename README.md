# Android Studio MVVM Template

This is an Android Studio MVVM template.
Template contains folows components architectures: Project, Activity, Fragment, List implementation.
Also used folows libraries and plugins: [RxJava2](https://github.com/ReactiveX/RxJava), [Dagger](https://google.github.io/dagger/), [Calligraphy](https://github.com/chrisjenx/Calligraphy), [FastAndroidNetworking](https://github.com/amitshekhariitbhu/Fast-Android-Networking), [Glide](https://github.com/bumptech/glide), [EventBus](https://github.com/greenrobot/EventBus), [EasyPrefs](https://github.com/Pixplicity/EasyPrefs), [Gson](https://github.com/google/gson), [Realm](https://realm.io/docs/java/latest/) and plugin [Lombok](https://projectlombok.org/).

## Installation

#### Linux:
- Insert Android Studio path into [android_studio_path](android_studio_path);
- Run the install [script (setup.sh)](setup.sh) at the root of this repository.

#### Manual installation:
- Copy `MvvmProject` directory to `$ANDROID_STUDIO_DIR/plugins/android/lib/templates/activities/`;
- Copy `MvvmActivity`, `MvvmFragment` and `MvvmListAdapter` directories to `$ANDROID_STUDIO_DIR/plugins/android/lib/templates/other/`;
- Overwrite the original file`$ANDROID_STUDIO_DIR/plugins/android/lib/templates/gradle-projects/NewAndroidModule/root/shared_macros.ftl` with a new file [`shared_macros.ftl`](shared_macros.ftl);
- Overwrite the original file`$ANDROID_STUDIO_DIR/plugins/android/lib/templates/gradle-projects/NewAndroidModule/root/build.gradle.ftl` with a new file [`build.gradle.ftl`](build.gradle.ftl).

