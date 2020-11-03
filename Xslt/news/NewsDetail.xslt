<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/NewsDetail">
    <section class="news-detail">
      <div class="container">
        <div class="row">
          <div class="col-lg-9">
            <div class="card-title">
              <h1>
                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
              </h1>
              <div class="bottom-wrapper-news-detail">
                <time>
                  <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                </time>
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
            </div>
            <div class="content_news-detail">
              <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="right-news">
              <div class="card-title-right">
                <h2>Tin tức khác</h2>
              </div>
              <xsl:apply-templates select="NewsOther"></xsl:apply-templates>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="NewsOther">
    <div class="card_body">
      <div class="img">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
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
      <div class="content_news_detail_right">
        <div class="date">
          <time>
            <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
          </time>
        </div>
        <div class="title_news_right">
          <a class="lcl lcl-3" href="">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title"></xsl:value-of>
          </a>
        </div>
      </div>
    </div>
  </xsl:template>


</xsl:stylesheet>