<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="block-title">
			<div class="head-title">
				<h1>
					<xsl:value-of select="ModuleTitle" disable-output-escaping="yes" />
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-6 col-lg-6">
				<a href="#">
					<div class="big_img_news-list">
						<div class="img zoom-in">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="News/Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="News/Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="target">
									<xsl:value-of select="Target"></xsl:value-of>
								</xsl:attribute>
								<img src="./img/news-promotion/promotion-small-1.png" alt="">
									<xsl:attribute name="src">
										<xsl:value-of select="News[1]/ImageUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="News[1]/Title" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
								</img>
							</a>
						</div>
					</div>
				</a>
				<div class="content_news-list">
					<div class="card_title_news-list">
						<a href="#">
							<xsl:attribute name="href">
								<xsl:value-of select="News[1]/Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="News[1]/Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="News[1]/Title" disable-output-escaping="yes"></xsl:value-of>
						</a>
					</div>
					<div class="card_title_zone_news-list">
						<xsl:value-of select="News[1]/BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="btn-view-more">
						<a href="">
							<xsl:attribute name="href">
								<xsl:value-of select="News[1]/Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="News[1]/Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
          					<xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes"/>
						</a>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-6">
				<div class="row small-food">
					<xsl:apply-templates select="News[2]"/>
				</div>
				<div class="row small-food">
					<xsl:apply-templates select="News[3]"/>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-12 col-md-6 col-lg-6">
			<div class="new-img">
				<div class="img zoom-in">
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
						<img src="./img/news-promotion/promotion-small-2.png" alt="">
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
		</div>
		<div class="col-12 col-md-6 col-lg-6">
			<div class="content-food-news">
				<div class="title-small-food">
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
				<div class="title-zone-small-food">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="btn-view-more">
					<a href="">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>          					
						<xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes"/>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsImages" >
		<div class="swiper-slide">
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
					<img src="./img/about/gian-1.png" alt="">
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
	</xsl:template>
</xsl:stylesheet>