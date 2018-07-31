<?xml version="1.0"?>
<#-- <#import "root://activities/common/kotlin_macros.ftl" as kt> -->
<recipe>
    <#-- <@kt.addAllKotlinDependencies /> -->

    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate 
     	from="root/src/app_package/SimpleAdapter.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

    <instantiate 
     	from="root/src/app_package/SimpleViewModel.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${suffix}ItemViewModel.java" />

    <instantiate 
     	from="root/src/app_package/SimpleViewHolder.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/${suffix}ViewHolder.java" />

        
</recipe>
