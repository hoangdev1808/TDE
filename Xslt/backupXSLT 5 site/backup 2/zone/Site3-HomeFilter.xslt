<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/ZoneList">
        <div class="block-title">
            <div class="head-title">
                <h1>
                    <xsl:value-of select="ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
                </h1>
            </div>
        </div>
        <div class="block_area">
            <p>Chọn khu vực:</p>
            <select class="ajaxsort">
                <xsl:apply-templates select="Zone/Zone" mode="Sort"></xsl:apply-templates>
            </select>
        </div>
        <xsl:apply-templates select="Zone/Zone"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone" mode="Sort">
        <option>
            <xsl:if test="IsActive = 'true'">
                <xsl:attribute name="selected">
                    <xsl:text>selected</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="value">
                <xsl:text disable-output-escaping="yes">pro-tab-</xsl:text>
                <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title"/>
        </option>
    </xsl:template>
    <xsl:template match="Zone">
        <div class="head-menu-tab">
            <xsl:attribute name="id">
                <xsl:text disable-output-escaping="yes">tab-</xsl:text>
                <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
            </xsl:attribute>
            <div class="tab-panels">
                <ul class="tab-navigation-food menu-food-top">
                    <xsl:apply-templates select="Zone" mode="LV1"></xsl:apply-templates>
                </ul>
            </div>
            <div class="tab-item-food">
                <div class="head-zone-tab">
                    <xsl:apply-templates select="Zone" mode="Tab2"></xsl:apply-templates>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Tab2">
        <div class="tab-panels">
            <xsl:if test="position()=1">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">tab-panels active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="IsActive = 'true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">tab-panels active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="id">
                <xsl:text disable-output-escaping="yes">pro-tab-</xsl:text>
                <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
            </xsl:attribute>
            <ul class="tab-navigation name-food-bottom">
                <xsl:apply-templates select="Zone" mode="LV2"></xsl:apply-templates>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="LV1">
        <li>
            <xsl:if test="IsActive = 'true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <a href="javascript:void(0)">
                <xsl:attribute name="data-type">
                    <xsl:text disable-output-escaping="yes">pro-tab-</xsl:text>
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
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
    <xsl:template match="Zone" mode="LV2">
        <li>
            <xsl:if test="IsActive = 'true'">
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
</xsl:stylesheet>