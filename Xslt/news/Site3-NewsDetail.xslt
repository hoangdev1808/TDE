<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/NewsDetail">
        <section class="news-detail">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 bg-left-detail">
                        <div class="card-title">
                            <h1>
                                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                            </h1>
                            <div class="bottom-wrapper-news-detail">
                                <time>
                                    <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
                                </time>
                                <div class="social-network-share">
                                    <div class="icon">
                                        <a target="_blank">
                                            <xsl:attribute name='href'>
                                                <xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
                                                <xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
                                            </xsl:attribute>
                                            <span class="ri-facebook-fill"></span>
                                        </a>
                                        <a target="_blank">
                                            <xsl:attribute name='href'>
                                                <xsl:text>https://www.linkedin.com/sharing/share-offsite/?url=</xsl:text>
                                                <xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
                                            </xsl:attribute>
                                            <span class="ri-linkedin-fill"></span>
                                        </a>
                                        <a target="_blank">
                                            <xsl:attribute name='href'>
                                                <xsl:text>https://twitter.com/intent/tweet?text=</xsl:text>
                                                <xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
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
                                <h2>Tin tức mới</h2>
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
                <img >
                    <xsl:attribute name="src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                </img>
            </div>
            <div class="content_news_detail_right">
                <div class="date">
                    <time>
                        <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
                    </time>
                </div>
                <div class="title_news_right">
                    <a class="lcl lcl-3">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
