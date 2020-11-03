<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <xsl:apply-templates select="Zone"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:if test="position()=1">
            <section class="about_1">
                <div class="container">
                    <div class="block-title">
                        <div class="head-title">
                            <h2>
                                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                            </h2>
                        </div>
                    </div>
                    <div class="row">
                        <xsl:apply-templates select="News" mode="TongQuan"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=2">
            <section class="about_2">
                <div class="container">
                    <div class="block-title">
                        <div class="head-title">
                            <h2>
                                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                            </h2>
                        </div>
                    </div>
                    <div class="about-swiper-wrapper">
                        <div class="nav-arrow-prev">
                            <em class="ri-arrow-left-s-line"></em>
                        </div>
                        <div class="nav-arrow-next">
                            <em class="ri-arrow-right-s-line"></em>
                        </div>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <xsl:apply-templates select="News" mode="LichSu"></xsl:apply-templates>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=3">
            <section class="about_3">
                <div class="container">
                    <div class="block-title">
                        <div class="head-title">
                            <h2>
                                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                            </h2>
                        </div>
                    </div>
                    <div class="row">
                        <xsl:apply-templates select="News" mode="TamNhin"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=4">
            <section class="about_4">
                <div class="container">
                    <div class="block-title">
                        <div class="head-title">
                            <h2>
                                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                            </h2>
                        </div>
                    </div>
                    <xsl:apply-templates select="News" mode="KhongGian"></xsl:apply-templates>
                </div>
            </section>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="TongQuan">
        <xsl:if test="position()=1">
            <div class="col-lg-6">
                <div class="content">
                    <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card_img">
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
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="LichSu">
        <div class="swiper-slide">
            <div class="wrapper">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="caption_about">
                <p>
                    <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </p>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="TamNhin">
        <div class="col-12 col-md-6 col-lg-6">
            <div class="item-vm">
                <div class="card_img">
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
                </div>
                <div class="content-about">
                    <div class="title-vm">
                        <h3>
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </h3>
                    </div>
                    <div class="text">
                        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="KhongGian">
        <div class="caption">
            <p>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </p>
        </div>
        <div class="content-about-4">
            <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
        </div>
        <div class="row">
            <div class="col-12 col-md-3 col-lg-3">
                <div class="card_img">
                    <div class="img">
                        <img >
                            <xsl:attribute name="src">
                                <xsl:value-of select="NewsImages[1]/ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3 col-lg-3">
                <div class="card_img">
                    <div class="img">
                        <img >
                            <xsl:attribute name="src">
                                <xsl:value-of select="NewsImages[2]/ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3 col-lg-3">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card_img double-img-1">
                            <div class="img">
                                <img >
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="NewsImages[3]/ImageUrl"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="Title"></xsl:value-of>
                                    </xsl:attribute>
                                </img>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card_img double-img-2">
                            <div class="img">
                                <img >
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="NewsImages[4]/ImageUrl"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="Title"></xsl:value-of>
                                    </xsl:attribute>
                                </img>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3 col-lg-3">
                <div class="card_img">
                    <div class="img">
                        <img >
                            <xsl:attribute name="src">
                                <xsl:value-of select="NewsImages[5]/ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
