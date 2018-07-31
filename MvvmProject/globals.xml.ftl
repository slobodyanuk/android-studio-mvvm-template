<?xml version="1.0"?>
<globals>
<#--     <#include "../common/common_globals.xml.ftl" /> -->

	<global id="hasAppBar" type="boolean" value="false" />
    <global id="hasNoActionBar" type="boolean" value="false" />

    <global id="manifestOut" value="${manifestDir}" />
	<global id="assetsOut" value="./app/src/main/assets" />
	<global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
    <global id="resOut" value="${resDir}" />
    <#include "root://activities/common/kotlin_globals.xml.ftl" />

	<global id="supportLibraryVersion" type="string"
		value="+" />

	<global id="constraintLayoutVersion" type="string"
		value="1.1.2" />

	<global id="archVersion" type="string"
		value="1.1.1" />

	<global id="daggerVersion" type="string"
		value="2.16" />

	<global id="rxjavaVersion" type="string"
		value="2.1.7" />

	<global id="rxandroidVersion" type="string"
		value="2.0.1" />

	<global id="networkingVersion" type="string"
		value="1.0.1" />

	<global id="glideVersion" type="string"
		value="3.7.0" />

	<global id="prefsVersion" type="string"
		value="1.9.0@aar" />
	
	<global id="eventBusVersion" type="string"
		value="3.1.1" />

	<global id="lombokVersion" type="string"
		value="1.16.20" />

	<global id="calligraphyVersion"	type="string"
		value="2.3.0" />

</globals>
