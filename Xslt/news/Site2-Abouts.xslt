<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<xsl:apply-templates select="/ZoneList/Zone[1]" mode="overview"></xsl:apply-templates>
			<xsl:apply-templates select="/ZoneList/Zone[2]" mode="normal-2"></xsl:apply-templates>
			<section class="g-3" id="g3">
				<xsl:apply-templates select="/ZoneList/Zone[3]" mode="special"></xsl:apply-templates>
			</section>
			<xsl:apply-templates select="/ZoneList/Zone[4]" mode="normal-4"></xsl:apply-templates>
			<xsl:apply-templates select="/ZoneList/Zone[5]" mode="normal-5"></xsl:apply-templates>
		</div>
		<section class="g-6" id="g6">
			<div class="container">
				<div class="box-content">
					<div class="title text-center">
						<a>
							<xsl:attribute name="href">
								<xsl:text>#g6</xsl:text>
							</xsl:attribute>
							<h2>
								<xsl:value-of disable-output-escaping="yes" select="/ZoneList/Zone[6]/Title"></xsl:value-of>
							</h2>
						</a>
					</div>
					<div class="row">
						<div class="col-xl-6 d-none d-lg-block"></div>
						<div class="col-xl-6">
							<xsl:apply-templates select="/ZoneList/Zone[6]" mode="award"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone" mode="normal-2">
		<xsl:apply-templates select="News" mode="normal-2">
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="normal-4">
		<xsl:apply-templates select="News" mode="normal-4">
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="normal-5">
		<xsl:apply-templates select="News" mode="normal-5">
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="overview">
		<xsl:apply-templates select="News" mode="overview"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="special">
		<div class="container p-0">
			<div class="wrapper">
				<div class="swiper-container g-3-wrapper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="img">
								<xsl:apply-templates select="News[1]" mode="special-img"></xsl:apply-templates>
							</div>
							<div class="content-wrapper">
								<div class="title">
									<h2>
										<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
									</h2>
								</div>
								<div class="wrapper">
									<xsl:apply-templates select="News[1]" mode="special"></xsl:apply-templates>
									<xsl:apply-templates select="News[2]" mode="special"></xsl:apply-templates>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="img">
								<xsl:apply-templates select="News[2]" mode="special-img"></xsl:apply-templates>
							</div>
							<div class="content-wrapper">
								<div class="title">
									<h2>
										<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
									</h2>
								</div>
								<div class="wrapper">
									<xsl:apply-templates select="News[1]" mode="special"></xsl:apply-templates>
									<xsl:apply-templates select="News[2]" mode="special"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="award">
		<div class="g-6-wrapper swiper-container">
			<div class="arrow-button">
				<!--<xsl:if test="count(News)>2">
					<div class="swiper-button-prev"> <span class="material-icons">navigate_before</span></div>
					<div class="swiper-button-next"> <span class="material-icons">navigate_next</span></div>
				</xsl:if>-->
			</div>
			<div class="swiper-wrapper">
				<xsl:apply-templates select="News" mode="award"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="normal-2">
		<section>
			<xsl:attribute name="class">g-2</xsl:attribute>
			<xsl:attribute name="id">g2</xsl:attribute>
			<div class="row">
				<div class="col-xl-6">
					<div class="box-content">
						<div class="title">
							<a>
								<xsl:attribute name="href">
									<xsl:text>#g2</xsl:text>
								</xsl:attribute>
								<h2>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h2>
							</a>
						</div>
						<div class="content">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<a>
						<xsl:attribute name="href">
							<xsl:text>#g2</xsl:text>
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
					</a>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News" mode="normal-4">
		<section>
			<xsl:attribute name="class">g-4</xsl:attribute>
			<xsl:attribute name="id">g4</xsl:attribute>
			<div class="row">
				<div class="col-xl-6">
					<div class="box-content">
						<div class="title">
							<a>
								<xsl:attribute name="href">
									<xsl:text>#g4</xsl:text>
								</xsl:attribute>
								<h2>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h2>
							</a>
						</div>
						<div class="content">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<a>
						<xsl:attribute name="href">
							<xsl:text>#g4</xsl:text>
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
					</a>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News" mode="normal-5">
		<section>
			<xsl:attribute name="class">g-5</xsl:attribute>
			<xsl:attribute name="id">g5</xsl:attribute>
			<div class="row">
				<div class="col-xl-6">
					<div class="box-content">
						<div class="title">
							<a>
								<xsl:attribute name="href">
									<xsl:text>#g5</xsl:text>
								</xsl:attribute>
								<h2>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h2>
							</a>
						</div>
						<div class="content">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<a>
						<xsl:attribute name="href">
							<xsl:text>#g5</xsl:text>
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
					</a>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News" mode="overview">
		<section>
			<xsl:attribute name="class">
				<xsl:text disable-output-escaping="yes">g-1</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">g-1</xsl:text>
			</xsl:attribute>
			<div class="row">
				<div class="col-xl-6">
					<div class="box-content">
						<div class="title">
							<a>
								<xsl:attribute name="href">
									<xsl:text>javascript:;</xsl:text>
								</xsl:attribute>
								<h2>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h2>
							</a>
						</div>
						<div class="content">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</div>
						<div class="more">
							<a>
								<xsl:attribute name="href">
									<xsl:text>javascript:;</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="data-fancybox">
									<xsl:text>popup</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="data-src">#gioithieu-
									<xsl:value-of select="position()"/>
								</xsl:attribute>
								<p>
									<xsl:value-of disable-output-escaping="yes" select="/ZoneList/TvnViewMore"></xsl:value-of>
								</p>
								<span class="material-icons">arrow_right_alt</span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<a href="javascript:;">
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
					</a>
				</div>
			</div>
			<div class="g-popup" style="display:none">
				<xsl:attribute name="id">gioithieu-
					<xsl:value-of select="position()"/>
				</xsl:attribute>
				<div class="col-xl-12 mx-auto">
					<div class="row align-items-center">
						<div class="col-xl-6 p-0">
							<div class="wrapper">
								<div class="title">
									<h2>
										<xsl:value-of select="Title"></xsl:value-of>
										<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
									</h2>
								</div>
								<div class="content">
									<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
								</div>
							</div>
						</div>
						<div class="col-xl-6 p-0">
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
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News" mode="special-img">
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		</img>
	</xsl:template>
	<xsl:template match="News" mode="special">
		<div class="content">
			<h3>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			</h3>
			<p>
				<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
			</p>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="award">
		<div class="swiper-slide">
			<a>
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
			</a>
			<div class="content">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>