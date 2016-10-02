<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">

<xsl:strip-space elements="*" />
<xsl:output method="text" encoding="UTF-8"></xsl:output>

<xsl:template match="/">
<xsl:text>digraph sample{
   </xsl:text>
      <xsl:apply-templates></xsl:apply-templates>
      <xsl:text>}</xsl:text>
      </xsl:template>

      <xsl:template match="*">
      <xsl:param name="id"><xsl:value-of select="generate-id()"></xsl:value-of></xsl:param>
      <xsl:param name="parent-id"></xsl:param>
      
      <xsl:value-of select="$id"></xsl:value-of><xsl:text> [label = "</xsl:text>
      <xsl:value-of select="name()"></xsl:value-of>
      <xsl:for-each select="@*" >|<xsl:value-of select="name()"/>=<xsl:value-of select="."/></xsl:for-each>
      <xsl:text>", shape=record, style=rounded]; </xsl:text>
      <xsl:if test="../..">
      <xsl:value-of select="$parent-id"></xsl:value-of>
      <xsl:text> -> </xsl:text>
      <xsl:value-of select="$id"></xsl:value-of>
      <xsl:text>; </xsl:text>
      </xsl:if>
      <xsl:text>
      </xsl:text>
      <xsl:apply-templates>
      <xsl:with-param name="parent-id"><xsl:value-of select="$id"></xsl:value-of></xsl:with-param>
      </xsl:apply-templates>

      </xsl:template>

      <xsl:template match="text()">
      <xsl:param name="id"><xsl:value-of select="generate-id()"></xsl:value-of></xsl:param>
      <xsl:param name="parent-id"></xsl:param>

      <xsl:value-of select="$id"></xsl:value-of>
      <xsl:text>_text [label = "</xsl:text>
      <xsl:value-of select="normalize-space()"></xsl:value-of>
      <xsl:text>", shape=box, fillcolor=white, style="rounded,filled"]; </xsl:text>
      <xsl:value-of select="$parent-id"></xsl:value-of>
      <xsl:text> -> </xsl:text>
      <xsl:value-of select="$id"></xsl:value-of>
      <xsl:text>_text; </xsl:text>
      <xsl:text>
      </xsl:text>
      </xsl:template>

      </xsl:stylesheet>
