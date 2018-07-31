<?xml version="1.0"?>
<#-- <#import "root://activities/common/kotlin_macros.ftl" as kt> -->
<recipe>
    <#-- <@kt.addAllKotlinDependencies /> -->

    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate 
     	from="root/src/app_package/SimpleFragment.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${fragmentClass}.java" />

    <instantiate 
        from="root/src/app_package/SimpleFragmentModule.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${fragmentClass}Module.java" />

    <instantiate 
        from="root/src/app_package/SimpleViewModel.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${suffix}ViewModel.java" />

    <instantiate 
        from="root/src/app_package/SimpleNavigator.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${suffix}Navigator.java" />

    <merge 
        from="root/res/values/strings.xml.ftl"
        to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <open file="${escapeXmlAttribute(srcOut)}/${fragmentClass}.java" />
        
</recipe>
