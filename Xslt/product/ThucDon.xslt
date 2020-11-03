<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ProductList">
        <div class="block_name_category">
            <div class="name_category">
				<xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
			</div>
        </div>
        <div class="row">
            <xsl:apply-templates select="Product"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="Product">
        <div class="col-xl-4 col-md-6 col-xs-6">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
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
                    <div class="name_food">
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
                    <div class="item-money">
                        <ul>
                            <li>
                                <div class="discount">
                                    <p><xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of></p>
                                </div>
                            </li>
                            <li>
                                <div class="price">
                                    <p><xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of></p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>
