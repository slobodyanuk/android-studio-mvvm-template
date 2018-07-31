<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">

    <data>

        <import type="${packageName}.ui.base.BaseViewModel"/>

        <import
            alias="View"
            type="android.view.View" />

        <variable
            name="viewModel"
            type="${packageName}.ui.base.BaseViewModel" />
    </data>

    <android.support.v7.widget.Toolbar
        style="@style/TextAppearance.Font.Ubuntu.Light"
        android:layout_width="match_parent"
        android:layout_height="?attr/actionBarSize"
        android:background="@color/colorPrimary"
        android:visibility="@{viewModel.toolbarShown ? View.VISIBLE : View.GONE}"
        app:contentInsetEnd="0dp"
        app:contentInsetLeft="0dp"
        app:contentInsetRight="0dp"
        app:contentInsetStart="0dp">

        <android.support.constraint.ConstraintLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content">

            <android.support.constraint.ConstraintLayout
                android:id="@+id/btnBack"
                android:layout_width="?attr/actionBarSize"
                android:layout_height="?attr/actionBarSize"
                android:background="?attr/actionBarItemBackground"
                android:clickable="true"
                android:focusable="true"
                android:onClick="@{() -> viewModel.onBackClicked()}"
                android:visibility="@{viewModel.backButtonVisible ? View.VISIBLE : View.GONE}"
                app:layout_constraintBottom_toBottomOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toTopOf="parent">

                <android.support.v7.widget.AppCompatImageView
                    android:layout_width="match_parent"
                    android:layout_height="57dp"
                    android:padding="16dp"
                    app:srcCompat="@drawable/ic_back" />

            </android.support.constraint.ConstraintLayout>

            <android.support.v7.widget.AppCompatTextView
                style="@style/TextAppearance.Font.Ubuntu.Light"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:ellipsize="marquee"
                android:gravity="center"
                android:marqueeRepeatLimit="marquee_forever"
                android:paddingLeft="45dp"
                android:paddingRight="45dp"
                android:singleLine="true"
                android:text="@{viewModel.title}"
                android:textColor="@color/colorBlack"
                android:textSize="24sp"
                app:layout_constraintBottom_toBottomOf="parent"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toTopOf="parent"
                app:selected="@{true}" />

        </android.support.constraint.ConstraintLayout>

    </android.support.v7.widget.Toolbar>

</layout>