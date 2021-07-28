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
            <section class="block_recruitment-2">
                <div class="container">
                    <div class="title-recruitment-2">
                        <h2>
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </h2>
                    </div>
                    <div class="row">
                        <xsl:apply-templates select="News" mode="QuyTrinh"></xsl:apply-templates>
                    </div>
                </div>
            </section>
        </xsl:if>
        <xsl:if test="position()=2">
            <section class="block_recruitment-3">
                <div class="container">
                    <div class="title-recruitment-3">
                        <h2>
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </h2>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6">
                            <xsl:apply-templates select="News[1]" mode="Left"></xsl:apply-templates>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="row">
                                <xsl:apply-templates select="News[2]" mode="Top"></xsl:apply-templates>
                                <xsl:apply-templates select="News[position() &gt; 2 and position() &lt; 5]" mode="Bottom"></xsl:apply-templates>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="QuyTrinh">
        <div class="col-12 col-md-2 col-lg-2">
            <div class="recruitment-2">
                <div class="title-hr-2">
                    <h3>
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </h3>
                </div>
                <div class="title-zone-hr-2">
                    <p>
                        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                    </p>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="Left">
        <div class="card_img-big">
            <div class="img-big">
                <img >
                    <xsl:attribute name="src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                </img>
            </div>
            <div class="content-recruitment">
                <div class="title">
                    <h3>
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </h3>
                </div>
                <div class="title-zone">
                    <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="Top">
        <div class="col-lg-12">
            <div class="card_img-small top">
                <div class="img-small">
                    <img >
                        <xsl:attribute name="src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                    </img>
                </div>
                <div class="content-recruitment">
                    <div class="title">
                        <h3>
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </h3>
                    </div>
                    <div class="title-zone">
                        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="Bottom">
        <div class="col-12 col-md-6 col-lg-6">
            <div class="card_img-small left">
                <div class="img-small">
                    <img >
                        <xsl:attribute name="src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                    </img>
                </div>
                <div class="content-recruitment">
                    <div class="title">
                        <h3>
                            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                        </h3>
                    </div>
                    <div class="title-zone">
                        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
