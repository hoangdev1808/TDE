<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <div class="language dropdown">
            <a class="current" href="">
                <xsl:apply-templates select="/LanguageList/Language" mode="Active"></xsl:apply-templates>
                <span class="mdi mdi-chevron-down"></span>
            </a>
            <div class="dropdown-content">
                <ul class="list-reset">
                    <xsl:apply-templates select="/LanguageList/Language"></xsl:apply-templates>
                </ul>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Language" mode="Active">
        <xsl:if test="IsActive='true'">
            <xsl:value-of select="Title"></xsl:value-of>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Language">
        <xsl:if test="IsActive!='true'">
            <li>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:value-of select="Target"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of select="Title"></xsl:value-of>
                </a>
            </li>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
