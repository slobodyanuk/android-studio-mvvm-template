buildscript {   

<#-- 	repositories {
        google()
        jcenter()
    } -->

    dependencies {
<#--         classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
 -->	   <#if generateRealmHelper>classpath "io.realm:realm-gradle-plugin:5.3.0"</#if>
    }
}

allprojects {
<#-- 
	repositories {
        google()
        jcenter()
    } -->
    repositories {
        repositories {
            maven { url 'https://www.jitpack.io' }
        }
    }
}