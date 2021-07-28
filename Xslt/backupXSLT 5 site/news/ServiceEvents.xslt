<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<section class="service-events">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1><xsl:value-of disable-output-escaping="yes" select="/ZoneList/Zone[1]/Title"></xsl:value-of></h1>
					</div>
				</div>
				<xsl:apply-templates select="/ZoneList/Zone[1]/News" mode="Zone-News-1"></xsl:apply-templates>
			</div>
		</section>
		<section class="service-events-2">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h2><xsl:value-of disable-output-escaping="yes" select="/ZoneList/Zone[2]/Title"></xsl:value-of></h2>
					</div>
				</div>
				<div class="sv-events-2-swiper-wrapper">
					<div class="nav-arrow-prev"><em class="lnr lnr-chevron-left"></em></div>
					<div class="nav-arrow-next"><em class="lnr lnr-chevron-right"></em></div>
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="/ZoneList/Zone[2]/News" mode="Zone-News-2"></xsl:apply-templates>
						</div>
					</div>
				</div>
				
			</div>
		</section>

	</xsl:template>
	<xsl:template match="News" mode="Zone-News-1">
		<xsl:if test="position()=1">
			<div class="row">
				<div class="col-lg-8">
					<div class="swiper-container slide-service-events">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
						</div>
						<div class="swiper-pagination service-events-pagination"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="content">
						<div class="item-icon">
							<img>
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
						<div class="description">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()&gt;1">
			<div class="row">
				<div class="col-lg-8">
					<div class="swiper-container slide-service-events">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
						</div>
						<div class="swiper-pagination service-events-pagination"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="content">
						<div class="sub-title">
							<h3><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of></h3>
						</div>
						<div class="description">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
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

	<xsl:template match="News" mode="Zone-News-2">
		<div class="swiper-slide">
			<div class="wrapper">
				<a href="">
					<img >
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="caption_slide">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</p>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>