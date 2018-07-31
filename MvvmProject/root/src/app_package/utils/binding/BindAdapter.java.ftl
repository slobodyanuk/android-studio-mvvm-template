package ${packageName}.utils.binding;

import android.databinding.BindingAdapter;
import android.view.View;


public class BindAdapter {
	@BindingAdapter("selected")
    public static void bindSelected(View viewGroup, boolean selected) {
        viewGroup.setSelected(selected);
    }
}