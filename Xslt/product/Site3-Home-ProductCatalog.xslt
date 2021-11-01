<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<div class="block-title">
			<div class="head-title">
				<h1>
					<xsl:value-of select="ModuleTitle" />
				</h1>
			</div>
		</div>
		<div class="block_area">
			<p>
				<xsl:value-of select="SelectAreaText" />
			</p>
			<select name="Location" onchange="AjaxTokyo.loadProductByZone(this,-1);return false;">
				<xsl:attribute name="data-id">
					<xsl:value-of select="LocationId" />
				</xsl:attribute>
				<option value="0">
					<xsl:value-of select="AreaText" />
				</option>
				<xsl:apply-templates select="Location" />
			</select>
		</div>
		<xsl:apply-templates select="Zone[Depth = 1]" mode="Tab" />
		<div class="tab-wrapper-food">
			<xsl:apply-templates select="Zone[Depth = 2]" mode="TabContent" />
			<div class="tab-wrapper ">
				<div class="tab-item active ajax-product-response" style="display:block; "></div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Location">
		<option>
			<xsl:attribute name="value">
				<xsl:text disable-output-escaping="yes">tab-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Name" />
		</option>
	</xsl:template>
	<xsl:template match="Zone" mode="Tab">
		<div class="head-menu-tab">
			<xsl:attribute name="data-type">
				<xsl:text disable-output-escaping="yes">tab-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="tab-panels">
				<ul class="tab-navigation-food menu-food-top">
					<xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
				</ul>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Child">

		<li class="">
			<xsl:if test="position() = 1">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a href="javascript:void(0)" data-type="pro-tab-1"
				onclick="AjaxTokyo.loadProductByZone(this);return false;">
				<xsl:attribute name="onclick">
					<xsl:text>AjaxTokyo.loadProductByZone(this,</xsl:text>
					<xsl:value-of select="ZoneId" />
					<xsl:text>);return false;</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="data-type">
					<xsl:text>pro-tab-</xsl:text>
					<xsl:value-of select="ZoneId" />
				</xsl:attribute>
				<xsl:value-of select="Title" />
			</a>
		</li>



	</xsl:template>
	<xsl:template match="Zone" mode="TabContent">
		<xsl:variable name="CurrentZoneId" select="ZoneId" />
		<div class="tab-item-food " id="pro-tab-1">
			<xsl:if test="position() = 1">
				<xsl:attribute name="class">
					<xsl:text>tab-item-food active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text>pro-tab-</xsl:text>
				<xsl:value-of select="ZoneId" />
			</xsl:attribute>
			<div class="head-zone-tab">
				<div class="tab-panels">
					<ul class="tab-navigation name-food-bottom">
						<li class="active">
							<a href="#" onclick="AjaxTokyo.loadProductByZone(this);return false;">
								<xsl:attribute name="onclick">
									<xsl:text>AjaxTokyo.loadProductByZone(this,</xsl:text>
									<xsl:value-of select="./ZoneId" />
									<xsl:text>);return false;</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="data-id">
									<xsl:value-of select="./ZoneId" />
								</xsl:attribute>
								<xsl:attribute name="data-url">
									<xsl:value-of select="./Url" />
								</xsl:attribute>
								<xsl:value-of select="/ZoneList/AllText" />

							</a>
						</li>
						<xsl:apply-templates select="/ZoneList/Zone[ParentId = $CurrentZoneId]" mode="Tab2" />
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Tab2">
		<li>
			<a href="#" data-type="product-tab-2" onclick="AjaxTokyo.loadProductByZone(this);return false;">
				<xsl:attribute name="onclick">
					<xsl:text>AjaxTokyo.loadProductByZone(this,</xsl:text>
					<xsl:value-of select="ZoneId" />
					<xsl:text>);return false;</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="data-id">
					<xsl:value-of select="ZoneId" />
				</xsl:attribute>
				<xsl:attribute name="data-url">
					<xsl:value-of select="Url" />
				</xsl:attribute>
				<xsl:value-of select="Title" />
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>