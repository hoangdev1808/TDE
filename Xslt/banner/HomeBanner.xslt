<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/BannerList">
    <section class="home-banner">
      <div class="container-fuild">
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <xsl:apply-templates select="Banner"></xsl:apply-templates>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Banner">
    <div class="swiper-slide">
      <div class="wrapper">
        <a>
          <xsl:if test="Url != ''">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </xsl:if>
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
      <div class="caption">
        <h2 class="title-caption">
          <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </h2>
        <div class="text">
          <xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
        </div>
        <xsl:if test="Url != ''">
          <div class="btn-view-more">
            <a href="">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:text disable-output-escaping="yes">Tìm hiểu thêm</xsl:text>
              <span class="material-icons">trending_flat</span>
            </a>
          </div>
        </xsl:if>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>