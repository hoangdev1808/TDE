<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ProductList">
		<div class="block_name_category">
			<div class="name_category">
				<xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<div class="location-filter"></div>
		</div>
		<div class="row ajaxresponse">
			<xsl:apply-templates select="Product"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-xl-4 col-md-6 col-6">
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<div class="card_img">
				<xsl:if test="OldPrice != ''">
					<div class="top-wrap">
						<div class="discount-percent">
							<xsl:variable name='price'>
								<xsl:value-of select="substring-before(Price, ' ')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='priceNumber'>
								<xsl:value-of select="translate($price, '.', '')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='oldprice'>
								<xsl:value-of select="substring-before(OldPrice, ' ')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='oldPriceNumber'>
								<xsl:value-of select="translate($oldprice, '.', '')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='percentage'>
								<xsl:value-of select="100 - ($priceNumber div $oldPriceNumber)*100"></xsl:value-of>
							</xsl:variable>
							<span>
								<xsl:text>-</xsl:text>
								<xsl:value-of select="ceiling($percentage)"></xsl:value-of>
								<xsl:text>%</xsl:text>
							</span>
						</div>
					</div>
				</xsl:if>
				<div class="img">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
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
				</div>
				<div class="code-name">
					<xsl:value-of select="Code" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="name_food">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="item-money">
					<ul>
						<li>
							<div class="discount">
								<p>
									<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
								</p>
							</div>
						</li>
						<li>
							<div class="price">
								<p>
									<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
								</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="sub-text">
					<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>