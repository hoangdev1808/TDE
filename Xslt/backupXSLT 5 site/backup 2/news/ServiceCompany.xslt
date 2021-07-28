<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<section class="service-company">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1><xsl:value-of disable-output-escaping="yes" select="/ZoneList/Zone[1]/Title"></xsl:value-of></h1>
					</div>
				</div>
				<xsl:apply-templates select="/ZoneList/Zone[1]/News" mode="Zone-News-1"></xsl:apply-templates>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News" mode="Zone-News-1">
		<div class="row">
			<div class="col-lg-8">
				<div class="swiper-container slide-service-company">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
					</div>
					<div class="swiper-pagination service-company-pagination"></div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="content">
					<div class="item-icon">
						<img >
							<xsl:attribute name="src">
								<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</div>
					<div class="sub-title">
						<h3><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of></h3>
					</div>
					<div class="description"><xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsImages">
		<div class="swiper-slide">
			<div class="wrapper">
				<a>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>