<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <h2 class="section-title">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </h2>
        <div class="wrap-td-1">
            <div class="wrap-left-select">
                <label for="">Khu vực</label>
                <select name="Location" onchange="AjaxTokyo.loadProductByZone(this,-1);return false;">
                    <xsl:attribute name="data-id">
                        <xsl:value-of select="LocationId"/>
                    </xsl:attribute>
                    <option value="0">Khu vực</option>
                    <xsl:apply-templates select="Location" />
                </select>
            </div>
            <div class="wrap-right">
                <div class="swiper-container" id="myTab" role="tablist">
                    <div class="swiper-wrapper">
                        <xsl:apply-templates select="Zone[Depth = 1]" mode="Tab"/>
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
            <xsl:apply-templates select="Zone[Depth = 1]" mode="TabContent"/>
        </div>
        <div class="wrap-list-product">
            <div class="active ajax-product-response"></div>
        </div>
    </xsl:template>
    <xsl:template match="Location" >
        <option>
            <xsl:attribute name="value">
                <xsl:value-of select="OptionId"/>
            </xsl:attribute>
            <xsl:value-of select="Name"/>
        </option>
    </xsl:template>
    <xsl:template match="Zone" mode="Tab">
        <div class="swiper-slide">
            <a class="nav-link" id="monmoi-tab" data-toggle="tab" role="tab" onclick="AjaxTokyo.loadProductByZone(this);return false;">
                <xsl:attribute name="href">
                    <xsl:text disable-output-escaping="yes">#tab-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
                <xsl:if test="position() = 1">
                    <xsl:attribute name="class">
                        <xsl:text>nav-link active</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="onclick">
                    <xsl:text>AjaxTokyo.loadProductByZone(this,</xsl:text>
                    <xsl:value-of select="ZoneId"/>
                    <xsl:text>);return false;</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="TabContent">
        <xsl:variable name="CurrentZoneId" select="ZoneId" />
        <ul class="tab-pane fade" role="tabpanel">
            <xsl:if test="position() = 1">
                <xsl:attribute name="class">
                    <xsl:text>tab-pane fade show active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="id">
                <xsl:text disable-output-escaping="yes">tab-</xsl:text>
                <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
            </xsl:attribute>
            <li>
                <xsl:if test="position() = 1">
                    <xsl:attribute name="class">
                        <xsl:text>active</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="id">
                    <xsl:text disable-output-escaping="yes">pro-tab-</xsl:text>
                    <xsl:value-of select="ZoneId"/>
                </xsl:attribute>
                <a href="#" onclick="AjaxTokyo.loadProductByZone(this);return false;">
                    <xsl:attribute name="onclick">
                        <xsl:text>AjaxTokyo.loadProductByZone(this,</xsl:text>
                        <xsl:value-of select="./ZoneId"/>
                        <xsl:text>);return false;</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="data-id">
                        <xsl:value-of select="./ZoneId"/>
                    </xsl:attribute>
                    <xsl:attribute name="data-url">
                        <xsl:value-of select="./Url"/>
                    </xsl:attribute> 
                   Tất cả
                
                
                
                
                </a>
            </li>
            <xsl:apply-templates select="/ZoneList/Zone[ParentId = $CurrentZoneId]" mode="Tab2"/>
        </ul>
    </xsl:template>
    <xsl:template match="Zone"  mode="Tab2">
        <li>
        <xsl:if test="IsActive='true'">
            <xsl:attribute name="class">
                <xsl:text disable-output-escaping="yes">active</xsl:text>
            </xsl:attribute>
        </xsl:if>
            <a href="#" data-type="product-tab-2" onclick="AjaxTokyo.loadProductByZone(this);return false;">
                <xsl:attribute name="onclick">
                    <xsl:text>AjaxTokyo.loadProductByZone(this,</xsl:text>
                    <xsl:value-of select="ZoneId"/>
                    <xsl:text>);return false;</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="data-id">
                    <xsl:value-of select="ZoneId"/>
                </xsl:attribute>
                <xsl:attribute name="data-url">
                    <xsl:value-of select="Url"/>
                </xsl:attribute>
                <xsl:value-of select="Title"/>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="Product">
        <div class="col-xl-3 col-md-6">
            <div class="wrap-product">
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
                    <strong><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></strong>
                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                    <div class="price">
                        <del><xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of></del>
                        <span><xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of></span>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>