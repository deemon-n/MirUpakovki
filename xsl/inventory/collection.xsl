<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="callPostbackCode" />
  <xsl:param name="postbackFunction" />
  <xsl:param name="appPath" />
  
  <xsl:template match="Collection">
    <div style="padding-top: 10px;">
      <xsl:if test="string-length(@ImageUrl) != 0">
        <div style="float: left; margin: 0px 20px 20px 10px;">
          <img src="{@ImageUrl}" />
        </div>
      </xsl:if>
      <div style="color: black;">
        <xsl:value-of select="@Description" disable-output-escaping="yes" />
      </div>
      <div style="clear: both"></div>
      <xsl:if test="@ProductCount != '0'">
        <div style="margin-top: 20px">
            <a href="{$appPath}/collections/{@ID}/view.aspx" style="font-size: 14px; font-weight: bold">Просмотр коллекции</a>
        </div>
      </xsl:if>
      <div style="clear: both"></div>
    </div>
    <xsl:value-of select="$callPostbackCode" disable-output-escaping="yes"/>
  </xsl:template>
</xsl:stylesheet> 

