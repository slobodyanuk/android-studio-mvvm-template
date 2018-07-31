<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">

    <application>

        <activity
            android:name="${packageName}.${activityClass}"
            android:screenOrientation="portrait">
            <#if isLauncher><intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter></#if>
        </activity>

    </application>
</manifest>
