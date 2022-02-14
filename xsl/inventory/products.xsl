<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="appPath" />
  <xsl:param name="previousPageUrl" />
  <xsl:param name="nextPageUrl" />
  <xsl:param name="showCartButton" />

  <xsl:template match="/List">

    <table width="100%" style="margin: 20px 0px 10px 0px">
      <xsl:for-each select="Product">
        <xsl:if test="position() mod 4 = 1">
          <xsl:text disable-output-escaping="yes">
          <![CDATA[<tr>]]>
          </xsl:text>
        </xsl:if>
        <td width="25%" align="center" valign="top">
          <div class="pbg">
            <a href="{@UrlPath}">
              <img src="{@PreviewUrl}" alt="{@Articul}" width="130" height="130" style="margin-top: 10px" />
            </a>
            <div style="margin-top: 5px">
              <xsl:if test="string-length(@Articul) != 0">
                <a href="{@UrlPath}" style="font-size: 14px">
                  Арт.: <xsl:value-of select="@Articul" disable-output-escaping="yes"/>
                </a>
              </xsl:if>
              <xsl:if test="string-length(@Articul) = 0">
                <a href="{@UrlPath}" style="font-size: 14px">
                  Арт.: <xsl:value-of select="@Name" disable-output-escaping="yes"/>
                </a>
              </xsl:if>
            </div>
          </div>
          <br />

        </td>
        <xsl:if test="position() mod 4 = 0">
          <xsl:text disable-output-escaping="yes">
          <![CDATA[</tr>]]>
          </xsl:text>
        </xsl:if>
      </xsl:for-each>
    </table>

  </xsl:template>

</xsl:stylesheet>

