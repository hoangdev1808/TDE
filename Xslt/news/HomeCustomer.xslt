<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsList">
		<div class="container">
			<div class="block-title">
				<div class="head-title">
					<h1>
						<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10">
					<div class="hone-client-swiper-wrapper">
						<div class="nav-arrow-prev"><em class="lnr lnr-chevron-left"></em></div>
						<div class="nav-arrow-next"><em class="lnr lnr-chevron-right"></em></div>
						<div class="swiper-container home-slide-client">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="News"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="swiper-slide">
			<div class="wrapper">
				<a href="#">
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