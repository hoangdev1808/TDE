<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">		
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>				
			</div>
		</div>		
		
	</xsl:template>
	
	<xsl:template match="News">
		<div class="swiper-slide">
			<div class="box-cate">
				<a>
					<xsl:attribute name="href"><xsl:value-of select="Url"></xsl:value-of><!--/linh-vuc-hoat-dong#id<xsl:value-of select="NewsId"></xsl:value-of>--></xsl:attribute>
					<xsl:attribute name="target">
					  <xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>				
					<div class="img">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>						
						</img>
					</div>
					<div class="box-text">
						<p>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</div>
				</a>
			</div>
		</div>	
	</xsl:template>	

</xsl:stylesheet>