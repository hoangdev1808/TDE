<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<p>
			<xsl:apply-templates select="/LanguageList/Language" mode="Active"></xsl:apply-templates>
		</p>
		<span class="material-icons">expand_more</span>
		<div class="list-change">
			<ul>
				<xsl:apply-templates select="/LanguageList/Language"></xsl:apply-templates>
			</ul>
		</div>		
	</xsl:template>
	
	<xsl:template match="Language" mode="Active">
		<xsl:if test="IsActive='true'">
				<xsl:value-of select="Title"></xsl:value-of>			
		</xsl:if>
	</xsl:template>	
	
	<xsl:template match="Language">
		<xsl:if test="IsActive!='true'">
			<li>	
				<a>
					<xsl:attribute name="href">
					  <xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
					  <xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>			
					<xsl:value-of select="Title"></xsl:value-of> 
				</a>
			</li>
		</xsl:if>
	</xsl:template>	

</xsl:stylesheet>