package ${packageName};

import dagger.Module;
import dagger.Provides;

import ${applicationPackage}.utils.binding.ViewModelProviderFactory;
import ${packageName}.${suffix}ViewModel;

@Module
public class ${fragmentClass}Module {

    @Provides
    ViewModelProviderFactory provideMainViewProvider(${suffix}ViewModel viewModel) {
        return new ViewModelProviderFactory<>(viewModel);
    }

    @Provides
    ${suffix}ViewModel provide${suffix}ViewModel() {
        return new ${suffix}ViewModel();
    }

}
