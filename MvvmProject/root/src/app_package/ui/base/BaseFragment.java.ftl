package ${packageName}.ui.base;

import android.content.Context;
import android.databinding.DataBindingUtil;
import android.databinding.ViewDataBinding;
import android.graphics.Color;
import android.os.Bundle;
import android.support.annotation.ColorRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import dagger.android.support.DaggerFragment;
import android.support.v4.app.Fragment;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


import lombok.Getter;
import lombok.NonNull;

public abstract class BaseFragment<T extends ViewDataBinding, V extends BaseViewModel> extends DaggerFragment
        implements BaseNavigator {

    @Getter
    @NonNull
    private BaseActivity baseActivity;

    @Getter
    private T binding;

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof BaseActivity) {
            this.baseActivity = (BaseActivity) context;
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        binding = DataBindingUtil.inflate(inflater, getLayoutId(), container, false);
        return binding.getRoot();
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getUserVisibleHint()) {
            setUpBaseModel();
        }
    }

    @Override
    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        binding.setVariable(getBindingVariable(), getViewModel());
        binding.executePendingBindings();
    }

    public void setUpBaseModel() {
        getViewModel().setToolbarVisible(withToolbar());
        getViewModel().setBackButtonVisible(withBackButton());
        getViewModel().setTitle(getTitle());
    }


    private BaseViewModel getActivityViewModel() {
        if (getBaseActivity() != null)
            return getBaseActivity().getViewModel();

        return null;
    }
<#if generateApiHelper>
    @Override
    public boolean isNetworkConnected() {
        return baseActivity != null && baseActivity.isNetworkConnected();
    }

    @Override
    public void openActivityOnTokenExpire() {
        if (baseActivity != null)
            baseActivity.openActivityOnTokenExpire();
    }
    </#if>

    @Override
    public void handleError(Throwable throwable) {
        if (baseActivity != null)
            baseActivity.handleError(throwable);
    }

    @Override
    public void onError(String error) {
        if (baseActivity != null)
            baseActivity.onError(error);
    }

    public void addFragment(int containerViewId, Fragment fragment) {
        if (baseActivity != null)
            baseActivity.addFragment(containerViewId, fragment);
    }

    public void replaceFragmentWithStack(int containerViewId, Fragment fragment) {
        if (baseActivity != null)
            baseActivity.replaceWithBackStackFragment(containerViewId, fragment);
    }

    public void replaceFragmentWithoutStack(int containerViewId, Fragment fragment) {
        if (baseActivity != null)
            baseActivity.replaceNonBackStackFragment(containerViewId, fragment);
    }

    protected void showToastMessage(@StringRes int message) {
        if (baseActivity != null)
            baseActivity.showToastMessage(message);
    }

    protected void showToastMessage(String message) {
        if (baseActivity != null)
            baseActivity.showToastMessage(message);
    }

    protected void showSnackBarMessage(View view, String message) {
        if (baseActivity != null)
            baseActivity.showSnackBarMessage(view, message);
    }

    protected void showSnackBarMessage(View view, String message, @ColorRes int textColor) {
        if (baseActivity != null)
            baseActivity.showSnackBarMessage(view, message, textColor);
    }

    @Override
    public void onBackClicked() {
        if (baseActivity != null)
            baseActivity.onBackClicked();
    }

    @Override
    public void onDetach() {
        baseActivity = null;
        super.onDetach();
    }

    protected abstract @LayoutRes
    int getLayoutId();

    public abstract V getViewModel();

    public abstract int getBindingVariable();

    protected abstract String getTitle();

    protected abstract boolean withBackButton();

    protected abstract boolean withToolbar();

}