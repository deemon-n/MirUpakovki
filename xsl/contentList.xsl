<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html"/>

  <xsl:param name="appPath"/>

  <xsl:template match="/">

    <xsl:if test="count(/List/ContentSchemaNode) != 0">

      <h2>Также в этом разделе:</h2>

      <ul>

        <xsl:for-each select="/List/ContentSchemaNode">
          <li>
            <a href="{@Url}">
              <xsl:value-of select="@Title"/>
            </a>
          </li>

        </xsl:for-each>

      </ul>

    </xsl:if>

  </xsl:template>

</xsl:stylesheet>