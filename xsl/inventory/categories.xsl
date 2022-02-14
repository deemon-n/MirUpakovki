<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:param name="appPath" />

  <xsl:template match="/List">
    <table width="100%">
      <xsl:for-each select="Category">
        <xsl:if test="position() mod 3 = 1">
          <xsl:text disable-output-escaping="yes">
          <![CDATA[<tr>]]>
          </xsl:text>
        </xsl:if>
        <td width="33%" align="left" valign="top">
          <a href="{@UrlPath}" style="color: blue; text-decoration: none; font-size: 16px; font-weight: bold">
            <xsl:value-of select="@Name" disable-output-escaping="yes"/>
          </a>

          <xsl:if test="count(FeatureList/Item) != 0">
            <xsl:variable name="catID" select="@ID"/>
            <br />
            <div style="padding: 5px 0px 0px 10px; font-size: 11px;">
              <xsl:for-each select="FeatureList/Item">
                <a href="{$appPath}/products/{$catID}/{@ID}/" style="color: blue; text-decoration: none; font-size: 16px;">
                  <xsl:value-of select="@Name" disable-output-escaping="yes"/>
                </a>
                <br />
              </xsl:for-each>
            </div>
          </xsl:if>
        </td>
        <xsl:if test="position() mod 3 = 0">
          <xsl:text disable-output-escaping="yes">
          <![CDATA[</tr>]]>
          </xsl:text>
        </xsl:if>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>

