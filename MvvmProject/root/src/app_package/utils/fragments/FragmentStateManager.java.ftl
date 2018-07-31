package ${packageName}.utils.fragments;


import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;

import ${packageName}.di.scopes.ActivityScope;

import javax.inject.Inject;

@ActivityScope
public class FragmentStateManager {

    private FragmentManager fragmentManager;

    @Inject
    public FragmentStateManager() {
    }

    private BackstackCallback backstackCallbackImpl = new BackstackCallback() {
        @Override
        public void onFragmentPushed(Fragment parentFragment) {
            parentFragment.onPause();
        }

        @Override
        public void onFragmentPopped(Fragment parentFragment) {
            parentFragment.onResume();
        }
    };

    public FragmentBackstackChangeListenerImpl getListener() {
        return new FragmentBackstackChangeListenerImpl(fragmentManager, backstackCallbackImpl);
    }

    public void apply(FragmentManager fragmentManager) {
        this.fragmentManager = fragmentManager;
        fragmentManager.addOnBackStackChangedListener(getListener());
    }
}