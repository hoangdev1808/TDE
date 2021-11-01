<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ProductDetail">

		<section class="block_menu-detail">
			<div class="container">
				<div class="row">
					<div class="col-xl-6 col-lg-6">
						<div class="card_img">
							<xsl:if test="OldPrice !=''">

								<div class="top-wrap">
									<div class="discount">

										<xsl:variable name='price'>
											<xsl:value-of select="substring-before(Price, ' ')"></xsl:value-of>
										</xsl:variable>
										<xsl:variable name='priceNumber'>
											<xsl:value-of select="translate($price, '.', '')"></xsl:value-of>
										</xsl:variable>
										<xsl:variable name='oldprice'>
											<xsl:value-of select="substring-before(OldPrice, ' ')">
											</xsl:value-of>
										</xsl:variable>
										<xsl:variable name='oldPriceNumber'>
											<xsl:value-of select="translate($oldprice, '.', '')"></xsl:value-of>
										</xsl:variable>
										<xsl:variable name='percentage'>
											<xsl:value-of select="100 - ($priceNumber div $oldPriceNumber)*100">
											</xsl:value-of>
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
								<img src="./img/s-5/menun-detail.png" alt="">
								<xsl:attribute name="src">
									<xsl:value-of select="ProductImages[1]/ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="right-food">
							<div class="name_food-detail">
								<h2>
									<xsl:value-of select="Title"></xsl:value-of>
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h2>
							</div>
							<div class="description_food">
								<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
							</div>
							<div class="block_price">
								<ul>
									<li>
										<div class="price">
											<p>
												<xsl:value-of select="Price" disable-output-escaping="yes">
												</xsl:value-of>
											</p>
										</div>
									</li>
									<li>
										<div class="discount">
											<p>
												<xsl:value-of select="OldPrice" disable-output-escaping="yes">
												</xsl:value-of>
											</p>
										</div>
									</li>
									<xsl:if test="DiscountAmount != ''">
										<li>
											<div class="discount-zone">

												<p>-<xsl:value-of select="DiscountAmount" disable-output-escaping="yes">
													</xsl:value-of>%</p>
											</div>
										</li>
									</xsl:if>
								</ul>
							</div>
							<div class="icon-contact">
								<a href="tel:+1900234504">

									<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/ContactText">
									</xsl:value-of>

									<i class="ri-phone-fill"></i>
								</a>
								<a href="/lien-he">

									<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/OrderText">
									</xsl:value-of>
									<i class="ri-shopping-cart-2-line"></i>
								</a>
								<a href="/he-thong-cua-hang">

									<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/DealerText">
									</xsl:value-of>

									<i class="ri-map-pin-2-fill"></i>
								</a>
							</div>
							<xsl:if test="count(LinkShops) > 0">
								<div class="link-website">
									<ul>
										<xsl:apply-templates select="LinkShops" />
									</ul>
								</div>
							</xsl:if>
							<div class="icon-contact-zone">
								<a href="" target="_blank">
									<xsl:attribute name="href">
										<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
										<xsl:value-of select="FullUrl" />
									</xsl:attribute>
									<div class="icon"><i class="ri-facebook-fill"></i></div>
								</a>
								<a href="" target="_blank">
									<xsl:attribute name="href">
										<xsl:text>https://twitter.com/home?status=</xsl:text>
										<xsl:value-of select="FullUrl" />
									</xsl:attribute>
									<div class="icon"><i class="ri-twitter-fill"></i></div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="other_food">
			<div class="container">
				<div class="block-title">
					<div class="head-title-zone">
						<h2>
							<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/OtherDishText">
							</xsl:value-of>
						</h2>
					</div>
				</div>
				<div class="menu-detail-swiper-wrapper">

					<div class="swiper-container menu-detail-slide">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="ProductOther" />
						</div>
					</div>
					<div class="swipe-nav-wrap">
						<div class="nav-arrow-prev"><em class="ri-arrow-left-line"></em></div>
						<div class="nav-arrow-next"><em class="ri-arrow-right-line"></em></div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="LinkShops">
		<li>
			<a href="javascript:void(0)" target="_blank">
				<xsl:attribute name="href">
					<xsl:value-of select="Url" />
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title" />
				</xsl:attribute>
				<img src="./img/sanphamct/shop-1.png" alt="">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl" />
				</xsl:attribute>
				</img>
			</a>
		</li>
	</xsl:template>
	<xsl:template match="ProductOther">
		<div class="swiper-slide">
			<div class="wrapper">
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
						<img src="./img/s-5/menun-detail.png" alt="">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
				</div>
				<div class="content-other">
					<div class="title-menu"><a href="">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</a></div>
					<div class="discount-slide">
						<p>
							<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</div>
					<div class="price-slide">
						<p>
							<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</div>
					<div class="sub-text">
						<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>