package ${packageName};

import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.annotation.Nullable;

import ${applicationPackage}.BR;
import ${applicationPackage}.R;
import ${applicationPackage}.utils.binding.ViewModelProviderFactory;
import ${applicationPackage}.databinding.Fragment${suffix}Binding;
import ${applicationPackage}.ui.base.BaseFragment;

import ${packageName}.${suffix}ViewModel;

import javax.inject.Inject;

public class ${fragmentClass} extends BaseFragment<Fragment${suffix}Binding, ${suffix}ViewModel>
        implements ${suffix}Navigator {

    private ${suffix}ViewModel viewModel;

    @Inject
    ViewModelProviderFactory modelProviderFactory;

    public static ${fragmentClass} newInstance() {
        Bundle args = new Bundle();
        ${fragmentClass} fragment = new ${fragmentClass}();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
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
    public ${suffix}ViewModel getViewModel() {
        viewModel = ViewModelProviders.of(this, modelProviderFactory).get(${suffix}ViewModel.class);
        return viewModel;
    }

    @Override
    protected String getTitle() {
        return getString(R.string.title_${activityToLayout(fragmentClass)});
    }

    @Override
    protected boolean withBackButton() {
        return true;
    }

    @Override
    protected boolean withToolbar() {
        return true;
    }
}
