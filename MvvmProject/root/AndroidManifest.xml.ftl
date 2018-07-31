<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">
    <#if generateApiHelper><uses-permission android:name="android.permission.INTERNET"/></#if>

    <application
        android:name=".${applicationName}">
    </application>
</manifest>
