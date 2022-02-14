<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="appPath"/>
	<xsl:output method="html"/>

	<xsl:template match="/List">
		<table class="data">
			<tr>
				<th>Дата</th>
				<th>Номер</th>
        <th>Сумма</th>
        <th>Дебит</th>
      </tr>
			<xsl:for-each select="Tran">
				<tr>
					<td>
							<xsl:value-of select="@Date"/>
					</td>
					<td>
						<xsl:value-of select="@Doc"/>						
					</td>
					<td align="right" >
						<xsl:value-of select="@Amount"/>
						<span> руб.</span>
					</td>
          <td align="right" >
            <xsl:value-of select="@Debt"/>
          </td>
				</tr>
			</xsl:for-each>
		</table>

	</xsl:template>
</xsl:stylesheet>