<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsList">
		<div class="home_promotion_slide">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
						</h1>
					</div>
				</div>
				<div class="home-promotion-swiper-wrapper">
					<div class="swiper-container slide-promotion">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="News"></xsl:apply-templates>
						</div>
						<div class="swiper-pagination home_s-4-pagination"></div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="swiper-slide">
			<div class="card-body">
				<div class="img">
					<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="content">
					<div class="date">
						<time>
							<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
						</time>
					</div>
					<div class="title-home-promotion">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Title"></xsl:value-of>
						</a>
					</div>
					<div class="icon">
						<span class="material-icons">east</span>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>