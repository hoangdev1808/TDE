<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsDetail">
		<div class="wrap-main">
			<section class="cttintuc section">
				<div class="container">
					<div class="news-box">
						<div class="news-detail policy">
							<div class="title text-left">
								<h1>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h1>
							</div>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
							<div class="social">
								<div class="content-sub">
									<span>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</span>
								</div>
								<div class="social-item">
									<a class="f-icon facebook" target="_blank">
										<xsl:attribute name='href'>
											<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
											<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
										</xsl:attribute>
										<i class="fab fa-facebook-f"></i>
									</a>
									<a target="_blank" class="f-icon twitter">
										<xsl:attribute name='href'>
											<xsl:text>https://twitter.com/intent/tweet?text=</xsl:text>
											<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
										</xsl:attribute>
										<i class="fab fa-twitter"></i>
									</a>
									<a class="f-icon linked" target="_blank">
										<xsl:attribute name='href'>
											<xsl:text>https://www.linkedin.com/sharing/share-offsite/?url=</xsl:text>
											<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
										</xsl:attribute>
										<i class="fab fa-linkedin-in"></i>
									</a>
								</div>
							</div>
							<div class="content content-distance">
								<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</xsl:template>
</xsl:stylesheet>