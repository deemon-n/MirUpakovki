<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="appPath"/>
	<xsl:output method="html"/>

	<xsl:template match="/List">
		<table class="data">
			<tr>
				<th class="gray">Дата</th>
        <th class="lgray">Номер</th>
        <th class="gray">Адрес доставки</th>
        <th class="lgray">Состояние</th>
        <th class="gray">Сумма</th>
			</tr>
			<xsl:for-each select="Order">
				<tr>
					<td>
							<xsl:value-of select="@Date"/>
					</td>
					<td>
						<a href="order-details.aspx?id={@ID}">
							Заказ <xsl:value-of select="@Number"/>
						</a>
					</td>
          <td>
            <xsl:value-of select="@DeliveryAdress"/>
          </td>          
          <td>
            <xsl:value-of select="@State" disable-output-escaping="yes"/>
          </td>
					<td align="right" >
						<xsl:value-of select="@Amount"/>
						<span> руб.</span>
					</td>
				</tr>
			</xsl:for-each>
		</table>

	</xsl:template>
</xsl:stylesheet>