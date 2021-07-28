<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<section class="block_about">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Zone[1]/Title"></xsl:value-of>
						</h1>
					</div>
					<div class="text">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Zone[1]/Description"></xsl:value-of>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-6 col-lg-6">
						<div class="content-about">
							<p>
								<xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/BriefContent">
								</xsl:value-of>
								<xsl:value-of select="Zone[1]/News/EditLink" disable-output-escaping="yes">
								</xsl:value-of>
							</p>
						</div>
					</div>
					<div class="col-12 col-md-6 col-lg-6">
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
				</div>
			</div>
			<div class="block_history">
				<div class="container">
					<div class="block-title">
						<div class="head-title">
							<h1>
								<xsl:value-of disable-output-escaping="yes" select="Zone[2]/Title"></xsl:value-of>
							</h1>
						</div>
					</div>
					<div class="about-swiper-wrapper">
						<div class="nav-arrow-prev"><em class="lnr lnr-chevron-left"></em></div>
						<div class="nav-arrow-next"><em class="lnr lnr-chevron-right"></em></div>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="Zone[2]/News" mode="ZoneNews-2"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="block_about-2">
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-6 col-lg-6">
						<div class="block-title">
							<div class="head-title">
								<h1>
									<xsl:value-of disable-output-escaping="yes" select="Zone[3]/Title"></xsl:value-of>
								</h1>
							</div>
						</div>
						<div class="vision-mission">
							<ul>
								<xsl:apply-templates select="Zone[3]/News" mode="ZoneNews-3"></xsl:apply-templates>
							</ul>
						</div>
					</div>
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card_img">
							<div class="img">
								<img>
								<xsl:attribute name="src">
									<xsl:value-of select="Zone[3]/ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Zone[3]/Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="block_about-3">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Zone[4]/Title"></xsl:value-of>
						</h1>
					</div>
					<div class="text">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Zone[4]/Description"></xsl:value-of>
						</p>
					</div>
				</div>
				<div class="block_about-3-swiper-wrapper"></div>
				<div class="swiper-container slide-about-3">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="Zone[4]/News" mode="ZoneNews-4"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</section>
		<section class="block_about-4">
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-7 col-lg-7">
						<div class="card_img">
							<div class="img">
								<img>
								<xsl:attribute name="src">
									<xsl:value-of select="Zone[5]/News/ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Zone[5]/News/Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-5 col-lg-5">
						<div class="content_about-4">
							<div class="block-title">
								<div class="head-title">
									<h1>
										<xsl:value-of disable-output-escaping="yes" select="Zone[5]/News/Title">
										</xsl:value-of>
										<xsl:value-of select="Zone[5]/News/EditLink" disable-output-escaping="yes">
										</xsl:value-of>
									</h1>
								</div>
							</div>
							<div class="caption_about-4">
								<p>
									<xsl:value-of disable-output-escaping="yes" select="Zone[5]/News/BriefContent">
									</xsl:value-of>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="block_about-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="block-title">
							<div class="head-title">
								<h1>
									<xsl:value-of disable-output-escaping="yes" select="Zone[6]/Title"></xsl:value-of>
								</h1>
							</div>
							<div class="text">
								<p>
									<xsl:value-of disable-output-escaping="yes" select="Zone[6]/Description">
									</xsl:value-of>
								</p>
							</div>
						</div>
						<div class="icon_about-5">
							<ul>
								<xsl:apply-templates select="Zone[6]/News" mode="ZoneNews-6"></xsl:apply-templates>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="News" mode="ZoneNews-2">
		<div class="swiper-slide">
			<div class="wrapper">
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<div class="caption_about">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
				</p>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="ZoneNews-3">
		<li>
			<div class="title_vm">
				<h2>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h2>
			</div>
			<div class="caption_vm">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
				</p>
			</div>
		</li>
	</xsl:template>

	<xsl:template match="News" mode="ZoneNews-4">
		<div class="swiper-slide">
			<div class="wrapper">
				<div class="img shine">
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
	</xsl:template>

	<xsl:template match="News" mode="ZoneNews-6">
		<li>
			<div class="img_icon">
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</li>
	</xsl:template>

</xsl:stylesheet>