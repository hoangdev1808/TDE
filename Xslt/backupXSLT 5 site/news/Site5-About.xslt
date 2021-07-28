<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="position()=1">
			<section class="section-gt about-1" id="about-1">
				<div class="container">
					<div class="intro">
						<xsl:apply-templates select="News" mode="ABOUTUS"></xsl:apply-templates>
					</div>
				</div>
				<div class="modal fade" id="gioithieu-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" type="button" data-dismiss="modal" aria-label="Close">
									<span class="close-modal" aria-hidden="true">X</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="modal-detail">
									<xsl:apply-templates select="News" mode="POPUP"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=2">
			<section class="section-gt about-2" id="about-2">
				<div class="container">
					<div class="history">
						<div class="section-title text-center">
							<h2>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h2>
						</div>
						<div class="wrap-slide">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="News" mode="History"></xsl:apply-templates>
								</div>
							</div>
							<div class="wrap-button-slide">
								<div class="swiper-prev sw-1">
									<span class="material-icons partner-icon">keyboard_arrow_left</span>
								</div>
								<div class="swiper-next sw-1">
									<span class="material-icons partner-icon">keyboard_arrow_right</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=3">
			<section class="section-gt about-3" id="about-3">
				<div class="container">
					<div class="look">
						<div class="section-title text-center">
							<h3>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h3>
						</div>
						<div class="look-area">
							<xsl:apply-templates select="News" mode="TamNhin"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=4">
			<section class="section-gt about-4" id="about-4">
				<div class="container-fluid">
					<div class="section-title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<div class="wrap-box">
						<div class="row">
							<xsl:apply-templates select="News" mode="TIENICH"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=5">
			<section class="section-gt about-5" id="about-5">
				<div class="container">
					<div class="partner">
						<div class="section-title text-center">
							<h5>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h5>
						</div>
						<div class="wrap-slide">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="News" mode="Partner"></xsl:apply-templates>
								</div>
							</div>
							<div class="wrap-button-slide">
								<div class="swiper-prev sw-2">
									<span class="material-icons partner-icon">keyboard_arrow_left</span>
								</div>
								<div class="swiper-next sw-2">
									<span class="material-icons partner-icon">keyboard_arrow_right</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=6">
			<section class="section-gt about-6" id="about-6">
				<div class="container-fluid">
					<div class="steps">
						<div class="section-title text-center">
							<h6>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h6>
						</div>
						<div class="steps-area">
							<div class="wrap-slide">
								<div class="wrap-button-slide">
									<div class="swiper-prev sw-3">
										<span class="material-icons partner-icon">keyboard_arrow_left</span>
									</div>
									<div class="swiper-next sw-3">
										<span class="material-icons partner-icon">keyboard_arrow_right</span>
									</div>
								</div>
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<xsl:apply-templates select="News" mode="QUYTRINH"></xsl:apply-templates>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="ABOUTUS">
		<div class="intro-content">
			<img >
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</div>
		<div class="intro-content2">
			<div class="section-title">
				<h1>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</h1>
			</div>
			<div class="content">
				<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<a class="button-order" data-toggle="modal" data-target="#gioithieu-modal">
				<xsl:attribute name="href">
					<xsl:text disable-output-escaping="yes">#gioithieu-modal</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:text disable-output-escaping="yes">xem thêm</xsl:text>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="POPUP">
		<div class="modal-detail-header">
			<img >
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
			<div class="detail">
				<div class="title">
					<h5>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h5>
				</div>
				<div class="content">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</div>
		<div class="modal-detail-body">
			<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="History">
		<div class="swiper-slide">
			<div class="wrap-box">
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
				<div class="distance">
					<span class="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<span class="content-2">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="TamNhin">
		<div class="look-area-item">
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
			<div class="distance">
				<span class="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
				<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="TIENICH">
		<div class="col-lg-6">
			<a class="box-img" href="">
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
				<div class="overlay">
					<div class="wrap-text">
						<span class="title">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</span>
						<p class="content">
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</div>
				</div>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Partner">
		<div class="swiper-slide">
			<div class="img">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
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
		</div>
	</xsl:template>
	<xsl:template match="News" mode="QUYTRINH">
		<div class="swiper-slide">
			<div class="wrap-box">
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
				<div class="steps-content">
					<span class="font-weight-bold">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<p class="pl-2">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>