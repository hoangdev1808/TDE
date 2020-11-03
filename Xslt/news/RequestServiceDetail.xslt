<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<section class="block_service-detail">
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-8 col-lg-8">
						<div class="card_img">
							<div class="img">
								<img>
								<xsl:attribute name="src">
									<xsl:value-of select="Zone[1]/News/ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Zone[1]/News/Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-4 col-lg-4">
						<div class="content-service-meal">
							<div class="bg-icon">
								<div class="img-icon">
									<img>
									<xsl:attribute name="src">
										<xsl:value-of select="Zone[1]/News/ThumbnailUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="Zone[1]/News/Title"></xsl:value-of>
									</xsl:attribute>
									</img>
								</div>
							</div>
							<div class="title-meal">
								<h2>
									<xsl:value-of select="Zone[1]/News/Title"></xsl:value-of>
									<xsl:value-of select="Zone[1]/News/EditLink" disable-output-escaping="yes">
									</xsl:value-of>
								</h2>
							</div>
							<div class="caption">
								<p>
									<xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/BriefContent">
									</xsl:value-of>
								</p>
							</div>
							<div class="btn-view-more">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="Zone[1]/News/Url"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="Title"></xsl:value-of>
									</xsl:attribute>
									<xsl:value-of disable-output-escaping="yes" select="/ZoneList/ContactText"></xsl:value-of>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="block_service-detail-2">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Zone[2]/Title"></xsl:value-of>
						</h1>
					</div>
				</div>
				<xsl:apply-templates select="Zone[2]/News" mode="ZoneNews-2"></xsl:apply-templates>
			</div>
		</section>
		<section class="block_service-detail-3">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Zone[3]/Title"></xsl:value-of>
						</h1>
					</div>
				</div>
				<div class="service-detail-swiper-wrapper">
					<div class="nav-arrow-prev"><em class="lnr lnr-chevron-left"></em></div>
					<div class="nav-arrow-next"><em class="lnr lnr-chevron-right"></em></div>
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="Zone[3]/News" mode="ZoneNews-3"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="block_service-detail-4">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Zone[4]/Title"></xsl:value-of>
						</h1>
					</div>
				</div>
				<div class="service-detail-2-swiper-wrapper">
					<div class="nav-arrow-prev"><em class="lnr lnr-chevron-left"></em></div>
					<div class="nav-arrow-next"><em class="lnr lnr-chevron-right"></em></div>
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="Zone[4]/News" mode="ZoneNews-4"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="News" mode="ZoneNews-2">
		<div class="row">
			<div class="col-12 col-md-6 col-lg-6">
				<div class="card_img">
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
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-6">
				<div class="content-service-detail">
					<div class="title">
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h3>
					</div>

					<div class="desc-service-detail">
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="ZoneNews-3">
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
			<div class="caption_slide">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</p>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="ZoneNews-4">
		<div class="swiper-slide">
			<div class="wrapper">
				<a href="#!">
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
			<div class="caption_slide_client">
				<div class="card_title_slide_client">
					<h4><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of></h4>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="card_title_slide_zone_client">
					<p><xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of></p>
				</div>
				<div class="content_slide_client">
					<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>