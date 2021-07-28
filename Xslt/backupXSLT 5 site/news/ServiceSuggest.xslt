<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsList">
		<xsl:apply-templates select="News"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="News">
		<div class="row suggestions">
			<div class="col-12 col-md-5 col-lg-5">
				<div class="swiper-container slide-food-service-suggestions">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
					</div>
					<div class="swiper-pagination block_service-suggestions-pagination"></div>
				</div>
			</div>
			<div class="col-12 col-md-7 col-lg-7">
				<div class="food-suggestions">
					<div class="title_suggestions">
						<h2>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<div class="caption_suggestions">
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</div>
					<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
					<div class="btn-view-more"><a href="">Liên hệ</a></div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsImages">
		<div class="swiper-slide">
			<div class="wrapper">
				<a href="">
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