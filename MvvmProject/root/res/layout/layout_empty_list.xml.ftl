<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">

    <data>

        <variable
            name="viewModel"
            type="${packageName}.ui.base.recycler.EmptyItemViewModel" />

    </data>

    <LinearLayout
        android:id="@+id/linearLayoutView"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@color/colorGrey"
        android:gravity="center"
        android:orientation="vertical">

        <android.support.v7.widget.AppCompatTextView
            style="@style/TextAppearance.Font.Ubuntu.Regular"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:layout_marginTop="30dp"
            android:text="@string/txt_refresh_list"
            android:textColor="@color/colorWhite" />

        <android.support.v7.widget.AppCompatButton
            android:id="@+id/btn_retry"
            style="@style/AppTheme.Button"
            android:layout_width="150dp"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:layout_marginTop="16dp"
            android:onClick="@{() -> viewModel.onRetryClick()}"
            android:text="@string/btn_refresh"
            android:textSize="20sp" />
    </LinearLayout>

</layout>