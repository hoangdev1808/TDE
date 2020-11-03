<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="News">
		<div class="row sec-1">
			<div class="col-xl-6">
				<div class="img"> 
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</xsl:attribute>  													
					</img>
				</div>
			</div>
			<div class="col-xl-6"> 
				<div class="article-wrapper">
					<div class="title"> 
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h1>
					</div>
					<div class="content"> 
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>