<?xml version="1.0"?>
<#-- <#import "root://activities/common/kotlin_macros.ftl" as kt> -->
<recipe>
    <#-- <@kt.addAllKotlinDependencies /> -->

    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <merge 
        from="root/src/app_package/AndroidManifest.xml.ftl"
        to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <instantiate 
     	from="root/src/app_package/SimpleActivity.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <instantiate 
        from="root/src/app_package/SimpleNavigator.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${activityClass}Navigator.java" />

    <instantiate 
        from="root/src/app_package/SimpleActivityModule.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${suffix}ActivityModule.java" />

    <instantiate 
        from="root/src/app_package/SimpleViewModel.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${activityClass}ViewModel.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
        
</recipe>
