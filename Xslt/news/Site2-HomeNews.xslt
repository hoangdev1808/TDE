<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<h3 class="section-title">
			<xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
		</h3>
		<div class="row"> 
			<xsl:apply-templates select="/NewsList/News[1]" mode="bigbanner"></xsl:apply-templates>
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>
	
	<xsl:template match="News" mode="bigbanner">
		<div class="col-lg-8 col-md-12">
			<div class="box-big-post">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>	  					
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
					<div class="box-text">
						<p>BẢN TIN TVN</p>
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h3>
						<span><xsl:value-of select="CreatedDD"/>.<xsl:value-of select="CreatedMM"/>.<xsl:value-of select="CreatedYYYY"/></span>
					</div>
				</a>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<xsl:if test="position() &gt; 1">
			<div class="col-lg-4 col-md-6">
				<div class="box-small-post">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>						
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
						<div class="box-text"> 
							<p>BẢN TIN TVN</p>
							<div class="mota">
								<h3 class="lcl lcl-3"> 
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</h3>
							</div>
							<span><xsl:value-of select="CreatedDD"/>.<xsl:value-of select="CreatedMM"/>.<xsl:value-of select="CreatedYYYY"/></span>
						</div>
					</a>
				</div>
			</div>
		</xsl:if>  
	</xsl:template>	 	

</xsl:stylesheet>