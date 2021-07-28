<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsDetail">
		<section class="hr-detail" style="padding: 0;">
			<div class="row">
				<div class="col-12 col-md-7 col-lg-9 hr-detail-top">
					<div class="card_title_hr_detail">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<div class="social-network-share">
							<div class="icon">
								<a href="#">
									<xsl:attribute name="href">
										<xsl:text disable-output-escaping="yes">
											https://www.facebook.com/sharer/sharer.php?u=
										</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="FullUrl">
										</xsl:value-of>
									</xsl:attribute>
									<span class="mdi mdi-facebook"></span>
								</a>
								<a href="#">
									<xsl:attribute name="href">
										<xsl:text disable-output-escaping="yes">
											https://www.linkedin.com/shareArticle?mini=true&amp;url=
										</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="FullUrl">
										</xsl:value-of>
									</xsl:attribute>
									<span class="ri-linkedin-fill"></span>
								</a>
								<a href="#">
									<xsl:attribute name="href">
										<xsl:text disable-output-escaping="yes">
											https://twitter.com/home?status=
										</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="FullUrl">
										</xsl:value-of>
									</xsl:attribute>
									<span class="fab fa-twitter"></span>
								</a>
							</div>
						</div>
					</div>
					<div class="card_body_hr_detail">
						<xsl:value-of disable-output-escaping="yes" select="NewsAttributes[1]/Content"></xsl:value-of>
					</div>
				</div>
				<div class="col-12 col-md-5 col-lg-3 bg-right-detail-top">
					<div class="right-hr-detail">
						<ul>
							<li>
								<div class="card_title_hr-detail">
									<div class="icon"><i class="ri-arrow-right-s-line"></i></div>
									<h3>địa điểm làm việc</h3>
								</div>
								<div class="card_title_zone_hr-detail">
									<p>26C Lê Quốc Hưng, Phường 12, Quận 4, TP.HCM</p>
								</div>
							</li>
							<li>
								<div class="card_title_hr-detail">
									<div class="icon"><i class="ri-arrow-right-s-line"></i></div>
									<h3>nộp qua hồ sơ email</h3>
								</div>
								<div class="card_title_zone_hr-detail">
									<p>tuyendungtvn@tokyodeli.com.vn</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="form_apply_hr_detail">
						<div class="apply-form">
							<div class="btn button-apply">
								<div class="icon">
									<i class="ri-edit-2-fill"></i>
								</div>
								<a href="" data-fancybox="" data-type="iframe">
									<xsl:attribute name="data-src">
										<xsl:value-of select="ApplyUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:text disable-output-escaping="yes">nộp đơn ứng tuyển</xsl:text>
								</a>
							</div>
							<div class="btn button-download">
								<div class="icon">
									<i class="ri-download-2-line"></i>
								</div>
								<a href="">Tải form ứng tuyển</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-md-7 col-lg-9">
					<xsl:apply-templates select="NewsAttributes[position() > 1]"></xsl:apply-templates>
				</div>
				<div class="col-12 col-md-5 col-lg-3">
					<div class="bg-right-detail-bottom">
						<div class="right-hr-detail-2">
							<div class="title-right-hr-detail-2">
								<h3>liên hệ</h3>
							</div>
							<ul>
								<li>
									<p>Mọi thắc mắc xin liên hệ qua email:</p>
									<p>tuyendungtvn@tokyodeli.com.vn</p>
								</li>
								<li>
									<p>Hoặc số điện thoại:</p>
									<p>02839431502</p>
								</li>
							</ul>
						</div>
					</div>
					<div class="bg-right-detail-bottom-2">
						<div class="right-hr-detail-3">
							<div class="title-right-hr-detail-3">
								<h3>vị trí khác</h3>
							</div>
							<ul>
								<xsl:apply-templates select="NewsOther"></xsl:apply-templates>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="NewsAttributes">
		<div class="content-hr-detail-bottom">
			<div class="title-hr-detail-bottom">
				<h2>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</h2>
			</div>
			<div class="desc-hr-detail-bottom">
				<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsOther">
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title"></xsl:value-of>
			</a>
			<p>
				<xsl:text disable-output-escaping="yes">Hết hạn: </xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
			</p>
		</li>
	</xsl:template>

</xsl:stylesheet>