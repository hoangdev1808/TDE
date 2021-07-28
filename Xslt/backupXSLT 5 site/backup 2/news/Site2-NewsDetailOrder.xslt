<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<section class="pages-news_detail">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<section class="td-1">
							<div class="box-content">
								<div class="article-header">
									<div class="title">
										<h1>
											<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
											<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
										</h1>
									</div>
									<div class="wrapper">
										<div class="date">
											<p>
												<xsl:value-of select="/NewsDetail/CreatedDD"/>.
												<xsl:value-of select="/NewsDetail/CreatedMM"/>.
												<xsl:value-of select="/NewsDetail/CreatedYYYY"/>
											</p>
										</div>
										<div class="icon">
											<a target="_blank">
												<xsl:attribute name='href'>
													<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
													<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
												</xsl:attribute>
												<i class="fab fa-facebook-f">
												</i>
											</a>
											<a target="_blank">
												<xsl:attribute name='href'>
													<xsl:text>https://www.linkedin.com/sharing/share-offsite/?url=</xsl:text>
													<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
												</xsl:attribute>
												<i class="fab fa-linkedin-in">
												</i>
											</a>
											<a target="_blank">
												<xsl:attribute name='href'>
													<xsl:text>https://twitter.com/intent/tweet?text=</xsl:text>
													<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
												</xsl:attribute>
												<i class="fab fa-twitter">
												</i>
											</a>
										</div>
									</div>
								</div>
								<div class="article-body">
									<!--<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/BriefContent"></xsl:value-of>-->
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</section>
		<div class="index-page" id="js-page-verify" hidden="true"></div>
	</xsl:template>
</xsl:stylesheet>