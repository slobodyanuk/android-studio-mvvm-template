package ${packageName}.utils.fragments;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;

import ${packageName}.${applicationName};

import java.util.List;

public class FragmentBackstackChangeListenerImpl implements FragmentManager.OnBackStackChangedListener {

    private final FragmentManager fragmentManager;
    private final BackstackCallback backstackChangeListener;
    private int lastBackStackEntryCount = 0;

    public FragmentBackstackChangeListenerImpl(FragmentManager fragmentManager, BackstackCallback backstackChangeListener) {
        this.fragmentManager = fragmentManager;
        this.backstackChangeListener = backstackChangeListener;
        lastBackStackEntryCount = fragmentManager.getBackStackEntryCount();
    }

    private boolean wasPushed(int backStackEntryCount) {
        return lastBackStackEntryCount < backStackEntryCount;
    }

    private boolean wasPopped(int backStackEntryCount) {
        return lastBackStackEntryCount > backStackEntryCount;
    }

    private boolean haveFragments() {
        List<Fragment> fragmentList = fragmentManager.getFragments();
        return fragmentList != null && !fragmentList.isEmpty();
    }


    /**
     * If we push a fragment to backstack then parent would be the one before => size - 2
     * If we pop a fragment from backstack logically it should be the last fragment in the list, but in Android popping a fragment just makes list entry null keeping list size intact, thus it's also size - 2
     *
     * @return fragment that is parent to the one that is pushed to or popped from back stack
     */
    private Fragment getParentFragment() {
        List<Fragment> fragmentList = fragmentManager.getFragments();
        for (int i = 0; i < fragmentList.size(); i++) {
            if (!fragmentList.get(i).getClass().getPackage().getName().contains(${applicationName}.PACKAGE_NAME)) {
                fragmentList.remove(fragmentList.get(i));
            }
        }
        if (fragmentList.size() == 0) return null;
        for (int i = fragmentList.size() - 1; i >= 0; i--) {
            if (fragmentList.get(i).getUserVisibleHint()) {
                return fragmentList.get(i);
            }
        }
        return fragmentList.get(Math.max(0, fragmentList.size() - 1));
    }

    @Override
    public void onBackStackChanged() {
        int currentBackStackEntryCount = fragmentManager.getBackStackEntryCount();
        if (haveFragments()) {
            Fragment parentFragment = getParentFragment();

            //will be null if was just popped and was last in the stack
            if (parentFragment != null) {
                if (wasPushed(currentBackStackEntryCount)) {
                    backstackChangeListener.onFragmentPushed(parentFragment);
                } else if (wasPopped(currentBackStackEntryCount)) {
                    backstackChangeListener.onFragmentPopped(parentFragment);
                }
            }
        }

        lastBackStackEntryCount = currentBackStackEntryCount;
    }
}