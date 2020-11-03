<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsList">
		<div class="block-title">
			<div class="head-title">
				<h1>
					<xsl:value-of disable-output-escaping="yes" select="ZoneTitle"></xsl:value-of>
				</h1>
			</div>
			<div class="title-recruitment-1">
				<h2>
					<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
				</h2>
			</div>
		</div>
		<div class="row big-recruitment">
			<xsl:apply-templates select="News"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="col-lg-6">
			<div class="content_big_recruitment-1">
				<div class="title_staff">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title"></xsl:value-of>
					</a>
				</div>
				<div class="location_recruitment">
					<div class="icon_recruitment"><i class="ri-map-pin-2-fill"></i>
					</div>
					<a href="">
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</a>
				</div>
				<div class="content_small_recruitment-1">
					<ul>
						<li>
							<div class="agree_recruitment">
								<div class="icon_recruitment"><i class="ri-money-dollar-box-fill"></i>
								</div>
								<a href="">
									<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
								</a>
							</div>
						</li>
						<li>
							<div class="date_recruitment">
								<div class="icon_recruitment">
									<i class="ri-calendar-check-fill"></i>
								</div>
								<time>
									<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
								</time>
							</div>
						</li>
						<li>
							<div class="more-view">
								<a href="">
									<xsl:attribute name="href">
										<xsl:value-of select="Url"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="Title"></xsl:value-of>
									</xsl:attribute>
									<xsl:text disable-output-escaping="yes">Xem chi tiết</xsl:text>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>