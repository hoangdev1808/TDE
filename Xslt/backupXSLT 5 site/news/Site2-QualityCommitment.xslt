<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<h3 class="text-center section-title">
			<xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
		</h3>
		<div class="wrap-slide">
			<div class="swiper-container">
				<div class="swiper-wrapper">				
					<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>					
				</div>
			</div>
			<div class="wrap-button-sl">
				<div class="swiper-prev"><span class="material-icons rota">arrow_forward_ios	</span></div>
				<div class="swiper-next"><span class="material-icons">arrow_forward_ios</span></div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="News">
		<div class="swiper-slide"> 
			<div class="row wrap-post"> 
				<div class="col-md-12 col-lg-6 wrap-col">
					<div class="box-left">
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
				</div>
				<div class="col-md-12 col-lg-6 wrap-col">
					<div class="box-right">
						<h2>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h2>
						<p>
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</p>
					</div>
				</div>
			</div>
		</div>		
	</xsl:template>

</xsl:stylesheet>