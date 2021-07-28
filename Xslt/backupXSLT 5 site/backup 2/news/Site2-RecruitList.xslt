<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<div class="position"> 
			<div class="title text-center">
				<h2><xsl:value-of disable-output-escaping="yes" select="/NewsList/ModuleTitle"></xsl:value-of></h2>
			</div>
			<div class="row"> 
				<div class="col-xl-12">
					<div class="wrapper"> 																				
						<xsl:apply-templates select="/NewsList/News[position() &lt; 9]"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="News">
		<div class="list-item"> 
			<div class="name">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>					
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</h3>
				</a>
			</div>
			<div class="place"> <span class="material-icons">room</span>
				<p>
					<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
				</p>
			</div>
			<div class="content">
				<div class="salary"> <span class="material-icons">local_atm</span>
					<p>Thỏa thuận </p>
				</div>
				<div class="date"> <span class="material-icons">event_available</span>
					<p>
						<xsl:value-of disable-output-escaping="yes" select="FileUrl"></xsl:value-of>
					</p>
				</div>						
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>				
					Xem chi tiết
				</a>
			</div>
		</div>	
	
	</xsl:template>

</xsl:stylesheet>