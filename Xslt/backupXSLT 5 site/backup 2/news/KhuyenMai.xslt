<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsList">
		<div class="container">
			<div class="block-title">
				<div class="head-title">
					<h1>
						<xsl:value-of disable-output-escaping="yes" select="ZoneTitle"></xsl:value-of>
					</h1>
				</div>
			</div>
			<div class="row">
				<xsl:apply-templates select="News[1]" mode="News-1"></xsl:apply-templates>
			</div>
			<div class="row">
				<xsl:apply-templates select="News[position() > 1]" mode="News-2"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="News-1">
		<div class="col-12 col-md-6 col-lg-6 promosion">
			<div class="card_img_big">
				<div class="img_big">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
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
		</div>
		<div class="col-12 col-md-6 col-lg-6 promosion">
			<div class="content-promotion">
				<div class="date">
					<time>
						<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
					</time>
				</div>
				<div class="title_promotion">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title"></xsl:value-of>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="title_zone_promotion">
					<p>
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</p>
				</div>
				<div class="icon">
					<span class="material-icons">east</span>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="News-2">
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card_img">
				<div class="img">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
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
			<div class="content-small-promotion">
				<div class="date">
					<time>
						<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
					</time>
				</div>
				<div class="caption">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title"></xsl:value-of>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="icon">
					<span class="material-icons">east</span>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>