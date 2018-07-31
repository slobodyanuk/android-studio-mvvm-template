package ${packageName};

import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.annotation.Nullable;

import ${applicationPackage}.BR;
import ${applicationPackage}.R;
import ${applicationPackage}.utils.binding.ViewModelProviderFactory;
import ${applicationPackage}.databinding.Activity${suffix}Binding;
import ${applicationPackage}.ui.base.BaseActivity;

import ${packageName}.${activityClass}ViewModel;

import javax.inject.Inject;

public class ${activityClass} extends BaseActivity<Activity${suffix}Binding, ${activityClass}ViewModel>
        implements ${activityClass}Navigator {

    private ${activityClass}ViewModel viewModel;

    @Inject
    ViewModelProviderFactory modelProviderFactory;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        viewModel.setNavigator(this);
    }

    @Override
    public int getLayoutId() {
        return R.layout.${layoutName};
    }

    @Override
    public int getBindingVariable() {
        return BR.viewModel;
    }

    @Override
    public ${activityClass}ViewModel getViewModel() {
        viewModel = ViewModelProviders.of(this, modelProviderFactory).get(${activityClass}ViewModel.class);
        return viewModel;
    }
}