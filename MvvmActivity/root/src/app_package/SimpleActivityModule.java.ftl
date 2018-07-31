package ${packageName};

import dagger.Module;
import dagger.Provides;

import ${applicationPackage}.utils.binding.ViewModelProviderFactory;
import ${packageName}.${activityClass}ViewModel;

@Module
public class ${suffix}ActivityModule {

    @Provides
    ViewModelProviderFactory provideMainViewProvider(${activityClass}ViewModel viewModel) {
        return new ViewModelProviderFactory<>(viewModel);
    }

    @Provides
    ${activityClass}ViewModel provide${activityClass}ViewModel() {
        return new ${activityClass}ViewModel();
    }

}
