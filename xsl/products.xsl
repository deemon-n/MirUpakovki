<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="appPath" />
  <xsl:param name="categoryName" />

  <xsl:template match="/List">

    <xsl:for-each select="//Product">

      <div class="col-xs-6 col-sm-4 col-md-3">
        <div class="catalog-item">
          <div class="catalog-img">
            <a href="{$appPath}/catalog/item.aspx?pid={@ID}">
              <img style="width:180px;"  src="{@PreviewUrl}" alt="{@Name}" />
            </a>
          </div>
          <div class="catalog-name">
            <a href="{$appPath}/catalog/item.aspx?pid={@ID}">
              <xsl:value-of select="@Name"/>
            </a>
          </div>
          <!--<div class="catalog-manufact">Brauberg</div>-->
          <div class="catalog-price">
            <div class="fav-cart" pid="{@ID}">
              <img src="{$appPath}/ii/fav_cart.png" alt="" />
            </div>
            <div class="count-cart">
              <input type="text" class="count count-input" value="1" />
              <!--<div class="count">1</div>-->
              <div class="plus-count">
                <img src="{$appPath}/ii/plus.png" alt="" />
              </div>
              <div class="minus-count">
                <img src="{$appPath}/ii/minus.png" alt="" />
              </div>
            </div>
            <div class="price-cart">
              <xsl:value-of select="@PriceString"/>
            </div>
            <div class="clearfix"></div>
          </div>
          <div class="catalog-add">
            <a href="javascript:void(0);" class="add-item" pid="{@ID}">
              <img src="{$appPath}/ii/add_cart.png" alt="" />
            </a>
          </div>
          <!--<div class="discl-cart">
            Цена может быть снижена в зависимости от объема покупки
          </div>-->
        </div>
      </div>

    </xsl:for-each>

    <div class="clearfix"></div>

  </xsl:template>

</xsl:stylesheet>