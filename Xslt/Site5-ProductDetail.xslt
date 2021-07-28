<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductDetail">
		<section class="thuc-don-ct">
			<div class="container">
				<div class="thuc-don-ct-1">
					<div class="row">
						<div class="col-lg-7">
							<div class="img">
								<a>
									<xsl:attribute name="data-fancybox">
										<xsl:text disable-output-escaping="yes">Images</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="href">
										<xsl:value-of select="ProductImages[1]/ImageUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="Title"></xsl:value-of>
									</xsl:attribute>
									<img >
										<xsl:attribute name="src">
											<xsl:value-of select="ProductImages[1]/ImageUrl"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="alt">
											<xsl:value-of select="Title"></xsl:value-of>
										</xsl:attribute>
									</img>
								</a>
							</div>
						</div>
						<div class="col-lg-5">
							<div class="wrap-text">
								<h2>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								<div class="price">
									<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
								</div>
								<div class="wrap-des">
									<div class="wrap-left">
										<span>Bao gồm</span>
									</div>
									<div class="wrap-right">
										<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</div>
								</div>
								<div class="line"></div>
								<div class="wrap-buy">
									<a class="button-order" href="#">
										<xsl:attribute name="title">
											<xsl:value-of select="Title"></xsl:value-of>
										</xsl:attribute>
										<xsl:text disable-output-escaping="yes">Mua ngay</xsl:text>
									</a>
									<div class="wrap-list-buy">
										<div class="wrap-icon">
											<xsl:apply-templates select="LinkShops"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="thuc-don-ct-2 section">
				<div class="container">
					<div class="section-title">Món ăn khác </div>
					<div class="wrap-slide">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductOther"></xsl:apply-templates>
							</div>
						</div>
						<div class="wrap-button-slide">
							<div class="swiper-prev swipe-button-1">
								<em class="material-icons">arrow_back</em>
							</div>
							<div class="swiper-next swipe-button-1">
								<em class="material-icons">arrow_forward</em>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="LinkShops">
		<a href="">
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<img src="./assets/thucdon-ct/goj.png" alt="" width="45">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</a>
	</xsl:template>
	<xsl:template match="ProductOther">
		<div class="swiper-slide">
			<a class="wrap-product">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
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
				<div class="wrap-text">
					<strong>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</strong>
					<div class="price">
						<del>
							<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
						</del>
						<span>
							<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
						</span>
					</div>
				</div>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>