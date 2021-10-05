<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/NewsList">
		<xsl:apply-templates select="News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<div class="row bg-member">
			<div class="col-12 col-md-6 col-lg-6">
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
			</div>
			<div class="col-12 col-md-6 col-lg-6 fl">
				<div class="member">
					<div class="title-member">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<div class="text-member">
						<p>
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</div>
					<div class="readmore">
						<a>
							<!-- <xsl:attribute name="data-toggle">
                                <xsl:text>modal</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="data-target">
                                <xsl:text disable-output-escaping="yes">#popup-</xsl:text>
                                <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="href">
                                <xsl:text disable-output-escaping="yes">javscript: void(0);</xsl:text>
                            </xsl:attribute> -->


							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>

							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
