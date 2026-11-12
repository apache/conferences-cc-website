<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:javafunc="java.lang"
                              exclude-result-prefixes="javafunc">
   <!-- Root template -->
   <xsl:template match="/">
        <xsl:for-each select="root/daily">
        <xsl:sort select="well_no" 
                  order="descending"/>
        <xsl:call-template name="templatecall">
          <xsl:with-param name='wellno' select="well_no"/>
        </xsl:call-template>
        </xsl:for-each>
   </xsl:template>
   <xsl:template name="templatecall">
      <xsl:param name="wellno"/>
              <xsl:element name="well_number">
                  <xsl:value-of select="$wellno" />
             	</xsl:element>
              <xsl:element name="create_date">
                  <xsl:value-of select="javafunc:System.currentTimeMillis()"/>
              	</xsl:element>                 
   </xsl:template>   
</xsl:stylesheet>
