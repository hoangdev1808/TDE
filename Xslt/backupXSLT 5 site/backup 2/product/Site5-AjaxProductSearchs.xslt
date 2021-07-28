<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ProductList">
        <div class="wrap-list-product">
            <div class="row">
                <xsl:apply-templates select="Product"></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Product">
        <div class="col-xl-3 col-md-6">
            <a class="wrap-product">
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
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
                <div class="wrap-text">
                    <strong>
                        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </strong>
                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                    <div class="price">
                        <del>
                            <xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
                        </del>
                        <span>
                            <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
                        </span>
                    </div>
                </div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>
