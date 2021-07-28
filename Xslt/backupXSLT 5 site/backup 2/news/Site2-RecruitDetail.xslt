<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<section class="tuyen-dung-ct">
			<div class="container">
				<div class="row wrap-box">
					<div class="col-lg-9 col-md-12">
						<div class="box-left">
							<div class="title">
								<h3>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
									<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h3>
								<div class="social">
									<a target="_blank">
										<xsl:attribute name='href'>
											<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
											<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
										</xsl:attribute>
										<i class="ri-facebook-fill"></i>
									</a>
									<a target="_blank">
										<xsl:attribute name='href'>
											<xsl:text>https://twitter.com/intent/tweet?text=</xsl:text>
											<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
										</xsl:attribute>
										<i class="ri-twitter-fill"></i>
									</a>
									<a target="_blank">
										<xsl:attribute name='href'>
											<xsl:text>https://www.linkedin.com/sharing/share-offsite/?url=</xsl:text>
											<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
										</xsl:attribute>
										<i class="ri-linkedin-box-line"></i>
									</a>
								</div>
							</div>
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
						</div>
					</div>
					<div class="col-lg-3 col-md-12">
						<div class="box-right">
							<div class="r-1">
								<ul>
									<li>
										<em class="material-icons">chevron_right</em>
										<p>
											<strong>Địa điểm làm việc </strong>
											<span>
												<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/BriefContent"></xsl:value-of>
											</span>
										</p>
									</li>
									<li>
										<em class="material-icons">chevron_right</em>
										<p>
											<strong>Nộp hồ sơ qua email</strong>
											<span>tuyendungtvn@tokyodeli.com.vn</span>
										</p>
									</li>
								</ul>
							</div>
							<div class="r-2">
								<a class="button-ndut" data-toggle="modal" data-target="#staticBackdrop">
									<i class="ri-edit-2-fill"></i>
									Nộp đơn ứng tuyển
								</a>
								<a class="button-ndut">
									<xsl:attribute name='href'>
										<xsl:text disable-output-escaping="yes">/Data/Sites/2/media/tuyen-dung/mau-form-ung-tuyen.docx</xsl:text>
									</xsl:attribute>
									<i class="ri-download-2-line"></i>
									Tải form trực tuyến
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row wrap-box wrap-box-2">
					<div class="col-lg-9">
						<div class="box-left">
							<table class="table-1">
								<xsl:apply-templates select="/NewsDetail/NewsAttributes"></xsl:apply-templates>
							</table>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="box-lien-he-main">
							<div class="lh-wrap-2">
								<h3>Vị trí khác</h3>
								<ul>
									<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<iframe title="description">
							<xsl:attribute name='src'>
								<xsl:value-of  select="/NewsDetail/ApplyUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</iframe>
					</div>
				</div>
			</div>
		</section>
		<div class="index-page" id="js-page-verify" hidden="true"></div>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<tr>
			<td>
				<h3>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</h3>
			</td>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="NewsOther">
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title"></xsl:value-of>
			</a>
			<span>Hết hạn:
				<xsl:value-of disable-output-escaping="yes" select="FileUrl"></xsl:value-of>
			</span>
		</li>
	</xsl:template>
</xsl:stylesheet>