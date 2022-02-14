<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="appPath" />
  <xsl:param name="previousPageUrl" />
  <xsl:param name="nextPageUrl" />
  <xsl:param name="showCartButton" />
  <xsl:param name="collection" />

  <xsl:template match="/List">

    <div style="margin-top: 20px">
      <center>
        <xsl:for-each select="Collection">
          <div style="float: left; margin: 5px 20px 25px 20px; height: 100px">
            <a href="{@UrlPath}" style="font-size: 16px; font-weight: bold">
              <xsl:if test="@ID != $collection">
                <img src="{@MenuImageUrl}" alt="{@Name}" onmouseover="this.src='{@ActiveMenuImageUrl}';" onmouseout="this.src='{@MenuImageUrl}';" />
              </xsl:if>
              <xsl:if test="@ID = $collection">
                <img src="{@ActiveMenuImageUrl}" alt="{@Name}" />
              </xsl:if>
            </a>
          </div>
        </xsl:for-each>
      </center>
    </div>
    <div style="clear: both"></div>
  </xsl:template>

</xsl:stylesheet>

