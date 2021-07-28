<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/LanguageList">
        <div class="language dropdown">
            <a class="current">
                <xsl:value-of disable-output-escaping="yes" select="Language[IsActive = 'true']/Title"></xsl:value-of>
                <span class="mdi mdi-chevron-down"></span>
            </a>
            <div class="dropdown-content">
                <ul class="list-reset">
                    <xsl:apply-templates select="Language[IsActive != 'true']"></xsl:apply-templates>
                </ul>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="Language">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title"></xsl:value-of>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>