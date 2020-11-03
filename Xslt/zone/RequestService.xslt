<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<section class="block_service-meal">
			<div class="container">
				<div class="block-title">
					<div class="head-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Zone[IsActive = 'true']/Title">
							</xsl:value-of>
						</h1>
					</div>
				</div>
				<xsl:apply-templates select="Zone[IsActive = 'true']/Zone"></xsl:apply-templates>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="row service">
			<div class="col-12 col-md-8 col-lg-8">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
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
				</a>
			</div>
			<div class="col-12 col-md-4 col-lg-4">
				<div class="content-service-meal">
					<div class="bg-icon">
						<div class="img-icon">
							<img>
							<xsl:attribute name="src">
								<xsl:value-of select="SecondImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</div>
					</div>
					<div class="title-meal">
						<h2>
							<xsl:value-of select="Title"></xsl:value-of>
						</h2>
					</div>
					<div class="caption">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
						</p>
					</div>
					<div class="btn-view-more">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="/ZoneList/ReadMore2Text"></xsl:value-of>
							<span class="material-icons">trending_flat</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>