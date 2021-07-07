<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<div class="row"> 
			<div class="col-lg-6 col-md-12">			
				<xsl:apply-templates select="/NewsList/News[1]" mode="big"></xsl:apply-templates>											
			</div>
			<div class="col-lg-6 col-md-12">
				<div class="row box-small"> 
					<xsl:apply-templates select="/NewsList/News[position() &gt; 1 and position() &lt; 6]"></xsl:apply-templates>
				</div>
			</div>
		</div>
		<div class="row"> 
			<div class="col-lg-6 col-md-12">
				<div class="row box-small">				
					<xsl:apply-templates select="/NewsList/News[position() &gt; 5 and position() &lt; 10]"></xsl:apply-templates>					
				</div>
			</div>
			<div class="col-lg-6 col-md-12">
				<xsl:apply-templates select="/NewsList/News[10]" mode="big"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="News" mode="big">
		<div class="box-big">
			<a data-fancybox="video">
				<xsl:attribute name="href">
				  <xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>			
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
				<div class="overlay-button">
					<span class="material-icons">play_circle_outline</span>
					<p><xsl:value-of select="Title"></xsl:value-of></p>
				</div>
			</a>
		</div>
	</xsl:template>		
	
	<xsl:template match="News">
		<div class="col-md-6">
			<div class="box-video">
				<a data-fancybox="video">
					<xsl:attribute name="href">
					  <xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>				
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
					<div class="overlay-button">
						<span class="material-icons">play_circle_outline</span>
						<p><xsl:value-of select="Title"></xsl:value-of></p>
					</div>
				</a>
			</div>
		</div>		
	</xsl:template>		
	

</xsl:stylesheet>