<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <div class="side-navigation-wrapper">
            <div class="title-wrapper">
                <h2>
                    <xsl:value-of select="RootTitle" disable-output-escaping="yes"></xsl:value-of>
                </h2>
            </div>
            <xsl:apply-templates select="Zone"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:if test="IsActive = 'true'">
            <ul class="side-navigation">
                <xsl:apply-templates select="Zone" mode="LV-1"></xsl:apply-templates>
            </ul>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Zone" mode="LV-1">
        <li>
            <xsl:if test="IsActive = 'true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">open</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <div class="title">
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
                <xsl:if test="count(Zone) > 0">
                    <em class="lnr lnr-chevron-down"></em>
                </xsl:if>
            </div>
            <ul class="nav-sub">
                <xsl:apply-templates select="Zone" mode="LV-2"></xsl:apply-templates>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="Zone" mode="LV-2">
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