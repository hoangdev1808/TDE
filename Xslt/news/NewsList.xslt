<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/NewsList">
    <div class="container">
      <div class="row">
        <div class="col-12 col-md-6 col-lg-6">
          <xsl:apply-templates select="News[1]" mode="Big"></xsl:apply-templates>
        </div>
        <div class="col-12 col-md-6 col-lg-6">
          <div class="row">
            <xsl:apply-templates select="News[position() > 1 and position() &lt; 5]" mode="Side"></xsl:apply-templates>
          </div>
        </div>
      </div>
      <div class="row">
        <xsl:apply-templates select="News[position() > 4]" mode="Small"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="Big">
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="Url"></xsl:value-of>
      </xsl:attribute>
      <xsl:attribute name="title">
        <xsl:value-of select="Title"></xsl:value-of>
      </xsl:attribute>
      <div class="big_img_news-list">
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
    </a>
    <div class="card_body">
      <div class="content_news-list">
        <div class="date">
          <time>
            <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
          </time>
        </div>
        <div class="card_title_news-list">
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title"></xsl:value-of>
          </a>
          <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
        </div>
        <div class="card_title_zone_news-list">
          <p>
            <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
          </p>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="Side">
    <div class="col-md-12 col-lg-12">
      <div class="small-food">
        <div class="new-img">
          <div class="img opacity">
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
        <div class="content-food-news">
          <div class="date">
            <time>
              <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
            </time>
          </div>
          <div class="caption">
            <p>
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title"></xsl:value-of>
              </a>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </p>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="Small">
    <div class="col-md-6 col-lg-4">
      <div class="card_img">
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
      <div class="card_body">
        <div class="content_news">
          <div class="date">
            <time>
              <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
            </time>
          </div>
          <div class="card_title_news">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:value-of select="Title"></xsl:value-of>
            </a>
            <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>