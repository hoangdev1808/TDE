<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <h2 class="section-title">
            <xsl:value-of select="RootTitle" disable-output-escaping="yes"></xsl:value-of>
        </h2>
        <div class="wrap-td-0"></div>
        <div class="wrap-td-1">
            <div class="wrap-left-select">
                <label for="">Khu vực</label>
                <div class="btn-group">
                    <a href="#" class="btn btn-danger" data-toggle="dropdown" >
                        <xsl:value-of select="Zone[IsActive = 'true']/Title" disable-output-escaping="yes"></xsl:value-of>
                    </a>
                    <div class="dropdown-menu">
                        <xsl:apply-templates select="Zone" mode="Sort"></xsl:apply-templates>
                    </div>
                </div>
            </div>
            <div class="wrap-right">
                <div class="button-prev">
                    <a href="">
                        <em class="material-icons">arrow_back</em>
                    </a>
                </div>
                <div class="swiper-container" id="myTab" role="tablist">
                    <div class="swiper-wrapper">
                        <xsl:apply-templates select="Zone[IsActive = 'true']/Zone" mode="LV2"></xsl:apply-templates>
                    </div>
                </div>
                <div class="button-next">
                    <a href="">
                        <em class="material-icons">arrow_forward</em>
                    </a>
                </div>
            </div>
        </div>
        <div class="wrap-sub-menu tab-content" id="myTabContent">
            <ul class="tab-pane fade show active" id="monmoi" role="tabpanel" aria-labelledby="monmoi-tab">
                <xsl:apply-templates select="Zone/Zone[IsActive = 'true']/Zone" mode="LV3"></xsl:apply-templates>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Sort">
        <a class="dropdown-item" href="#">
            <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </a>
    </xsl:template>
    <xsl:template match="Zone" mode="LV2">
        <div class="swiper-slide">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="LV3">
        <li>
        <xsl:if test="IsActive = 'true'">
            <xsl:attribute name="class">
            <xsl:text disable-output-escaping="yes">active</xsl:text>
            </xsl:attribute>
        </xsl:if>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>