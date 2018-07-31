package ${packageName};

import ${applicationPackage}.R;

public class ${suffix}ItemViewModel {

    private ${dataClass} item;
    private ${suffix}ItemViewModelListener listener;

    public ${suffix}ItemViewModel(${suffix}ItemViewModelListener listener, ${dataClass} item) {
        this.listener = listener;
        this.item = item;
    }

    public void onItemClick() {
        listener.onItemClick(item);
    }

    public interface ${suffix}ItemViewModelListener {
        void onItemClick(${dataClass} item);
    }

}
