<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="appPath"/>
  <xsl:variable name="MaxAnnotationLength" select="300"/>

  <xsl:template match="List">
    <xsl:for-each select="GuestBook">
      <table cellSpacing="1" cellPadding="4" border="0" width="100%" bgColor="#e6e6ff">
        <tr>
          <td>
            <span style="color: #00a;">
              <b>
                <xsl:value-of select="@Name"/>
              </b>
              (<i>
                <xsl:value-of select="@Date"/>
              </i>)
            </span>
          </td>
        </tr>

        <tr style="background-color: #fff;">
          <td style="font-weight: bold; padding-left: 20px;">
            <xsl:value-of select="@QuestionEssence"/>
            <xsl:if test="count(@QuestionText) != 0">
              <div style="font: normal 10pt Tahoma;">
                <xsl:value-of select="@QuestionText"/>
              </div>
            </xsl:if>

            <xsl:if test="string-length(@AdministrationAnswer) != 0">
              <br/>
              <u>Ответ:</u>
              <div style="font: normal 10pt Tahoma;">
                <xsl:value-of select="@AdministrationAnswer"/>
              </div>
            </xsl:if>
          </td>
        </tr>
      </table>
      <br/>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>