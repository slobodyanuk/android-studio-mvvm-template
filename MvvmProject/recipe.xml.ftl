<?xml version="1.0"?>
<#-- <#import "root://activities/common/kotlin_macros.ftl" as kt> -->
<recipe>
    <#-- <@kt.addAllKotlinDependencies /> -->
    

	<dependency mavenUrl="com.android.support:appcompat-v7:${supportLibraryVersion}"/>
	<dependency mavenUrl="com.android.support:design:${supportLibraryVersion}"/>
	<dependency mavenUrl="com.android.support:cardview-v7:${supportLibraryVersion}"/>
	<dependency mavenUrl="com.android.support:support-v4:${supportLibraryVersion}"/>
    <#if withRecycler><dependency mavenUrl="com.android.support:recyclerview-v7:${supportLibraryVersion}"/></#if>
	<dependency mavenUrl="com.android.support.constraint:constraint-layout:${constraintLayoutVersion}"/>

	<dependency mavenUrl="android.arch.lifecycle:extensions:${archVersion}"/>
    <dependency mavenUrl="android.arch.lifecycle:extensions:${archVersion}" gradleConfiguration="annotationProcessor"/>
	
    <dependency mavenUrl="io.reactivex.rxjava2:rxjava:${rxjavaVersion}"/>
	<dependency mavenUrl="io.reactivex.rxjava2:rxandroid:${rxandroidVersion}"/>
	
    <dependency mavenUrl="com.google.dagger:dagger-android-support:${daggerVersion}"/>
    <dependency mavenUrl="com.google.dagger:dagger-compiler:${daggerVersion}" gradleConfiguration="annotationProcessor"/>
    <dependency mavenUrl="com.google.dagger:dagger-android-processor:${daggerVersion}" gradleConfiguration="annotationProcessor"/>
	
    <dependency mavenUrl="uk.co.chrisjenx:calligraphy:${calligraphyVersion}"/>
    
    <dependency mavenUrl="org.projectlombok:lombok:${lombokVersion}" gradleConfiguration="compileOnly"/>
    <dependency mavenUrl="org.projectlombok:lombok:${lombokVersion}" gradleConfiguration="annotationProcessor"/>

	<#if generateApiHelper><dependency mavenUrl="com.amitshekhar.android:rx2-android-networking:${networkingVersion}"/><#else>
    <#if generateRealmHelper><dependency mavenUrl="com.google.code.gson:gson:+"/></#if></#if>
	<#if useGlide><dependency mavenUrl="com.github.bumptech.glide:glide:${glideVersion}"/></#if>
	<#if useEventBus><dependency mavenUrl="org.greenrobot:eventbus:${eventBusVersion}"/></#if>
	<#if usePrefs><dependency mavenUrl="com.pixplicity.easyprefs:library:${prefsVersion}"/></#if>

    <merge
        from="root/build.gradle.ftl"
        to="${escapeXmlAttribute(projectOut)}/build.gradle" />

    <merge 
        from="/build.gradle.ftl"
        to="${escapeXmlAttribute(topOut)}/build.gradle" />

	<copy
		from="root/assets/font/Pt-Mono.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Pt-Mono.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-Bold.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-Bold.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-BoldItalic.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-BoldItalic.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-Italic.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-Italic.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-Light.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-Light.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-LightItalic.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-LightItalic.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-Medium.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-Medium.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-MediumItalic.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-MediumItalic.ttf"/>
	<copy
		from="root/assets/font/Ubuntu-Regular.ttf"
     	to="${escapeXmlAttribute(assetsOut)}/font/Ubuntu-Regular.ttf"/>

 	<merge 
     	from="root/res/values/colors.xml.ftl"
     	to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

 	<instantiate 
     	from="root/res/layout/toolbar.xml.ftl"
     	to="${escapeXmlAttribute(resOut)}/layout/toolbar.xml" />

 	<copy 
     	from="root/res/drawable/ic_back.xml"
     	to="${escapeXmlAttribute(resOut)}/drawable/ic_back.xml" />

 	<merge 
     	from="root/res/values/strings.xml.ftl"
     	to="${escapeXmlAttribute(resOut)}/values/strings.xml" />


 	<merge
     	from="root/res/values/style.xml.ftl"
     	to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

 	<merge 
     	from="root/AndroidManifest.xml.ftl"
     	to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <instantiate 
     	from="root/MyApplication.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${applicationName}.java" />

    <instantiate 
     	from="root/src/app_package/utils/KeyboardUtils.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/utils/KeyboardUtils.java" />

    <instantiate 
     	from="root/src/app_package/utils/binding/BindAdapter.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/utils/binding/BindAdapter.java" />

    <instantiate 
     	from="root/src/app_package/utils/binding/ViewModelProviderFactory.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/utils/binding/ViewModelProviderFactory.java" />

    <instantiate 
     	from="root/src/app_package/utils/Constants.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/utils/Constants.java" />

	<#-- Dagger -->

    <instantiate 
        from="root/src/app_package/di/AppDeclarationsModule.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/di/AppDeclarationModule.java" />

    <instantiate 
     	from="root/src/app_package/di/ActivityBuilder.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/di/ActivityBuilder.java" />

    <instantiate 
     	from="root/src/app_package/di/AppComponent.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/di/AppComponent.java" />

    <instantiate 
     	from="root/src/app_package/di/AppModule.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/di/AppModule.java" />


    <instantiate 
	 	from="root/src/app_package/di/scopes/ActivityScope.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/di/scopes/ActivityScope.java" />

    <instantiate 
     	from="root/src/app_package/di/scopes/ApplicationScope.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/di/scopes/ApplicationScope.java" />

    <instantiate 
     	from="root/src/app_package/di/scopes/FragmentScope.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/di/scopes/FragmentScope.java" />

    <instantiate 
        from="root/src/app_package/data/IDataManager.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/data/IDataManager.java" />

    <instantiate 
        from="root/src/app_package/data/DataManager.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/data/DataManager.java" />

	<#--/ Dagger -->

	<#-- Base UI-->

	<instantiate 
     	from="root/src/app_package/ui/base/BaseFragment.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/base/BaseFragment.java" />

	<instantiate 
     	from="root/src/app_package/ui/base/BaseActivity.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/base/BaseActivity.java" />

	<instantiate 
     	from="root/src/app_package/ui/base/BaseNavigator.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/base/BaseNavigator.java" />

	<instantiate 
     	from="root/src/app_package/ui/base/BaseViewModel.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/ui/base/BaseViewModel.java" />


	<#--/ Base UI-->


    <#if useEventBus><mkdir at="${escapeXmlAttribute(srcOut)}/data/events"/></#if>

    <#if usePrefs>

    	<instantiate 
	     	from="root/src/app_package/utils/PrefsKeys.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/utils/PrefsKeys.java" />

    </#if>

    <#if generateBackstackTool>

    	<instantiate 
	     	from="root/src/app_package/utils/fragments/BackstackCallback.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/utils/fragments/BackstackCallback.java" />

        <instantiate 
	     	from="root/src/app_package/utils/fragments/FragmentBackstackChangeListenerImpl.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/utils/fragments/FragmentBackstackChangeListenerImpl.java" />

        <instantiate 
	     	from="root/src/app_package/utils/fragments/FragmentStateManager.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/utils/fragments/FragmentStateManager.java" />

    </#if>

    <#if generateRealmHelper>

	    <mkdir at="${escapeXmlAttribute(srcOut)}/data/database/entities"/>

		<instantiate 
	     	from="root/src/app_package/utils/realm/RealmModelAdapter.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/utils/realm/RealmModelAdapter.java" />
	    <instantiate 
	     	from="root/src/app_package/utils/realm/RealmSerializerFactory.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/utils/realm/RealmSerializerFactory.java" />
	    <instantiate 
	     	from="root/src/app_package/data/database/DatabaseManager.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/data/database/DatabaseManager.java" />
	    <instantiate 
	     	from="root/src/app_package/data/database/IDatabaseManager.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/data/database/IDatabaseManager.java" />

        <instantiate 
            from="root/src/app_package/di/RepositoryModule.java.ftl"
            to="${escapeXmlAttribute(srcOut)}/di/RepositoryModule.java" />


    </#if>


    <#if generateApiHelper>

    	<mkdir at="${escapeXmlAttribute(srcOut)}/data/network/requests"/>
    	<mkdir at="${escapeXmlAttribute(srcOut)}/data/network/responses"/>
   	 	<mkdir at="${escapeXmlAttribute(srcOut)}/data/network/entities"/>


        <instantiate 
            from="root/src/app_package/di/RestModule.java.ftl"
            to="${escapeXmlAttribute(srcOut)}/di/RestModule.java" />

    	<instantiate 
	     	from="root/src/app_package/utils/NetworkUtils.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/utils/NetworkUtils.java" />
	    <instantiate 
	     	from="root/src/app_package/data/network/ApiError.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/data/network/ApiError.java" />
	    <instantiate 
	     	from="root/src/app_package/data/network/ApiEndpoints.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/data/network/ApiEndpoints.java" />
	    <instantiate 
	     	from="root/src/app_package/data/network/ApiHeaders.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/data/network/ApiHeaders.java" />
	    <instantiate 
	     	from="root/src/app_package/data/network/ApiHelper.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/data/network/ApiHelper.java" />
	    <instantiate 
	     	from="root/src/app_package/data/network/IApiHelper.java.ftl"
	        to="${escapeXmlAttribute(srcOut)}/data/network/IApiHelper.java" />

    </#if>

    <#if withRecycler>

        <instantiate 
            from="root/src/app_package/ui/base/recycler/BaseViewHolder.java.ftl"
            to="${escapeXmlAttribute(srcOut)}/ui/base/recycler/BaseViewHolder.java" />

        <instantiate 
            from="root/src/app_package/ui/base/recycler/EmptyItemViewModel.java.ftl"
            to="${escapeXmlAttribute(srcOut)}/ui/base/recycler/EmptyItemViewModel.java" />

        <instantiate 
            from="root/src/app_package/ui/base/recycler/EmptyItemViewModelListener.java.ftl"
            to="${escapeXmlAttribute(srcOut)}/ui/base/recycler/EmptyItemViewModelListener.java" />

        <instantiate 
            from="root/src/app_package/ui/base/recycler/EmptyViewHolder.java.ftl"
            to="${escapeXmlAttribute(srcOut)}/ui/base/recycler/EmptyViewHolder.java" />

        <instantiate 
            from="root/src/app_package/ui/base/recycler/RetryClickListener.java.ftl"
            to="${escapeXmlAttribute(srcOut)}/ui/base/recycler/RetryClickListener.java" />

        <instantiate 
            from="root/res/layout/layout_empty_list.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/layout/layout_empty_list.xml" />
                        

    </#if>

    
</recipe>
