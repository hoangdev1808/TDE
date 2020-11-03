<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/BannerList">
    <xsl:if test="count(Banner) > 0">
      <section class="cc-tagline-img">
        <section class="banner-about">
          <div class="container-fuild">
            <div class="card-img">
              <div class="img">
                <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="Banner/ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="Banner/Title"></xsl:value-of>
                </xsl:attribute>
                </img>
              </div>
            </div>
          </div>
        </section>
      </section>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>