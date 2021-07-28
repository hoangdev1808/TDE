<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<div class="location-filter-2" style="display:none;">
			<div class="wrap-left-select">
				<div class="btn-group">
					<a href="#" class="btn btn-danger" data-toggle="dropdown" >
						<xsl:value-of select="Zone[IsActive = 'true']/Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
					<div class="dropdown-menu">
						<xsl:apply-templates select="Zone" mode="Sort"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Sort">
		<xsl:if test="IsActive = 'true'">
			<a class="dropdown-item" href="#">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
