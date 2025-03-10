<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.17.0.final using JasperReports Library version 6.17.0-6d93193241dd8cc42629e188b94f9e0bc5722efd  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="WPHCR04" language="groovy" pageWidth="595" pageHeight="842" whenNoDataType="AllSectionsNoDetail" columnWidth="519" leftMargin="38" rightMargin="38" topMargin="42" bottomMargin="38" isSummaryWithPageHeaderAndFooter="true" uuid="a8bfa2ef-1c4d-46e0-85b2-de8581053df9">
	<property name="ireport.zoom" value="1.5"/>
	<property name="ireport.x" value="0"/>
	<property name="ireport.y" value="0"/>
	<property name="net.sf.jasperreports.export.xls.collapse.row.span" value="true"/>
	<property name="net.sf.jasperreports.export.xls.white.page.background" value="false"/>
	<property name="net.sf.jasperreports.export.xls.remove.empty.space.between.columns" value="true"/>
	<property name="net.sf.jasperreports.export.xls.remove.empty.space.between.rows" value="true"/>
	<property name="net.sf.jasperreports.export.xls.auto.fit.row" value="true"/>
	<property name="com.jaspersoft.studio.data.defaultdataadapter" value="DataAdapter76.xml"/>
	<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
	<property name="net.sf.jasperreports.export.xls.freeze.column" value="A"/>
	<property name="net.sf.jasperreports.export.xls.freeze.row" value="7"/>
	<subDataset name="wareHouseDesc" uuid="3ce921cb-b7c7-4f39-b697-5b227bd51a7d">
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w1" value="280"/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w2" value="709"/>
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="DataAdapter.xml"/>
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<parameter name="language" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<parameter name="wareHouseCode" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<parameter name="userId" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<queryString>
			<![CDATA[SELECT SITSITCD+' - '+wms.pkgwmsutil_display_by_lang($P{language},SITEDESC,SITLDESC) AS  "SITEDESC" 
FROM sitgnl
WHERE SITSITCD = $P{wareHouseCode}]]>
		</queryString>
		<field name="SITEDESC" class="java.lang.String">
			<property name="com.jaspersoft.studio.field.name" value="SITEDESC"/>
			<property name="com.jaspersoft.studio.field.label" value="SITEDESC"/>
		</field>
	</subDataset>
	<subDataset name="UserDesc" uuid="abdb1699-ec2b-4744-9a2d-75716a47c69f">
		<parameter name="userId" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<parameter name="language" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<queryString>
			<![CDATA[select 	rmsUser.aduusr+' - '+ wms.pkgwmsutil_display_by_lang($P{language}, rmsUser.adudesc , rmsUser.aduldesc) "USERDESC"
from 	admusr rmsUser
where	rmsUser.aduusr = $P{userId}]]>
		</queryString>
		<field name="USERDESC" class="java.lang.String"/>
	</subDataset>
	<subDataset name="StatusDesc" uuid="8bf1137a-a716-422e-b3e2-cc06375eceae">
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="DataAdapter.xml"/>
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<parameter name="language" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<parameter name="invStatus" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<queryString>
			<![CDATA[SELECT TOP 1
    CASE
        WHEN  $P{invStatus} IS NOT NULL THEN  
            wms.pkgwmsutil_display_by_lang($P{language}, param.pmdtbdedesc , param.pmdtbdldesc)
        ELSE
            wms.pkgwmsutil_display_by_lang($P{language}, prm.pmllngedesc  ,prm.pmllngldesc)
    END  AS "STATUSDESC"
FROM  wms.prmtbldtl param
JOIN prmlang prm  ON prm.pmllngcd = 'L0019'
WHERE param.PMDTBDTBNO = 9241
and pmdtbdentcd = $P{invStatus}   OR   $P{invStatus}   IS NULL;]]>
		</queryString>
		<field name="STATUSDESC" class="java.lang.String">
			<property name="com.jaspersoft.studio.field.name" value="STATUSDESC"/>
			<property name="com.jaspersoft.studio.field.label" value="STATUSDESC"/>
		</field>
	</subDataset>
	<subDataset name="Stotypfrom" uuid="66c7fe0b-cfbf-43cb-95cc-9481ca5d1a44">
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w1" value="0"/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w2" value="1000"/>
		<parameter name="stoTypeFrom" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<parameter name="language" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<queryString>
			<![CDATA[select $P{stoTypeFrom} +' '+ (case $P{language} when 'E' then PMDTBDEDESC
when 'L' then PMDTBDLDESC end) "STOTYPFROMDESC"
from PRMTBLDTL
where PMDTBDTBNO= 9041
and PMDTBDENTCD=$P{stoTypeFrom}
union
select wms.pkgwmsutil_display_by_lang($P{language},'All','ทั้งหมด') "STOTYPFROMDESC"
where $P{stoTypeFrom} is null]]>
		</queryString>
		<field name="STOTYPFROMDESC" class="java.lang.String"/>
	</subDataset>
	<subDataset name="Stotypto" uuid="13feb5fb-7285-40ab-b12f-abf5e0d66113">
		<parameter name="stoTypeTo" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<parameter name="language" class="java.lang.String">
			<defaultValueExpression><![CDATA[]]></defaultValueExpression>
		</parameter>
		<queryString>
			<![CDATA[select (CASE $P{stoTypeTo} WHEN '' THEN 'End' WHEN PMDTBDENTCD THEN stotypdesc ELSE 'End' END ) "STOTYPTODESC" from (select TOP 1(CAST(PMDTBDENTCD AS VARCHAR)+' '+ wms.pkgwmsutil_display_by_lang($P{language},PMDTBDEDESC,PMDTBDLDESC)) stotypdesc ,PMDTBDENTCD
from PRMTBLDTL
where PMDTBDTBNO= 9041
and PMDTBDENTCD=coalesce ($P{stoTypeTo},PMDTBDENTCD)
)A]]>
		</queryString>
		<field name="STOTYPTODESC" class="java.lang.String"/>
	</subDataset>
	<subDataset name="cntparamDesc" uuid="886ac513-d0b5-4f42-a258-29e9920441a7">
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="DataAdapter.xml"/>
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w1" value="227"/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w2" value="762"/>
		<parameter name="countingType" class="java.lang.String"/>
		<parameter name="language" class="java.lang.String"/>
		<queryString>
			<![CDATA[SELECT TOP 1
    CASE
        WHEN  $P{countingType}  IS NOT NULL THEN  
            wms.pkgwmsutil_display_by_lang($P{language}, param.pmdtbdedesc , param.pmdtbdldesc)
        ELSE
            wms.pkgwmsutil_display_by_lang($P{language}, prm.pmllngedesc  ,prm.pmllngldesc)
    END  AS "CNTPARAMDESC"
FROM  wms.prmtbldtl param
JOIN prmlang prm  ON prm.pmllngcd = 'L0019'
WHERE param.PMDTBDTBNO = 9244
and pmdtbdentcd = $P{countingType}   OR   $P{countingType}   IS NULL;]]>
		</queryString>
		<field name="CNTPARAMDESC" class="java.lang.String">
			<property name="com.jaspersoft.studio.field.name" value="CNTPARAMDESC"/>
			<property name="com.jaspersoft.studio.field.label" value="CNTPARAMDESC"/>
		</field>
	</subDataset>
	<subDataset name="stoparamDesc" uuid="c68fc22d-5aef-4aa4-aaee-53570556ec64">
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="DataAdapter.xml"/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w1" value="332"/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w2" value="656"/>
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<parameter name="stoTypeFROM" class="java.lang.String"/>
		<parameter name="warehouseCode" class="java.lang.String"/>
		<parameter name="language" class="java.lang.String"/>
		<queryString>
			<![CDATA[SELECT TOP 1
    CASE
        WHEN $P{stoTypeFROM} IS NOT NULL THEN  
            stw. stwstgtyp+' - '+stw.stwstgname
        ELSE
            wms.pkgwmsutil_display_by_lang($P{language}, prm.pmllngedesc  ,prm.pmllngldesc)
    END  AS "STOPARAMDESC"
FROM wstgtypwh stw
JOIN prmlang prm  ON prm.pmllngcd = 'L0019'
WHERE stw.stwwhcd = $P{warehouseCode}  
     AND stw. stwstgtyp = $P{stoTypeFROM}  OR   $P{stoTypeFROM} IS NULL;]]>
		</queryString>
		<field name="STOPARAMDESC" class="java.lang.String">
			<property name="com.jaspersoft.studio.field.name" value="STOPARAMDESC"/>
			<property name="com.jaspersoft.studio.field.label" value="STOPARAMDESC"/>
		</field>
	</subDataset>
	<subDataset name="stgtypeGroup" uuid="a015a29b-9866-40d8-9ebc-778cf9e1d958">
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="DataAdapter.xml"/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w1" value="471"/>
		<property name="com.jaspersoft.studio.data.sql.SQLQueryDesigner.sash.w2" value="523"/>
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<parameter name="warehouseCode" class="java.lang.String"/>
		<parameter name="stoTypeFROM" class="java.lang.String"/>
		<queryString>
			<![CDATA[SELECT stw. stwstgtyp+' - '+stw.stwstgname AS "STOPARAMDESC"
FROM wstgtypwh stw
WHERE stw.stwwhcd = $P{warehouseCode} 
     AND stw. stwstgtyp = $P{stoTypeFROM}]]>
		</queryString>
		<field name="STOPARAMDESC" class="java.lang.String">
			<property name="com.jaspersoft.studio.field.name" value="STOPARAMDESC"/>
			<property name="com.jaspersoft.studio.field.label" value="STOPARAMDESC"/>
		</field>
	</subDataset>
	<parameter name="stoTypeTo" class="java.lang.String">
		<defaultValueExpression><![CDATA[]]></defaultValueExpression>
	</parameter>
	<parameter name="sto" class="java.lang.String">
		<defaultValueExpression><![CDATA[]]></defaultValueExpression>
	</parameter>
	<parameter name="invDate" class="java.lang.String">
		<defaultValueExpression><![CDATA[]]></defaultValueExpression>
	</parameter>
	<parameter name="isDisplayCompanyName" class="java.lang.Boolean" isForPrompting="false">
		<defaultValueExpression><![CDATA[true]]></defaultValueExpression>
	</parameter>
	<parameter name="isDisplayCompanyLogoOnLeft" class="java.lang.Boolean" isForPrompting="false">
		<defaultValueExpression><![CDATA[true]]></defaultValueExpression>
	</parameter>
	<parameter name="isDisplayCompanyLogoOnRight" class="java.lang.Boolean" isForPrompting="false">
		<defaultValueExpression><![CDATA[false]]></defaultValueExpression>
	</parameter>
	<parameter name="language" class="java.lang.String">
		<defaultValueExpression><![CDATA["B"]]></defaultValueExpression>
	</parameter>
	<parameter name="wareHouseCode" class="java.lang.String"/>
	<parameter name="reportId" class="java.lang.String" isForPrompting="false">
		<defaultValueExpression><![CDATA["PHCR02"]]></defaultValueExpression>
	</parameter>
	<parameter name="repeatCriteria" class="java.lang.Boolean" isForPrompting="false">
		<defaultValueExpression><![CDATA[false]]></defaultValueExpression>
	</parameter>
	<parameter name="userId" class="java.lang.String" isForPrompting="false">
		<defaultValueExpression><![CDATA["RMS_USER"]]></defaultValueExpression>
	</parameter>
	<parameter name="invStatus" class="java.lang.String">
		<defaultValueExpression><![CDATA[]]></defaultValueExpression>
	</parameter>
	<parameter name="printingCriteria" class="java.lang.String"/>
	<parameter name="inv_No_FROM" class="java.lang.String"/>
	<parameter name="inv_No_To" class="java.lang.String"/>
	<parameter name="invType" class="java.lang.String"/>
	<parameter name="outputFormat" class="java.lang.String"/>
	<parameter name="invTypeDesc" class="java.lang.String"/>
	<parameter name="invStatusDesc" class="java.lang.String"/>
	<parameter name="reportName" class="java.lang.String"/>
	<queryString language="plsql">
		<![CDATA[EXEC [wms_report_wphcr04]
$P{wareHouseCode}
,$P{stoTypeTo}
,$P{invType}
,$P{invDate}
,$P{invStatus}
,$P{inv_No_FROM}
,$P{inv_No_To}
,$P{language}
,$P{userId}]]>
	</queryString>
	<field name="INVENTORY_NO" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="INVENTORY_NO"/>
		<property name="com.jaspersoft.studio.field.label" value="INVENTORY_NO"/>
	</field>
	<field name="INV_DESCRIPTION" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="INV_DESCRIPTION"/>
		<property name="com.jaspersoft.studio.field.label" value="INV_DESCRIPTION"/>
	</field>
	<field name="INV_STATUS" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="INV_STATUS"/>
		<property name="com.jaspersoft.studio.field.label" value="INV_STATUS"/>
	</field>
	<field name="STO_TYPE" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="STO_TYPE"/>
		<property name="com.jaspersoft.studio.field.label" value="STO_TYPE"/>
	</field>
	<field name="STO_BIN" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="STO_BIN"/>
		<property name="com.jaspersoft.studio.field.label" value="STO_BIN"/>
	</field>
	<field name="BIN_DESC" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="BIN_DESC"/>
		<property name="com.jaspersoft.studio.field.label" value="BIN_DESC"/>
	</field>
	<field name="ITEMCODE" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="ITEMCODE"/>
		<property name="com.jaspersoft.studio.field.label" value="ITEMCODE"/>
	</field>
	<field name="ITMCD_DESC" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="ITMCD_DESC"/>
		<property name="com.jaspersoft.studio.field.label" value="ITMCD_DESC"/>
	</field>
	<field name="BATCH_NAME" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="BATCH_NAME"/>
		<property name="com.jaspersoft.studio.field.label" value="BATCH_NAME"/>
	</field>
	<field name="STK_UNIT" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="STK_UNIT"/>
		<property name="com.jaspersoft.studio.field.label" value="STK_UNIT"/>
	</field>
	<field name="CNT_TYPE" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="CNT_TYPE"/>
		<property name="com.jaspersoft.studio.field.label" value="CNT_TYPE"/>
	</field>
	<field name="INV_DATE" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.name" value="INV_DATE"/>
		<property name="com.jaspersoft.studio.field.label" value="INV_DATE"/>
	</field>
	<field name="PEA_NO" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.label" value="PEA_NO"/>
		<property name="com.jaspersoft.studio.field.name" value="PEA_NO"/>
	</field>
	<sortField name="INVENTORY_NO"/>
	<sortField name="STO_TYPE"/>
	<sortField name="STO_BIN"/>
	<sortField name="ITEMCODE"/>
	<sortField name="BATCH_NAME"/>
	<sortField name="PEA_NO"/>
	<variable name="variable1" class="java.lang.Number" incrementType="Report">
		<variableExpression><![CDATA[$V{PAGE_NUMBER}]]></variableExpression>
		<initialValueExpression><![CDATA[$V{PAGE_NUMBER}]]></initialValueExpression>
	</variable>
	<group name="Group2" isStartNewPage="true" isReprintHeaderOnEachPage="true">
		<groupExpression><![CDATA[$P{outputFormat}.equals("2")?$F{INVENTORY_NO}+$F{STO_TYPE}:' ']]></groupExpression>
	</group>
	<group name="Group1" isStartNewPage="true" isReprintHeaderOnEachPage="true">
		<groupExpression><![CDATA[$F{INVENTORY_NO}]]></groupExpression>
		<groupHeader>
			<band height="45">
				<frame>
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="30" width="519" height="15" uuid="aaaa2c1c-0461-467b-b564-2a15dd67990b">
						<property name="com.jaspersoft.studio.unit.x" value="px"/>
						<property name="com.jaspersoft.studio.unit.y" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<box>
						<pen lineWidth="1.0"/>
						<topPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<leftPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
						<bottomPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<rightPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
					</box>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="364" y="0" width="69" height="15" uuid="d4a3e394-9ed9-4153-8e23-c2653d35302f">
							<property name="com.jaspersoft.studio.unit.width" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Center" verticalAlignment="Top">
							<font fontName="Angsana New" size="12" isBold="true"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L10115",$P{language})]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="0" width="94" height="15" uuid="b4141108-edfd-4640-b89b-70e9afb58a98">
							<property name="com.jaspersoft.studio.unit.width" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Center" verticalAlignment="Top">
							<font fontName="Angsana New" size="12" isBold="true"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L9830",$P{language})]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="186" y="0" width="110" height="15" uuid="9e563d33-096c-4054-8604-d42c6346bf55">
							<property name="com.jaspersoft.studio.unit.width" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Center" verticalAlignment="Top">
							<font fontName="Angsana New" size="12" isBold="true"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L9464",$P{language})]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="0" width="92" height="15" uuid="ac7dd09f-9d0f-4a27-8f37-bd1540849ade">
							<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Center" verticalAlignment="Top">
							<font fontName="Angsana New" size="12" isBold="true"/>
							<paragraph leftIndent="0" spacingBefore="0"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L9463",$P{language})]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="296" y="0" width="68" height="15" uuid="4e12a53d-d0da-41d4-a0bc-cc28f4d6b76c">
							<property name="com.jaspersoft.studio.unit.width" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Center" verticalAlignment="Top">
							<font fontName="Angsana New" size="12" isBold="true"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L9841",$P{language})]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="433" y="0" width="86" height="15" uuid="c8cad15e-5dc6-44b1-89c9-e343c83c685a">
							<property name="com.jaspersoft.studio.unit.width" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Center" verticalAlignment="Top">
							<font fontName="Angsana New" size="12" isBold="true"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L9842",$P{language})]]></textFieldExpression>
					</textField>
				</frame>
				<frame>
					<reportElement positionType="Float" x="0" y="0" width="519" height="30" isRemoveLineWhenBlank="true" uuid="7453e6bf-47ec-4084-a1f3-09ae48ab15e9">
						<property name="com.jaspersoft.studio.unit.y" value="px"/>
					</reportElement>
					<box>
						<pen lineWidth="0.5"/>
						<topPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<leftPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
						<bottomPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
						<rightPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
					</box>
					<textField textAdjust="StretchHeight" pattern="dd/MM/yyyy" isBlankWhenNull="true">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="433" y="0" width="86" height="15" uuid="13c433b7-7c1c-48c6-9e62-f577a77b4334">
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<box topPadding="1"/>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12"/>
						</textElement>
						<textFieldExpression><![CDATA[$F{INV_DATE}== null?' ':$F{INV_DATE}]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="364" y="0" width="69" height="15" uuid="a62f851a-8dc9-4154-a645-66e9b60416e8">
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<box topPadding="1"/>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12" isBold="true"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L7050", $P{language}) + " : "]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight" isBlankWhenNull="true">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="15" width="92" height="15" uuid="4615e0f0-3a2b-4c46-9213-3916dc9bf1ad">
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12"/>
						</textElement>
						<textFieldExpression><![CDATA[$F{INV_STATUS}==null?' ':$F{INV_STATUS}]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="0" width="94" height="15" uuid="61a73333-31c2-4b7b-924b-64ac726f1665">
							<property name="com.jaspersoft.studio.unit.width" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
							<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						</reportElement>
						<box topPadding="1"/>
						<textElement verticalAlignment="Middle">
							<font fontName="Angsana New" size="12" isBold="true"/>
							<paragraph leftIndent="0"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L10153", $P{language})+" : "]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight" isBlankWhenNull="true">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="0" width="92" height="15" uuid="278b4247-d4a3-4ea4-be8f-583089eabf6d">
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<box topPadding="1"/>
						<textElement verticalAlignment="Middle">
							<font fontName="Angsana New" size="12"/>
						</textElement>
						<textFieldExpression><![CDATA[$F{INVENTORY_NO} == null ? ' ':$F{INVENTORY_NO}]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="15" width="94" height="15" isRemoveLineWhenBlank="true" uuid="c7ef0f22-1b12-45b5-aaed-4c9718fa749e">
							<property name="com.jaspersoft.studio.unit.width" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
							<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						</reportElement>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12" isBold="true"/>
							<paragraph leftIndent="0"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L7232", $P{language})+" : "]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="186" y="0" width="110" height="15" isRemoveLineWhenBlank="true" uuid="aa22865e-0639-4886-891d-885c310c55f7">
							<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12" isBold="true"/>
							<paragraph leftIndent="0"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L10145", $P{language})+" : "]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight" isBlankWhenNull="true">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="296" y="0" width="68" height="15" uuid="cd8b318a-ad60-4d95-87f6-871b0bf7cfc1">
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<box bottomPadding="1"/>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12"/>
						</textElement>
						<textFieldExpression><![CDATA[$F{CNT_TYPE}==null?' ':$F{CNT_TYPE}]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="186" y="15" width="110" height="15" isRemoveLineWhenBlank="true" uuid="93a099ef-cb97-43d9-b956-bf7ba0f78c53">
							<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12" isBold="true"/>
							<paragraph leftIndent="0"/>
						</textElement>
						<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L1721", $P{language})+" : "]]></textFieldExpression>
					</textField>
					<textField textAdjust="StretchHeight" isBlankWhenNull="true">
						<reportElement positionType="Float" stretchType="ElementGroupHeight" x="296" y="15" width="223" height="15" uuid="c00e2f4e-b43e-4c4a-a8d1-9da475127507">
							<property name="com.jaspersoft.studio.unit.height" value="px"/>
						</reportElement>
						<box bottomPadding="1"/>
						<textElement textAlignment="Left" verticalAlignment="Middle">
							<font fontName="Angsana New" size="12"/>
						</textElement>
						<textFieldExpression><![CDATA[$F{INV_DESCRIPTION}==null?' ':$F{INV_DESCRIPTION}]]></textFieldExpression>
					</textField>
				</frame>
			</band>
		</groupHeader>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<pageHeader>
		<band height="105" splitType="Stretch">
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
			<frame>
				<reportElement positionType="Float" x="0" y="60" width="519" height="45" isRemoveLineWhenBlank="true" uuid="3a441552-81c0-405d-ac47-203cffa6062b">
					<property name="com.jaspersoft.studio.unit.height" value="px"/>
					<printWhenExpression><![CDATA[$P{outputFormat}.equals( "1" )?  ($V{PAGE_NUMBER}.equals(1) ? true : false) : ($P{printingCriteria}.equals("1")?true:$V{PAGE_NUMBER}.equals(1)?true:false)]]></printWhenExpression>
				</reportElement>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="364" y="30" width="69" height="15" uuid="11aad9bb-7400-4da6-92e2-812dac3cc5c6">
						<property name="com.jaspersoft.studio.unit.y" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box leftPadding="0">
						<bottomPen lineWidth="0.75"/>
					</box>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L7232", $P{language})+" : "]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="30" width="94" height="15" uuid="e22a8638-c2ec-4f73-9662-8cab637b79db">
						<property name="com.jaspersoft.studio.unit.y" value="px"/>
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box>
						<bottomPen lineWidth="0.75"/>
					</box>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L0141",$P{language})+" : "]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="433" y="30" width="86" height="15" uuid="03262638-bc1f-4059-b610-fd43ded94c24">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.y" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box>
						<bottomPen lineWidth="0.75"/>
					</box>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{invStatusDesc} == null?(com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L0019", $P{language})):
$P{invStatusDesc}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="0" width="94" height="15" uuid="6473c938-1a60-4c45-af4e-f11c53463971">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box>
						<topPen lineWidth="0.75"/>
					</box>
					<textElement textAlignment="Left" verticalAlignment="Middle" markup="html">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L9215",$P{language})+" : "]]></textFieldExpression>
				</textField>
				<componentElement>
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="0" width="92" height="15" uuid="469aaf2c-6781-423a-bd6b-860f3f689b26">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<jr:list xmlns:jr="http://jasperreports.sourceforge.net/jasperreports/components" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports/components http://jasperreports.sourceforge.net/xsd/components.xsd" printOrder="Vertical">
						<datasetRun subDataset="wareHouseDesc" uuid="08b894fe-fef5-4f39-84f2-89ef15ce66e6">
							<datasetParameter name="language">
								<datasetParameterExpression><![CDATA[$P{language}]]></datasetParameterExpression>
							</datasetParameter>
							<datasetParameter name="wareHouseCode">
								<datasetParameterExpression><![CDATA[$P{wareHouseCode}]]></datasetParameterExpression>
							</datasetParameter>
							<datasetParameter name="userId">
								<datasetParameterExpression><![CDATA[$P{userId}]]></datasetParameterExpression>
							</datasetParameter>
							<connectionExpression><![CDATA[$P{REPORT_CONNECTION}]]></connectionExpression>
						</datasetRun>
						<jr:listContents height="15" width="92">
							<textField textAdjust="StretchHeight" isBlankWhenNull="true">
								<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="0" width="92" height="15" isRemoveLineWhenBlank="true" uuid="7d26545a-d79b-420e-80a5-7ecb82073b3f">
									<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
								</reportElement>
								<box>
									<topPen lineWidth="0.75"/>
								</box>
								<textElement verticalAlignment="Middle">
									<font fontName="Angsana New" size="12"/>
									<paragraph leftIndent="0"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{SITEDESC}]]></textFieldExpression>
							</textField>
						</jr:listContents>
					</jr:list>
				</componentElement>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="15" width="94" height="15" uuid="08109d4e-63b3-40cf-9fc5-a5a77b982bef">
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L9829",$P{language}) + " : "]]></textFieldExpression>
				</textField>
				<componentElement>
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="15" width="92" height="15" uuid="4ded475c-5f72-4df8-aed1-8bc002541c2e">
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<jr:list xmlns:jr="http://jasperreports.sourceforge.net/jasperreports/components" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports/components http://jasperreports.sourceforge.net/xsd/components.xsd" printOrder="Vertical">
						<datasetRun subDataset="stoparamDesc" uuid="f62850c2-3f18-44b7-bfcb-70b0ac8a2ddd">
							<datasetParameter name="stoTypeFROM">
								<datasetParameterExpression><![CDATA[$P{stoTypeTo}]]></datasetParameterExpression>
							</datasetParameter>
							<datasetParameter name="language">
								<datasetParameterExpression><![CDATA[$P{language}]]></datasetParameterExpression>
							</datasetParameter>
							<datasetParameter name="warehouseCode">
								<datasetParameterExpression><![CDATA[$P{wareHouseCode}]]></datasetParameterExpression>
							</datasetParameter>
							<connectionExpression><![CDATA[$P{REPORT_CONNECTION}]]></connectionExpression>
						</datasetRun>
						<jr:listContents height="15" width="92">
							<textField textAdjust="StretchHeight" isBlankWhenNull="true">
								<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="0" width="92" height="15" isRemoveLineWhenBlank="true" uuid="ab93518c-f916-45c8-893d-9436b7fddcf8">
									<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
								</reportElement>
								<textElement verticalAlignment="Middle">
									<font fontName="Angsana New" size="12"/>
									<paragraph leftIndent="0"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{STOPARAMDESC}]]></textFieldExpression>
							</textField>
						</jr:listContents>
					</jr:list>
				</componentElement>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="186" y="0" width="110" height="15" uuid="2f5dd1fd-653b-4220-b874-0911be3357ed">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box>
						<topPen lineWidth="0.75"/>
					</box>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L10145",$P{language}) + " : "]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="296" y="0" width="68" height="15" uuid="02c24843-7b4e-478b-9599-69fc4fc937ac">
						<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box>
						<topPen lineWidth="0.75"/>
					</box>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="false"/>
						<paragraph leftIndent="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{invTypeDesc} == null ? (com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L0019", $P{language})):$P{invTypeDesc}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="364" y="0" width="69" height="15" uuid="584528cf-b023-405d-9f44-e1660661d923">
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box leftPadding="0">
						<topPen lineWidth="0.75"/>
					</box>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L10298",$P{language}) + " : "]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" pattern="dd/MM/yyyy" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="433" y="0" width="86" height="15" uuid="7c4c8e4d-7f5e-4755-8af4-932d2b99d849">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box>
						<topPen lineWidth="0.75"/>
					</box>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{invDate} == null?(com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L0019", $P{language})):
$P{invDate}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="296" y="15" width="68" height="15" uuid="ff9225cf-dd66-456c-b754-58b515699252">
						<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
						<paragraph leftIndent="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{inv_No_FROM} == null ? (com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L0546", $P{language})) : $P{inv_No_FROM}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="364" y="15" width="69" height="15" uuid="adf30b11-1575-4ebb-8155-3020b2676671">
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box leftPadding="0"/>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L1242",$P{language})+" : "]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="433" y="15" width="86" height="15" uuid="536a24c0-5fd3-45d3-bf19-c63d520019f9">
						<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
						<paragraph leftIndent="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{inv_No_To} == null ?(com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L0154", $P{language})):$P{inv_No_To}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" evaluationTime="Report" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="186" y="15" width="110" height="15" uuid="70182de3-2f7e-44d7-9f46-f73c978f555f">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L10297",$P{language})+" : "]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="30" width="270" height="15" uuid="f581befe-2fbf-4ee2-96e3-b89162ea0f87">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.y" value="px"/>
						<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						<printWhenExpression><![CDATA[($V{PAGE_NUMBER}.equals(1) ? true : false)]]></printWhenExpression>
					</reportElement>
					<box>
						<topPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
						<leftPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
						<bottomPen lineWidth="0.75" lineStyle="Solid" lineColor="#000000"/>
						<rightPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
					</box>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
						<paragraph leftIndent="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{INV_DESCRIPTION} == null ? " ":$F{INV_DESCRIPTION}]]></textFieldExpression>
				</textField>
			</frame>
			<frame>
				<reportElement stretchType="ElementGroupHeight" x="0" y="0" width="519" height="60" isRemoveLineWhenBlank="true" uuid="012c158e-c3ab-42f1-bfcf-b2e9c2aba1c1">
					<property name="com.jaspersoft.studio.unit.height" value="px"/>
					<printWhenExpression><![CDATA[$P{outputFormat}.equals( "1" )?  ($V{PAGE_NUMBER}.equals(1) ? true : false) : true]]></printWhenExpression>
				</reportElement>
				<textField isBlankWhenNull="true">
					<reportElement x="0" y="0" width="519" height="30" isRemoveLineWhenBlank="true" uuid="cc10208e-85f9-4b74-981a-779628961633">
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font fontName="Angsana New" size="16" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{reportName}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="45" width="94" height="15" isRemoveLineWhenBlank="true" uuid="4e9ffbd6-e8f8-495b-a9b6-6c3328ce3227">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L1240",$P{language})+" : "]]></textFieldExpression>
				</textField>
				<componentElement>
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="45" width="270" height="15" isRemoveLineWhenBlank="true" uuid="9f54934d-f12c-4cb0-956e-233e434097cf">
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<jr:list xmlns:jr="http://jasperreports.sourceforge.net/jasperreports/components" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports/components http://jasperreports.sourceforge.net/xsd/components.xsd" printOrder="Vertical">
						<datasetRun subDataset="UserDesc" uuid="5b790a09-dced-435d-a29d-3c2056866c5a">
							<datasetParameter name="userId">
								<datasetParameterExpression><![CDATA[$P{userId}]]></datasetParameterExpression>
							</datasetParameter>
							<datasetParameter name="language">
								<datasetParameterExpression><![CDATA[$P{language}]]></datasetParameterExpression>
							</datasetParameter>
							<connectionExpression><![CDATA[$P{REPORT_CONNECTION}]]></connectionExpression>
						</datasetRun>
						<jr:listContents height="15" width="270">
							<textField textAdjust="StretchHeight" isBlankWhenNull="true">
								<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="0" width="270" height="15" isRemoveLineWhenBlank="true" uuid="c0458a43-6934-4351-9662-4c596cbff4a5">
									<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
								</reportElement>
								<textElement textAlignment="Left" verticalAlignment="Middle">
									<font fontName="Angsana New" size="12"/>
									<paragraph leftIndent="0"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{USERDESC}]]></textFieldExpression>
							</textField>
						</jr:listContents>
					</jr:list>
				</componentElement>
				<textField textAdjust="StretchHeight" pattern="dd/MM/yyyy HH:mm:ss" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="433" y="45" width="86" height="15" isRemoveLineWhenBlank="true" uuid="7c9741c8-00e9-49a3-8dc8-e90663728858">
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<box leftPadding="0"/>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
					</textElement>
					<textFieldExpression><![CDATA[new java.util.Date()]]></textFieldExpression>
				</textField>
				<textField isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="30" width="94" height="15" isRemoveLineWhenBlank="true" uuid="72656227-74bc-4e55-b0ae-bf5f5fb81bae">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L1239",$P{language})+" : "]]></textFieldExpression>
				</textField>
				<textField evaluationTime="Report" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="94" y="30" width="270" height="15" isRemoveLineWhenBlank="true" uuid="8f1aca5f-3296-4580-a31f-3468d80e6315">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
						<paragraph leftIndent="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{reportId}]]></textFieldExpression>
				</textField>
				<textField evaluationTime="Master" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="433" y="30" width="86" height="15" isRemoveLineWhenBlank="true" uuid="999ccb09-23d6-45b9-b29f-c83c8ad2452e">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<box leftPadding="0"/>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
					</textElement>
					<textFieldExpression><![CDATA[$V{MASTER_CURRENT_PAGE}+" / "+$V{MASTER_TOTAL_PAGES}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="364" y="45" width="69" height="15" isRemoveLineWhenBlank="true" uuid="7c072e0e-cc82-4841-a5fd-7ea2d180787c">
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<box leftPadding="0"/>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L1241",$P{language})+" : "]]></textFieldExpression>
				</textField>
				<textField isBlankWhenNull="true">
					<reportElement positionType="Float" stretchType="ElementGroupHeight" x="364" y="30" width="69" height="15" isRemoveLineWhenBlank="true" uuid="e8388169-3c6b-4b29-8732-1547d86b97fd">
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<box leftPadding="0"/>
					<textElement textAlignment="Left" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[com.ss.wms.util.ReportBilingualUtils.getMessageByLang("L0350",$P{language})+" : "]]></textFieldExpression>
				</textField>
			</frame>
		</band>
	</pageHeader>
	<detail>
		<band height="15" splitType="Prevent">
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
			<frame>
				<reportElement positionType="Float" stretchType="ElementGroupHeight" x="0" y="0" width="519" height="15" isRemoveLineWhenBlank="true" uuid="b6f2a058-0b6a-4354-938c-acb2c6a5efd9">
					<property name="com.jaspersoft.studio.unit.height" value="px"/>
				</reportElement>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement stretchType="ElementGroupHeight" x="0" y="0" width="94" height="15" uuid="73c56a78-5e56-4785-88db-3d6cd30fb8fd">
						<property name="com.jaspersoft.studio.unit.spacingBefore" value="px"/>
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Left" verticalAlignment="Top">
						<font fontName="Angsana New" size="12"/>
						<paragraph spacingBefore="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{STO_BIN} + " - " + $F{BIN_DESC}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement stretchType="ElementGroupHeight" x="94" y="0" width="92" height="15" uuid="51a18fd6-aac0-485c-a578-24b0d4917595">
						<property name="com.jaspersoft.studio.unit.leftIndent" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Center" verticalAlignment="Top">
						<font fontName="Angsana New" size="12"/>
						<paragraph leftIndent="0" spacingBefore="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{ITEMCODE}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement stretchType="ElementGroupHeight" x="186" y="0" width="110" height="15" uuid="90819688-1897-4501-b30c-0969c6f56d44">
						<property name="net.sf.jasperreports.export.xls.wrap.text" value="false"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement verticalAlignment="Top">
						<font fontName="Angsana New" size="12"/>
						<paragraph spacingBefore="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{ITMCD_DESC}.trim()]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement stretchType="ElementGroupHeight" x="364" y="0" width="69" height="15" uuid="21acc562-8139-47b1-b039-b17bf94bb3ed">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Center" verticalAlignment="Top">
						<font fontName="Angsana New" size="12"/>
						<paragraph spacingBefore="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{STK_UNIT}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="false">
					<reportElement stretchType="ElementGroupHeight" x="296" y="0" width="68" height="15" uuid="523be486-ec04-482e-ae67-c3a57cc609c7">
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Center" verticalAlignment="Top">
						<font fontName="Angsana New" size="12"/>
						<paragraph spacingBefore="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{BATCH_NAME} == "N/A" || $F{BATCH_NAME} == null ? " " : $F{BATCH_NAME}]]></textFieldExpression>
				</textField>
				<textField textAdjust="StretchHeight" isBlankWhenNull="true">
					<reportElement stretchType="ElementGroupHeight" x="433" y="0" width="86" height="15" uuid="f2aa8643-fdf1-4d34-bedb-3ed9c61771aa">
						<property name="com.jaspersoft.studio.unit.spacingBefore" value="px"/>
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font fontName="Angsana New" size="12"/>
						<paragraph spacingBefore="0"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{PEA_NO}]]></textFieldExpression>
				</textField>
			</frame>
		</band>
	</detail>
</jasperReport>
