<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/BannerList">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="Banner"></xsl:apply-templates>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="swiper-slide">
			<a class="wrap-img">
				<xsl:attribute name="target">
					<xsl:value-of disable-output-escaping="yes" select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="Url !=''">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="href">
							<xsl:text disable-output-escaping="yes">javascript:;</xsl:text>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<div class="img">
					<img >
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="text">
					<div class="title-banner">
						<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</div>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>