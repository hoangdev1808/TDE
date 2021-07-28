<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<h3 class="section-title text-center">
			<xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
		</h3>
		<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>		
	</xsl:template>
	
	<xsl:template match="News">
		<div class="row wrap-box">
			<xsl:attribute name="id">id<xsl:value-of select="NewsId"></xsl:value-of></xsl:attribute>		
			<div class="col-xl-3 col-lg-4 col-md-12 order1 box-p">
				<div class="box-left">
					<div class="box-content">
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h3>
						<p>
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</p>
					</div>
					<a class="button-tht">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>						
						Tìm hiểu thêm<span class="material-icons">arrow_right_alt</span>
					</a>					
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-12 order2 box-p">
				<div class="box-right">
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
		</div>	
	</xsl:template>	
	

</xsl:stylesheet>