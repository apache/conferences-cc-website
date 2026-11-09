<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Root template -->
    <xsl:template match="/"> 
        <xsl:apply-templates select="root/daily"/>
   </xsl:template>
   <xsl:template match="root/daily">
       <xsl:choose>
        <xsl:when test="substring-after(well_name,'-') = 'South'">
          <xsl:apply-templates select="well_name" mode="us"/>
        </xsl:when>
        <xsl:when test="substring-after(well_name,'-') = 'North'">
          <xsl:apply-templates select="well_name" mode="ca"/>
        </xsl:when>        
        <xsl:otherwise>
          <xsl:apply-templates select="well_name" mode="ae"/>
        </xsl:otherwise>        
      </xsl:choose> 
  </xsl:template>   
   <xsl:template match="well_name" mode="ca">
            	<xsl:element name="canadian_well">
                  <xsl:value-of select="." /> 
             	</xsl:element>  
  </xsl:template>
   <xsl:template match="well_name" mode="us">
            	<xsl:element name="us_well">
                  <xsl:value-of select="." /> 
             	</xsl:element>  
  </xsl:template> 
   <xsl:template match="well_name" mode="ae">
            	<xsl:element name="ae_well">
                  <xsl:value-of select="." /> 
             	</xsl:element>  
  </xsl:template>   
</xsl:stylesheet>