<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="appPath"/>
	<xsl:output method="html"/>

	<xsl:template match="/List">
		<table class="data">
			<tr>
        <th class="gray">Код</th>
        <th class="lgray">Название</th>
        <th class="gray">Цена</th>
        <th class="lgray">Кол-во</th>
        <th class="gray">Сумма</th>
			</tr>
			<xsl:for-each select="OrderItem">
				<tr>
					<td>
							<xsl:value-of select="@Code"/>
					</td>
					<td>						
							<xsl:value-of select="@Name"/>
					</td>
          <td align="right">
						<xsl:value-of select="@Price" disable-output-escaping="yes"/>
            <span> руб.</span>
					</td>
					<td align="right">
						<xsl:value-of select="@Qty"/>
					</td>
					<td align="right">
						<xsl:value-of select="@Amount"/>
						<span> руб.</span>
					</td>
				</tr>
			</xsl:for-each>
		</table>

	</xsl:template>
</xsl:stylesheet>