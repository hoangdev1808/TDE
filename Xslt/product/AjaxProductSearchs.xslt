<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/ProductList">
        <div class="big-menu-food">
            <div class="row ">
                <xsl:apply-templates select="Product"></xsl:apply-templates>
            </div>
        </div>
        <div class="btn-view-more">
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
                <xsl:value-of select="ViewMoreText" disable-output-escaping="yes" />
            </a>
        </div>
    </xsl:template>
    <xsl:template match="Product">
        <div class="col">
            <div class="food">
                <xsl:if test="OldPrice != ''">
                    <div class="top-wrap">
                        <div class="discount-percent">
                            <xsl:variable name='price'>
                                <xsl:value-of select="substring-before(Price, ' ')"></xsl:value-of>
                            </xsl:variable>
                            <xsl:variable name='priceNumber'>
                                <xsl:value-of select="translate($price, '.', '')"></xsl:value-of>
                            </xsl:variable>
                            <xsl:variable name='oldprice'>
                                <xsl:value-of select="substring-before(OldPrice, ' ')"></xsl:value-of>
                            </xsl:variable>
                            <xsl:variable name='oldPriceNumber'>
                                <xsl:value-of select="translate($oldprice, '.', '')"></xsl:value-of>
                            </xsl:variable>
                            <xsl:variable name='percentage'>
                                <xsl:value-of select="100 - ($priceNumber div $oldPriceNumber)*100"></xsl:value-of>
                            </xsl:variable>
                            <span>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="ceiling($percentage)"></xsl:value-of>
                                <xsl:text>%</xsl:text>
                            </span>
                        </div>
                    </div>
                </xsl:if>
                <div class="card_img">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url" />
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title" />
                        </xsl:attribute>
                        <div class="img">
                            <img src="./img/s-5/food-1.png" alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="ImageUrl" />
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title" />
                            </xsl:attribute>
                            </img>
                        </div>
                    </a>
                </div>
                <div class="desc-food">
                    <div class="name_food">
                        <a href="">
                            <xsl:attribute name="href">
                                <xsl:value-of select="Url" />
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title" />
                            </xsl:attribute>
                            <xsl:value-of disable-output-escaping="yes" select="Code"></xsl:value-of>
                            <xsl:text disable-output-escaping="yes"> - </xsl:text>
                            <xsl:value-of select="Title" />
                        </a>
                    </div>
                    <div class="discount">
                        <p>
                            <xsl:value-of select="OldPrice" />
                        </p>
                    </div>
                    <div class="price">
                        <p>
                            <xsl:value-of select="Price" />
                        </p>
                    </div>

                    <div class="sub-text">
                        <xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
                    </div>

                </div>

            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>