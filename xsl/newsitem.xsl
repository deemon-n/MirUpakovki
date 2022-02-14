<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:param name="appPath"/>

  <xsl:template name="main" match="//NewsTitle">
    <div class="newsitem">
      <xsl:if test="count(./Picture/@PictureUrl) != 0">
        <img style="max-width:280px"  src="{$appPath}/i/news/{./Picture/@PictureUrl}" />
      </xsl:if>
      
      <xsl:if test="string-length(@Brief) != 0">
        <div class="brief">
            <xsl:value-of select="@Brief" disable-output-escaping="yes"/>
        </div>
      </xsl:if>

      <xsl:value-of select="@Content" disable-output-escaping="yes"/>
      
      <!--xsl:if test="count(./Pictures/Picture) != 0">
        <h2 style="clear:both">Дополнительные фото</h2>
        
        <table cellpadding="5" cellspacing="0" border="0" style="clear: both;">
          <tr>
            <xsl:for-each select="./Pictures/Picture">

              <xsl:if test="position() mod 5 = 1">
                <xsl:text disable-output-escaping="yes"><![CDATA[</tr><tr>]]></xsl:text>
              </xsl:if>

              <td valign="top" align="center"  width="20%">
                <a href="{$appPath}/i/news/{./@PictureUrl}">
                  <img src="{$appPath}/i/news/{./@PreviewUrl}"
                    style="border: 1px solid #DDDDDD;padding: 5px; width:150px;" />
                </a>
              </td>
            </xsl:for-each>
          </tr>
        </table>
      </xsl:if-->
    </div>
    <div class="clearfix"></div>
  </xsl:template>
</xsl:stylesheet>