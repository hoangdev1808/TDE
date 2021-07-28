<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<div class="block_home-2">
			<div class="container-custom">
				<div class="container">
					<div class="block-title">
						<div class="head-title">
							<h1>
								<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
							</h1>
						</div>
						<div class="text-2">
							<p>
								<xsl:value-of disable-output-escaping="yes" select="Zone/Description"></xsl:value-of>
							</p>
						</div>
					</div>
					<div class="row">
						<xsl:apply-templates select="Zone/Zone"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="col-6 col-md-6 col-lg-3">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<div class="content-home-2">
					<div class="title-home">
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</div>
					<div class="title-zone-home">
						<span>
							<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
						</span>
					</div>
					<div class="bg-shape">
						<div class="img">
							<img >
								<xsl:attribute name="src">
									<xsl:value-of select="SecondImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
							</img>
						</div>
					</div>
					<div class="card_img object-fit-img">
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
			</a>
		</div>
	</xsl:template>

</xsl:stylesheet>