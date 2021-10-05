<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="block-title">
			<div class="title-zone">
				<h2>
					<xsl:value-of select="ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
				</h2>
			</div>
			<div class="nav-arrow">
				<div class="nav-arrow-prev">
					<i class="ri-arrow-left-line"></i>
				</div>
				<div class="nav-arrow-next">
					<i class="ri-arrow-right-line"></i>
				</div>
			</div>
		</div>
		<div class="swiper-container home_slide">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="News"/>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="swiper-slide">
			<div class="wrapper">
				<div class="card_img">
					<div class="img">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Target"></xsl:value-of>
							</xsl:attribute>
							<img src="./img/news-list/news-1.png" alt="">
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</xsl:attribute>
							</img>
						</a>
					</div>
				</div>
				<div class="content_news">
					<div class="date">
						<time>
							<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
						</time>
					</div>
					<div class="card_title_news">
						<a href="">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</a>
					</div>
					<div class="btn-icon">
						<a href="">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>          					
							<xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes"/>
							<span class="ri-arrow-right-circle-fill"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>