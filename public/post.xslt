<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/exercises">
    <xsl:apply-templates select="exercise"/>
  </xsl:template>

  <xsl:template match="exercise">
      <div class="card">
        <h5 class="card-header"><xsl:value-of select="title"/></h5>
        <div class="card-body">
          <p class="card-text"><xsl:value-of select="description"/></p>
        </div>
        <div class="card-footer">
          <a href="/exercises/{@id}" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">
            Show me
          </a>
        </div>
      </div>
  </xsl:template>
</xsl:stylesheet>
