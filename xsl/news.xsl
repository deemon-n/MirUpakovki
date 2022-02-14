<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="appPath"/>

  <xsl:template match="/List">
    <div class="categories">
      <xsl:for-each select="NewsTitle">
        <div class="bghover category">
          <div class="container">
            <xsl:if test="@SourceUrl != ''">
              <a href="{@SourceUrl}">
                <img src="{$appPath}/i/news/{./Picture/@PreviewUrl}" alt="{@Name}" />
                <div class="text">
                  <xsl:value-of select="@Name"/>
                </div>
              </a>
            </xsl:if>
            <xsl:if test="@SourceUrl = ''">
              <a href="{$appPath}/news/{@ID}.aspx">
                <img src="{$appPath}/i/news/{./Picture/@PreviewUrl}" alt="{@Name}" />
                <div class="text">
                  <xsl:value-of select="@Name"/>
                </div>
              </a>
            </xsl:if>
          </div>
        </div>
      </xsl:for-each>      
    </div>
  </xsl:template>

</xsl:stylesheet>