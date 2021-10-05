<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/NewsList">
      <xsl:apply-templates select="News"/>
  </xsl:template>

  <xsl:template match="News">
    <section class="block_s-1">
      <xsl:attribute name="class">
        <xsl:text>block_s-</xsl:text>
        <xsl:value-of select="position()"/> 
      </xsl:attribute>
      <div class="container"> 
         <xsl:choose> 
             <xsl:when test = "position() = 1"> 
                <xsl:apply-templates select="." mode="template-1"/>
             </xsl:when> 
             <xsl:otherwise> 
                <xsl:apply-templates select="." mode="template-other"/>
             </xsl:otherwise>  
          </xsl:choose> 
      </div>
    </section>

  </xsl:template>

  <xsl:template match="News" mode="template-1">
    <div class="block-title">
      <div class="head-title">
        <h1>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </h1>
      </div>
    </div>
    <div class="row">
      <div class="col-12 col-md-4 col-lg-4">
        <div class="card_img">
          <div class="img">
            <img src="./img/s-1/tinhhoa-1.png" alt="">
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-4 col-lg-4">
        <div class="big-content">
          <div class="content_s-1">
            <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <div class="btn-view-more">
            <a href="">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title"> 
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
              <xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes"/>
            </a>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-4 col-lg-4">
        <div class="row">
          <div class="col-6 col-md-6 col-lg-6">
            <div class="img_small"><img src="./img/s-1/tinhoa-2.png" alt="">
              <xsl:attribute name="src">
                <xsl:value-of select="NewsImages[2]/ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img></div>
          </div>
          <div class="col-6 col-md-6 col-lg-6">
            <div class="img_small"><img src="./img/s-1/tinhoa-3.png" alt="">
              <xsl:attribute name="src">
                <xsl:value-of select="NewsImages[3]/ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img></div>
          </div>
          <div class="col-12 col-md-12 col-lg-12">
            <div class="img_big">
              <img src="./img/s-1/tinhhoa-4.png" alt=""> 
              <xsl:attribute name="src"> 
                <xsl:value-of select="NewsImages[4]/ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt"> 
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
            </div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="template-other">
    <div class="block-title">
      <div class="head-title">
        <h1>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </h1>
      </div>
      <div class="caption">
        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-lg-8">
        <div class="tinhthan_slide">
          <div class="swiper-container">
            <div class="swiper-wrapper">
                <xsl:apply-templates select="NewsImages"/>
            </div>
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
      <div class="col-md-4 col-lg-4">
        <div class="block_content">
          <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of> 
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="NewsImages" > 
    <div class="swiper-slide">
      <div class="img">
        <img src="./img/about/gian-1.png" alt="">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </xsl:attribute>
        </img>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>