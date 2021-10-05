<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductList">
		<div class="wrap-list-product">
			<div class="row">
				<xsl:apply-templates select="Product"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-xl-3 col-6">
			<div class="wrap-product">
				<div class="img">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="wrap-text">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<strong>
							<xsl:if test="Code != ''">
								<xsl:value-of disable-output-escaping="yes" select="Code"></xsl:value-of>
								<xsl:text disable-output-escaping="yes"> - </xsl:text>
							</xsl:if>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</strong>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					<div class="price">
						<del>
							<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
						</del>
						<span>
							<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
						</span>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>