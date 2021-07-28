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
                        <div class="news-detail">
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
                            <div class="other-page">
                                <div class="title-other">Tin tức khác</div>
                                <div class="wrap-slide">
                                    <div class="swiper-container">
                                        <div class="swiper-wrapper">
                                            <xsl:apply-templates select="NewsOther"></xsl:apply-templates>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="news-new"></div>
                    </div>
                </div>
            </section>
        </div>
    </xsl:template>
    <xsl:template match="NewsOther">
        <div class="swiper-slide">
            <div class="wrap-box">
                <div class="img">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <img >
                            <xsl:attribute name="src">
                                <xsl:value-of select="ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="wrap-text">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <span class="date">
                            <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
                        </span>
                        <div class="title">
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                        <span class="xemthem">Xem thêm</span>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>