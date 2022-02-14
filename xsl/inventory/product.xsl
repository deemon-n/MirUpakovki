<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="callPostbackCode" />
  <xsl:param name="postbackFunction" />
  <xsl:param name="appPath" />
  <xsl:param name="addedToCart" />
  
  <xsl:template match="Product">

    <xsl:if test="string-length(@ImageUrl) != 0">
      <div style="float: left; margin: 0px 10px 0px 0px">
        <a href="{@ImageUrl}" rel="lightbox">
          <img src="{@PreviewUrl}" style="border: solid 1px #999999; "/>
        </a>
      </div>
    </xsl:if>
    
    <table cellpadding="5" cellspacing="0" border="0" style="text-align: left">
      <tr>
        <td colspan="2" style="color: black; font-size: 16px;">
          <b>
            <xsl:value-of select="@ActualName" disable-output-escaping="yes"/>
          </b>
        </td>
      </tr>
      <xsl:if test="@MetalName != '&lt;не указан&gt;'">
        <tr>
          <td style="font-size: 14px">Металл</td>
          <td style="color: black; font-size: 16px;">
            <b>
              <xsl:value-of select="@MetalName" disable-output-escaping="yes"/>
            </b>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="@Weight != 0">
        <tr>
          <td style="font-size: 14px">Вес</td>
          <td style="color: black; font-size: 16px;">
            <b>
              <xsl:value-of select="@Weight" disable-output-escaping="yes"/> г.
            </b>
          </td>
        </tr>
      </xsl:if>
      <tr>
        <td colspan="2">
          <xsl:value-of select="@Description" disable-output-escaping="yes" />
        </td>
      </tr>
      <xsl:if test="@Price != 0">
        <tr>
          <td colspan="2" style="color: #0CF; font-size: 20px">
            Цена <xsl:value-of select="@PriceString" disable-output-escaping="yes" />
            <a href="javascript:{$postbackFunction}('{@ID}')" class="link">
              <img src="{$appPath}/ii/cart.jpg" style="margin: 0px 0px -8px 20px" alt="Добавить в корзину" title="Добавить в корзину" />
            </a>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="$addedToCart = 1">
        <tr>
          <td colspan="2">
            <h4>Изделие добавлено в корзину.</h4>
          </td>
        </tr>
      </xsl:if>
    </table>
    
    <div style="clear: both"></div>

    <xsl:if test="count(GarnitureItems/Item) != 0">
      <div>
        <h3 style="text-align: left">Гарнитуры</h3>
        <xsl:for-each select="GarnitureItems/Item">
          <div style="margin-bottom: 10px; width: 130px; float: left; margin: 0px 10px 10px 0px">
            <a href="{@ProductUrl}" style="text-decoration: none">
              <img src="{@ImageUrl}" style="border: solid 1px gainsboro; width: 130px; height: 130px"  alt="{@ProductArticle}" />
              <br />
              <center>
                <xsl:value-of select="@ProductArticle" disable-output-escaping="yes" />
              </center>
            </a>
          </div>
        </xsl:for-each>
      </div>
    </xsl:if>
    
    <xsl:value-of select="$callPostbackCode" disable-output-escaping="yes"/>
    
  </xsl:template>
</xsl:stylesheet> 

