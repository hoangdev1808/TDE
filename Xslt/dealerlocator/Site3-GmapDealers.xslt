<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div style="display: none;">
			<input type="hidden" id="hdnDealerLocatorSiteId">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SiteId"></xsl:value-of>
			</xsl:attribute>
			</input>
			<input type="hidden" id="hdnDealerLocatorLanguageId">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/LanguageId"></xsl:value-of>
			</xsl:attribute>
			</input>
			<input type="hidden" id="hdnDealerLocatorZoneGuid" value="">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/ZoneGuid"></xsl:value-of>
			</xsl:attribute>
			</input>
			<input type="hidden" id="hdfDealerLocatorSelectCountry">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectCountryText"></xsl:value-of>
			</xsl:attribute>
			</input>
			<input type="hidden" id="hdfDealerLocatorSelectProvince">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
			</xsl:attribute>
			</input>
			<input type="hidden" id="hdfDealerLocatorSelectDistrict">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
			</xsl:attribute>
			</input>
			<input type="hidden" id="hdfDealerLocatorSelectZone">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/SelectZoneText"></xsl:value-of>
			</xsl:attribute>
			</input>
			<input type="hidden" id="hdfDealerLocatorCulture">
			<xsl:attribute name="value">
				<xsl:value-of select="/DealerList/Culture"></xsl:value-of>
			</xsl:attribute>
			</input>
		</div>
		<div class="row">
			<div class="col-lg-3">
				<div class="form_choose_city">
					<div class="side-navigation-wrapper">
						<div class="side-navigation">
							<div class="filtermap">
								<div class="field form_desc" style="display:none;" > 
									<!--<label for="ddlCountry"> 
										<xsl:value-of select="/DealerList/CountryText"></xsl:value-of>
									</label>-->
									<select class="form-select" id="ddlCountry"></select>
								</div>
								<div class="field form_desc">
									<!--<label for="ddlProvince"> 
										<xsl:value-of select="/DealerList/ProvinceText"></xsl:value-of>
									</label>-->
									<select class="form-select" id="ddlProvince">
										<option value="">
											<xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
										</option>
									</select>
								</div>
								<div class="field form_desc">
									<!--<label for="ddlDistrict">
										<xsl:value-of select="/DealerList/DistrictText"></xsl:value-of>
									</label>-->
									<select class="form-select" id="ddlDistrict">
										<option value="">
											<xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
										</option>
									</select>
								</div>
								<input type="submit" id="edit-submit" class="btn-searchmap">
								<xsl:attribute name="value">
									<xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
								</xsl:attribute>
								</input>
							</div>
						</div>
					</div>
					<div class="location_system">
						<div id="results" class="dealer-list">
							<div id="ajax_msg" class="locate" style="display: none;">
							</div>
							<ul class="noli list_system" id="list"></ul>
						</div>
					</div>
					<div class="searh-text" style="display: none;">
						<label>
							<xsl:value-of select="/DealerList/OrText"></xsl:value-of>
						</label>
						<input type="text" maxlength="128" name="address" id="address" size="60"
							value="" class="form-text" autocomplete="off">
						<xsl:attribute name="placeholder">
							<xsl:value-of select="/DealerList/EnterLocationText"></xsl:value-of>
						</xsl:attribute>
						</input>
						<input type="submit" id="edit-submit1"
							class="btn btn-large btn-primary btn-searchmap">
						<xsl:attribute name="value">
							<xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
						</xsl:attribute>
						</input>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div id="map">
					<input type="hidden" id="distance" name="distance" value="1" />
					<div id="map_canvas" class="map_system" style="display: none;"></div>
					<div class="map-wrapper">
						<iframe id="map-iframe" src="" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" 
							tabindex="0" width="100%" height="500px"></iframe>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>