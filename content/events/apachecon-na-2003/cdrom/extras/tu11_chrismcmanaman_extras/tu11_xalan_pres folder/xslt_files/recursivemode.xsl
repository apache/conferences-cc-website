<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Root template -->
    <xsl:template match="/"> 
       <xsl:apply-templates select="root/daily"/>
   </xsl:template>
   <xsl:template match="root/daily">
      <xsl:if test="well_name/@type='us'">
        <xsl:apply-templates select="well_name" mode="ca"/>
      </xsl:if>
      <xsl:if test="well_name/@type='ca'">
        <xsl:apply-templates select="well_name" mode="us"/>
  		</xsl:if> 
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
</xsl:stylesheet>