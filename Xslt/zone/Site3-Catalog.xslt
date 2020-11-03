<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<div class="side-navigation-wrapper">
			<div class="title-wrapper">
				<h2>
					<xsl:value-of select="Title" />   
				</h2>
			</div>
			<ul class="side-navigation">
                <xsl:apply-templates select="Zone"/>
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<li >
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>open</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<div class="title"> 
				<a href="#">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="Title"></xsl:value-of>
				</a>
				<em class="lnr lnr-chevron-down"></em>
			</div>
			<xsl:if test="count(Zone) > 0">
				<ul class="nav-sub">
	                <xsl:apply-templates select="Zone" mode="Child"/>
				</ul>
			</xsl:if>
		</li>
	</xsl:template> 
	<xsl:template match="Zone" mode="Child">
		<li>
			<a href="#">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>  
				<xsl:value-of select="Title"></xsl:value-of>
			</a>
		</li> 
	</xsl:template>

</xsl:stylesheet>