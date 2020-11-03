<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<div class="block-title">
			<div class="head-title">
				<h1>
					<xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Title"></xsl:value-of>
				</h1>
			</div>
			<div class="head-title-zone">
				<div class="title">
					<ul class="list-reset">
						<xsl:apply-templates select="Zone[IsActive='true']/Zone"></xsl:apply-templates>
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
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