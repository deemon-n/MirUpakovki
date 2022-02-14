<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="appPath" />
  <xsl:param name="previousPageUrl" />
  <xsl:param name="nextPageUrl" />
  <xsl:param name="showCartButton" />

  <xsl:template match="/List">

    <div style="margin-top: 20px">
      <center>
        <xsl:for-each select="Collection">
          <div style="float: left; margin: 5px 5px 25px 5px; width: 30%; height: 100px">
            <a href="{@UrlPath}">
              <img src="{@PreviewUrl}" alt="{@Name}" style="width: 130px; height: 60px" />
            </a>
            <br />
            <a href="{@UrlPath}" style="font-size: 16px; font-weight: bold">
              <xsl:value-of select="@Name" disable-output-escaping="yes"/>
            </a>
          </div>
        </xsl:for-each>
      </center>
    </div>
    <div style="clear: both"></div>
  </xsl:template>

</xsl:stylesheet>

