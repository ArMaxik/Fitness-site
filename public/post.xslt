<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <xsl:apply-templates select="exercises"/>
  </xsl:template>

  <xsl:template match="exercises">
    <xsl:apply-templates select="exercise"/>
  </xsl:template>

  <xsl:template match="exercise">
    <div class="card post_box">
      <div class="card-body">
        <h3 class="card-title"><xsl:value-of select="title"/></h3>
        <p class="card-text"><xsl:value-of select="description"/></p>
      </div>
      <div class="card-footer">
        <div class="d-flex flex-wrap">
          <div>
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
          </div>
          <div>
            <a href="/exercises/{@id}" class="btn btn-outline-primary active" role="button">
              <xsl:copy-of select="$comments"/>
            </a>
          </div>
          <div>
            <xsl:if test="status=0">
              <button type="button" class="btn btn-primary post_save " post_id="{@id}">
                <xsl:copy-of select="$save"/>
              </button>
            </xsl:if>
            <xsl:if test="status=1">
              <button type="button" class="btn btn-success post_save" post_id="{@id}">
                <xsl:copy-of select="$saved"/>
              </button>
            </xsl:if>
          </div>
          <div>
            <xsl:copy-of select="$author"/>&#160;
            <a href="/users/{@user_id}"><xsl:value-of select="user_name"/></a>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:variable name="comments">
    <xsl:value-of select="exercises/words/comments"/>
  </xsl:variable>
  <xsl:variable name="save">
    <xsl:value-of select="exercises/words/save"/>
  </xsl:variable>
  <xsl:variable name="saved">
    <xsl:value-of select="exercises/words/saved"/>
  </xsl:variable>
  <xsl:variable name="author">
    <xsl:value-of select="exercises/words/author"/>
  </xsl:variable>
</xsl:stylesheet>
