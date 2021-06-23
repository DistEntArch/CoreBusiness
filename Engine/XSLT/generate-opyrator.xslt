<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:cbm="https://github.com/DistEntArch/CoreBusiness/Model"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" name="python" encoding="UTF-8"/>
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:param name="output-dir" select="'EMPTY'"/>
    <xsl:template match="cbm:root">
        <xsl:text>Generate opyrator code in '</xsl:text>
        <xsl:value-of select="$output-dir"/>
        <xsl:text>'.&#10;</xsl:text>
        <xsl:text>To start the engine run &quot;sh </xsl:text>
        <xsl:value-of select="$output-dir"/>
        <xsl:text>run-cbe.sh&quot;&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>