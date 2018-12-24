<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/exercises">
    <xsl:apply-templates select="exercise"/>
  </xsl:template>

  <xsl:template match="exercise">
    <div class="card">
      <div class="card-body">
        <h3 class="card-title"><xsl:value-of select="title"/></h3>
        <p class="card-text"><xsl:value-of select="description"/></p>
      </div>
      <div class="card-footer">
        <a href="/exercises/{@id}" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">
          Show me
        </a>
        <xsl:element name="button">
          <xsl:attribute name="type">button</xsl:attribute>
          <xsl:attribute name="class">btn btn-success rating_up rounded-circle</xsl:attribute>
          <xsl:attribute name="post_id"><xsl:value-of select="id"/></xsl:attribute>
          <xsl:if test="user_vote = 1">
            <xsl:attribute name="disabled"></xsl:attribute>
          </xsl:if>
          +
        </xsl:element>
        <span class="rating" post_id="{@id}"><xsl:value-of select="rating"/></span>
        <xsl:element name="button">
          <xsl:attribute name="type">button</xsl:attribute>
          <xsl:attribute name="class">btn btn-danger rating_down rounded-circle</xsl:attribute>
          <xsl:attribute name="post_id"><xsl:value-of select="id"/></xsl:attribute>
          <xsl:if test="user_vote = -1">
            <xsl:attribute name="disabled"></xsl:attribute>
          </xsl:if>
          -
        </xsl:element>
        <a href="/users/{@user_id}"><xsl:value-of select="user_name"/></a>
        <xsl:if test="status=0">
          <button type="button" class="btn btn-primary post_save " post_id="{@id}">Save</button>
        </xsl:if>
        <xsl:if test="status=1">
          <button type="button" class="btn btn-success post_save" post_id="{@id}">Saved</button>
        </xsl:if>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
