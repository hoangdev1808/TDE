<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/NewsList">
        <section class="block_recruitment-1">
            <div class="container">
                <div class="block-title">
                    <div class="head-title">
                        <h1>
                            <xsl:value-of select="/NewsList/RecruitmentText" disable-output-escaping="yes"/>
                        </h1>
                    </div>
                    <div class="title-recruitment-1">
                        <h2>
                            <xsl:value-of select="/NewsList/VacancyText" disable-output-escaping="yes"/>
                        </h2>
                    </div>
                </div>
                <div class="row big-recruitment">
                    <div class="col-lg-6">
                        <xsl:apply-templates select="News" mode="Vitri1"></xsl:apply-templates>
                    </div>
                    <div class="col-lg-6">
                        <xsl:apply-templates select="News" mode="Vitri2"></xsl:apply-templates>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="News" mode="Vitri1">
        <xsl:if test="position()&gt;0 and position()&lt;6">
            <div class="content_big_recruitment-1">
                <div class="title_staff">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </a>
                </div>
                <div class="location_recruitment">
                    <div class="icon_recruitment">
                        <i class="ri-map-pin-2-fill"></i>
                    </div>
                    <a href="">
                        <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
                    </a>
                </div>
                <div class="content_small_recruitment-1">
                    <ul>
                        <li>
                            <div class="agree_recruitment">
                                <div class="icon_recruitment">
                                    <i class="ri-money-dollar-box-fill"></i>
                                </div>
                                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                            </div>
                        </li>
                        <li>
                            <div class="date_recruitment">
                                <div class="icon_recruitment">
                                    <i class="ri-calendar-check-fill"></i>
                                </div>
                                <time>
                                    <xsl:value-of select="EndDate" disable-output-escaping="yes"></xsl:value-of>
                                </time>
                            </div>
                        </li>
                        <li>
                            <div class="more-view">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="Url"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="Title"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:value-of select="/NewsList/DetailText" disable-output-escaping="yes"/>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="Vitri2">
        <xsl:if test="position()&gt;5 and position()&lt;11">
            <div class="content_big_recruitment-1">
                <div class="title_staff">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </a>
                </div>
                <div class="location_recruitment">
                    <div class="icon_recruitment">
                        <i class="ri-map-pin-2-fill"></i>
                    </div>
                    <a href="">
                        <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
                    </a>
                </div>
                <div class="content_small_recruitment-1">
                    <ul>
                        <li>
                            <div class="agree_recruitment">
                                <div class="icon_recruitment">
                                    <i class="ri-money-dollar-box-fill"></i>
                                </div>
                                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                            </div>
                        </li>
                        <li>
                            <div class="date_recruitment">
                                <div class="icon_recruitment">
                                    <i class="ri-calendar-check-fill"></i>
                                </div>
                                <time>
                                    <xsl:value-of select="EndDate" disable-output-escaping="yes"></xsl:value-of>
                                </time>
                            </div>
                        </li>
                        <li>
                            <div class="more-view">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="Url"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="Title"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:value-of select="/NewsList/DetailText" disable-output-escaping="yes"/>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
