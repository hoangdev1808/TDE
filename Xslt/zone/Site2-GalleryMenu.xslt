<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<h1 class="section-title text-center">
			<xsl:value-of disable-output-escaping="yes" select="/ZoneList/RootTitle"></xsl:value-of>
		</h1>
		<div class="list-menu">
			<ul>
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>
	
	<xsl:template match="Zone">
		<li> 
			<a>
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>					
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>