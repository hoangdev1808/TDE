<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductDetail">
		<section class="thuc-don-ct">
			<div class="container">
				<div class="thuc-don-ct-1">
					<div class="row">
						<div class="col-lg-6">
							<div class="img">
								<a>
									<xsl:attribute name="data-fancybox">
										<xsl:text disable-output-escaping="yes">Images</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="href">
										<xsl:value-of select="Url"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="Title"></xsl:value-of>
									</xsl:attribute>
									<img class="lazyload">
										<xsl:attribute name="data-src">
											<xsl:value-of select="ProductImages[1]/ImageUrl"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="alt">
											<xsl:value-of select="Title"></xsl:value-of>
										</xsl:attribute>
									</img>
								</a>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="wrap-text">
								<h2>
									<!-- <xsl:value-of disable-output-escaping="yes" select="ProductId"></xsl:value-of> -->
									<!-- <xsl:text disable-output-escaping="yes"> - </xsl:text> -->
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								<div class="price">
									<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
								</div>
								<div class="wrap-des">
									<div class="wrap-left">
										<span>
											<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/ConsistsOf"></xsl:value-of>
										</span>
									</div>
									<div class="wrap-right">
										<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</div>
								</div>
								<div class="line"></div>
								<div class="wrap-buy">
									<a class="button-order" href="#">
										<xsl:attribute name="title">
											<xsl:value-of select="Title"></xsl:value-of>
										</xsl:attribute>
										<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/BuyNowText"></xsl:value-of>
									</a>
									<div class="wrap-list-buy ver-ios">
										<div class="wrap-icon">
											<a href="https://apps.apple.com/vn/app/grab-si%C3%AAu-%E1%BB%A9ng-d%E1%BB%A5ng/id647268330?l=vi">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/gf.png" alt=""/>
											</a>
											<a href="https://shopeefood.vn/ho-chi-minh/tokyo-deli-tran-hung-dao">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/now.png" alt=""/>
											</a>
											<a href="https://apps.apple.com/vn/app/baemin-food-delivery-app/id1458845623">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/bae.png" alt=""/>
											</a>
											<a href="https://apps.apple.com/vn/app/gojek/id944875099">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/goj.png" alt=""/>
											</a>
										</div>
									</div>
									<div class="wrap-list-buy ver-android">
										<div class="wrap-icon">
											<a href="https://play.google.com/store/apps/details?id=com.grabtaxi.passenger">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/gf.png" alt=""/>
											</a>
											<a href="https://shopeefood.vn/ho-chi-minh/tokyo-deli-tran-hung-dao">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/now.png" alt=""/>
											</a>
											<a href="https://play.google.com/store/apps/details?id=com.woowahan.vn.baemin">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/bae.png" alt=""/>
											</a>
											<a href="https://play.google.com/store/apps/details?id=com.gojek.app">
												<img src="/Data/Sites/5/skins/default/assets/thucdon-ct/goj.png" alt=""/>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="thuc-don-ct-2 section">
				<div class="container">
					<div class="section-title">
						<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/OtherDishText"></xsl:value-of>
					</div>
					<div class="wrap-slide">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductOther"></xsl:apply-templates>
							</div>
						</div>
						<!-- <div class="wrap-button-slide">
							<div class="swiper-prev swipe-button-1">
								<em class="material-icons">arrow_back</em>
							</div>
							<div class="swiper-next swipe-button-1">
								<em class="material-icons">arrow_forward</em>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="LinkShops">
		<a href="">
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<img src="./assets/thucdon-ct/goj.png" alt="" width="45">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</a>
	</xsl:template>
	<xsl:template match="ProductOther">
		<div class="swiper-slide">
			<a class="wrap-product">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<div class="img">
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="wrap-text">
					<strong>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</strong>
					<div class="price">
						<del>
							<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
						</del>
						<span>
							<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
						</span>
					</div>
				</div>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>