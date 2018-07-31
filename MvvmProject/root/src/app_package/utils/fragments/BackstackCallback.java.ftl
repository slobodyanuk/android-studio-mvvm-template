package ${packageName}.utils.fragments;

import android.support.v4.app.Fragment;

public interface BackstackCallback {
    void onFragmentPushed(Fragment parentFragment);

    void onFragmentPopped(Fragment parentFragment);
}