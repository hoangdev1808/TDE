<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<div class="block-title">
			<div class="head-title">
				<h1>
					<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
				</h1>
			</div>
		</div>
		<div class="service-detail-3-swiper-wrapper">
			<div class="nav-arrow-prev"><em class="lnr lnr-chevron-left"></em></div>
			<div class="nav-arrow-next"><em class="lnr lnr-chevron-right"></em></div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="Zone[IsActive='true']/Zone"></xsl:apply-templates>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<xsl:if test="IsActive != 'true'">
			<div class="swiper-slide">
				<div class="wrapper">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
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
				<div class="caption_slide_5">
					<div class="title_slide_5">
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h3>
					</div>
					<div class="desc_slide_5">
						<p><xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of></p>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>