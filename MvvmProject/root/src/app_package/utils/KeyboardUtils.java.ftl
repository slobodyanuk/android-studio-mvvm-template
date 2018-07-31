package ${packageName}.utils;

import android.content.Context;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

import javax.inject.Inject;

public class KeyboardUtils {

	private final Context context;

	@Inject
    public KeyboardUtils(Context context) {
        this.context = context;
    }

    public void hideKeyboard(View viewToHide) {
        if (viewToHide != null && context != null) {
            InputMethodManager imm = (InputMethodManager) context.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (imm != null) {
                imm.hideSoftInputFromWindow(viewToHide.getWindowToken(), 0);
            }
        }
    }

    public void showKeyboard(View viewToHide) {
        if (viewToHide != null && context != null) {
            InputMethodManager imm = (InputMethodManager) context.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (imm != null) {
                imm.showSoftInput(viewToHide, InputMethodManager.SHOW_IMPLICIT);
            }
        }
    }

    public void showKeyboardOnStart() {
        if (context != null) {
            InputMethodManager imm = (InputMethodManager) context.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (imm != null) {
                imm.toggleSoftInput(InputMethodManager.SHOW_FORCED, InputMethodManager.HIDE_IMPLICIT_ONLY);
            }
        }
    }

}
