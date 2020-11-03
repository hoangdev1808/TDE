<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsList">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 big-left">
					<xsl:apply-templates select="News[1]" mode="Big"></xsl:apply-templates>
				</div>
				<div class="col-lg-6 news_image_right">
					<div class="row">
						<xsl:apply-templates select="News[position() > 1 and position() &lt; 6]" mode="Small">
						</xsl:apply-templates>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 news_image_left">
					<div class="row">
						<xsl:apply-templates select="News[position() > 5 and position() &lt; 10]" mode="Small">
						</xsl:apply-templates>
					</div>
				</div>
				<div class="col-lg-6 big-right">
					<xsl:apply-templates select="News[10]" mode="Big"></xsl:apply-templates>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="Big">
		<div class="figure-media figure-media-big">
			<div class="figure-image media-play-big">
				<div class="wrapper-big">
					<div class="wrapper">
						<a data-fancybox="">
							<xsl:attribute name="href">
								<xsl:value-of select="BriefContent"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
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
				<div class="caption">
					<div class="icon">
						<img src="/Data/Sites/1/skins/default/img/news-video/play-icon.png" />
					</div>
					<div class="text">
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</div>
				</div>
			</div>
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="Small">
		<div class="col-12 col-md-6 col-lg-6">
			<div class="figure-media">
				<div class="figure-image media-play">
					<div class="wrapper">
						<a data-fancybox="">
							<xsl:attribute name="href">
								<xsl:value-of select="BriefContent"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
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
					<div class="caption">
						<div class="icon">
							<img src="/Data/Sites/1/skins/default/img/news-video/play-icon.png" />
						</div>
						<div class="text">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</div>
					</div>
				</div>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>