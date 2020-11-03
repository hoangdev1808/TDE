<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsList">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="card_img_news_image_left">
						<xsl:apply-templates select="News[1]" mode="Big"></xsl:apply-templates>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<xsl:apply-templates select="News[position() > 1 and position() &lt; 6]" mode="Small">
						</xsl:apply-templates>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 news_image_left">
					<div class="row">
						<xsl:apply-templates select="News[position() > 5 and position() &lt; 10]" mode="Small">
						</xsl:apply-templates>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card_img_news_image_right">
						<xsl:apply-templates select="News[10]" mode="Big"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="Big">
		<div class="block-item">
			<div class="item__img">
				<a href="">
					<xsl:attribute name="data-fancybox">
						
						<xsl:call-template name="substring-after-last">
							<xsl:with-param name="input" select="Url" />
							<xsl:with-param name="marker" select="'/'" />
						</xsl:call-template>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
					<div class="album">
						<div class="caption">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</div>
					</div>
				</a>
			</div>
			<div class="item__img-hover">
				<div class="content">
					<div class="icon">
						<em class="material-icons">photo_camera</em>
						<div class="desc">
							<h4>
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</h4>
						</div>
					</div>
				</div>
			</div>
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
		</div>
		<div style="display: none;">
			<xsl:apply-templates select="NewsImages">
			</xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="Small">
		<div class="col-12 col-md-6 col-lg-6">
			<div class="block-item">
				<div class="item__img">
					<a href="">
						<xsl:attribute name="data-fancybox">
							
							<xsl:call-template name="substring-after-last">
								<xsl:with-param name="input" select="Url" />
								<xsl:with-param name="marker" select="'/'" />
							</xsl:call-template>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
						<div class="album">
							<div class="caption">
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</div>
						</div>
					</a>
				</div>
				<div class="item__img-hover">
					<div class="content">
						<div class="icon">
							<em class="material-icons">photo_camera</em>
							<div class="desc">
								<h4>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<div style="display: none;">
				<xsl:apply-templates select="NewsImages">
				</xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsImages">
		<xsl:if test="position() > 1">
			<a>
				<xsl:attribute name="data-fancybox">
					
					<xsl:call-template name="substring-after-last">
							<xsl:with-param name="input" select="../Url" />
							<xsl:with-param name="marker" select="'/'" />
						</xsl:call-template>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</a>
		</xsl:if>

	</xsl:template>

	<xsl:template name="substring-after-last">
		<xsl:param name="input" />
		<xsl:param name="marker" />
		<xsl:choose>
			<xsl:when test="contains($input,$marker)">
				<xsl:call-template name="substring-after-last">
					<xsl:with-param name="input" select="substring-after($input,$marker)" />
					<xsl:with-param name="marker" select="$marker" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$input" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>