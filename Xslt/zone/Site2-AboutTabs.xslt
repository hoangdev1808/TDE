<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<div class="container"> 
			<section class="g-nav"> 
				<div class="nav-container" id="nav_gioithieu">
					<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
				</div>
			</section>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="nav-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>nav-item nav-active</xsl:text>
				</xsl:attribute>
			</xsl:if>			
			<a>
				<xsl:attribute name="href">#g<xsl:value-of select="position()"/></xsl:attribute>			
				<p>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</p>
			</a>
		</div>	
	</xsl:template>

</xsl:stylesheet>