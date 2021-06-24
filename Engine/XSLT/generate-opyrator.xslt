<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:cb="https://github.com/DistEntArch/CoreBusiness"
    xmlns:cbm="https://github.com/DistEntArch/CoreBusiness/Model"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" name="python" encoding="UTF-8"/>
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:param name="output-dir" select="'EMPTY'"/>
    <xsl:function name="cb:write-opyrator-code">
        <xsl:param name="triggered-by-predicat"/>
        <xsl:param name="triggered-by-object"/>
        <xsl:param name="description"/>
        <xsl:text><![CDATA[from pydantic import BaseModel, Field

class Input(BaseModel):
    ]]></xsl:text>
        <xsl:value-of select="concat($triggered-by-predicat,'_',$triggered-by-object)"/>
        <xsl:text><![CDATA[: bool = Field(
        False,
        description="]]></xsl:text>
        <xsl:value-of select="$description"/>
        <xsl:text><![CDATA[",
    )

class Output(BaseModel):
    message: str

def ]]></xsl:text><xsl:value-of select="concat($triggered-by-predicat,'_',$triggered-by-object)"/><xsl:text><![CDATA[(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.]]></xsl:text>
        <xsl:value-of select="concat($triggered-by-predicat,'_',$triggered-by-object)"/>
        <xsl:text><![CDATA[)
]]></xsl:text>
    </xsl:function>
    
    <xsl:template match="/cbm:root">
        <xsl:text>Generate opyrator code in '</xsl:text>
        <xsl:value-of select="$output-dir"/>
        <xsl:text>'.&#10;</xsl:text>
        <xsl:apply-templates select=".//cbm:following-state" mode="write-opyrator-python"/>
        <xsl:apply-templates select="self::*" mode="write-opyrator-shell"/>
        <xsl:text>To start the engine run &quot;sh </xsl:text>
        <xsl:value-of select="$output-dir"/>
        <xsl:text>run-cbe.sh&quot;&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="cbm:following-state[@triggered-by-subject]" mode="write-opyrator-python">
        <xsl:result-document format="python" href="{concat($output-dir,'/ui-',@triggered-by-predicat,'-',@triggered-by-object,'.py')}">
            <xsl:value-of select="cb:write-opyrator-code(@triggered-by-predicat,@triggered-by-object,@description)"/>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="/cbm:root" mode="write-opyrator-shell">
        <xsl:message select="name()"> AAAA</xsl:message>
        <xsl:result-document format="python" href="{concat($output-dir,'/run-cbe.sh')}">
            <xsl:text>cd </xsl:text>
            <xsl:value-of select="$output-dir"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:apply-templates select=".//cbm:following-state" mode="write-opyrator-shell"/>
            <xsl:text>ps aux | grep "python -m streamlit" | grep -v grep | awk '{print "kill -9 "$2}' > stop-cbe.sh&#10;</xsl:text>
            <xsl:text>echo "To stop all running engines execute 'sh </xsl:text><xsl:value-of select="$output-dir"/><xsl:text>stop-cbe.sh'."&#10;</xsl:text>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="cbm:following-state[not(@triggered-by-state-change)]" mode="write-opyrator-shell">
        <xsl:text>opyrator launch-ui </xsl:text>
        <xsl:value-of select="concat('ui-',@triggered-by-predicat,'-',@triggered-by-object)"/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="concat(@triggered-by-predicat,'_',@triggered-by-object)"/>
        <xsl:text> --port </xsl:text>
        <xsl:value-of select="8080 + count(preceding::cbm:following-state)"/>
        <xsl:text> &amp; &#10;sleep 2 &#10;</xsl:text>
    </xsl:template>
    <xsl:template match="cbm:following-state[@triggered-by-state-change]" mode="write-opyrator-shell">
        <xsl:text>opyrator launch-api </xsl:text>
        <xsl:value-of select="concat('api-',@triggered-by-predicat,'-',@triggered-by-object)"/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="concat(@triggered-by-predicat,'_',@triggered-by-object)"/>
        <xsl:text> --port </xsl:text>
        <xsl:value-of select="8080 + count(preceding::cbm:following-state)"/>
        <xsl:text> &amp; &#10;sleep 2 &#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>