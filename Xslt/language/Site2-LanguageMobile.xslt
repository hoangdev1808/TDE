<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<span class="buttonChange change-lang1">
			<xsl:apply-templates select="/LanguageList/Language" mode="Active"></xsl:apply-templates>
		</span>
		<div class="list-change">
			<xsl:apply-templates select="/LanguageList/Language"></xsl:apply-templates>
		</div>	
	</xsl:template>
	
	<xsl:template match="Language" mode="Active">
		<xsl:if test="IsActive='true'">
				<xsl:value-of select="Title"></xsl:value-of>			
		</xsl:if>
	</xsl:template>	
	
	<xsl:template match="Language">
		<xsl:if test="IsActive!='true'">
			<div class="change-1"> 
				<a>
					<xsl:attribute name="href">
					  <xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
					  <xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>			
					<xsl:value-of select="Title"></xsl:value-of> 
				</a>
			</div>
		</xsl:if>
	</xsl:template>	

</xsl:stylesheet>