<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ZoneList">
		<section class="block_recruitment-2">
			<div class="container">
				<div class="title-recruitment">
					<h2>
						<xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/Title"></xsl:value-of>
					</h2>
				</div>
				<div class="row">
					<div class="col-lg-8">
						<div class="text-recruitment">
							<xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/BriefContent">
							</xsl:value-of>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="block_recruitment-3">
			<div class="container">
				<div class="title-recruitment-3">
					<h2>
						<xsl:value-of disable-output-escaping="yes" select="Zone[2]/Title"></xsl:value-of>
					</h2>
				</div>
				<div class="row">
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card_img-big">
							<div class="img-big">
								<img>
								<xsl:attribute name="src">
									<xsl:value-of select="Zone[2]/News[1]/ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Zone[2]/News[1]/Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<div class="content-recruitment">
								<div class="title">
									<h3>
										<xsl:value-of disable-output-escaping="yes" select="Zone[2]/News[1]/Title">
										</xsl:value-of>
										<xsl:value-of select="Zone[2]/News[1]/EditLink" disable-output-escaping="yes">
										</xsl:value-of>
									</h3>
								</div>
								<div class="title-zone">
									<p>
										<xsl:value-of disable-output-escaping="yes"
											select="Zone[2]/News[1]/BriefContent">
										</xsl:value-of>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6 col-lg-6">
						<div class="row">
							<div class="col-lg-12">
								<div class="card_img-small top">
									<div class="img-small">
										<img>
										<xsl:attribute name="src">
											<xsl:value-of select="Zone[2]/News[2]/ImageUrl"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="alt">
											<xsl:value-of select="Zone[2]/News[2]/Title"></xsl:value-of>
										</xsl:attribute>
										</img>
									</div>
									<div class="content-recruitment">
										<div class="title">
											<h3>
												<xsl:value-of disable-output-escaping="yes"
													select="Zone[2]/News[2]/Title">
												</xsl:value-of>
												<xsl:value-of select="Zone[2]/News[2]/EditLink"
													disable-output-escaping="yes"></xsl:value-of>
											</h3>
										</div>
										<div class="title-zone">
											<p>

												<xsl:value-of disable-output-escaping="yes"
													select="Zone[2]/News[2]/BriefContent">
												</xsl:value-of>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-md-6 col-lg-6">
								<div class="card_img-small left">
									<div class="img-small">
										<img>
										<xsl:attribute name="src">
											<xsl:value-of select="Zone[2]/News[3]/ImageUrl"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="alt">
											<xsl:value-of select="Zone[2]/News[3]/Title"></xsl:value-of>
										</xsl:attribute>
										</img>
									</div>
									<div class="content-recruitment">
										<div class="title">
											<h3>
												<xsl:value-of disable-output-escaping="yes"
													select="Zone[2]/News[3]/Title">
												</xsl:value-of>
												<xsl:value-of select="Zone[2]/News[3]/EditLink"
													disable-output-escaping="yes"></xsl:value-of>
											</h3>
										</div>
										<div class="title-zone">
											<p>

												<xsl:value-of disable-output-escaping="yes"
													select="Zone[2]/News[3]/BriefContent">
												</xsl:value-of>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-md-6 col-lg-6">
								<div class="card_img-small right">
									<div class="img-small">
										<img>
										<xsl:attribute name="src">
											<xsl:value-of select="Zone[2]/News[4]/ImageUrl"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="alt">
											<xsl:value-of select="Zone[2]/News[4]/Title"></xsl:value-of>
										</xsl:attribute>
										</img>
									</div>
									<div class="content-recruitment">
										<div class="title">
											<h3>
												<xsl:value-of disable-output-escaping="yes"
													select="Zone[2]/News[4]/Title">
												</xsl:value-of>
												<xsl:value-of select="Zone[2]/News[4]/EditLink"
													disable-output-escaping="yes"></xsl:value-of>
											</h3>
										</div>
										<div class="title-zone">
											<p>

												<xsl:value-of disable-output-escaping="yes"
													select="Zone[2]/News[4]/BriefContent">
												</xsl:value-of>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

</xsl:stylesheet>