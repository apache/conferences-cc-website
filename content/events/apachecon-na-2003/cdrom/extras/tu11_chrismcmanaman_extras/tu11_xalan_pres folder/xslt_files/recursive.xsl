<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Root template -->
   <xsl:preserve-space elements="/" />
   <xsl:template match="/">        
        <xsl:copy-of select="root/daily/oil" />
        <xsl:copy>
          <xsl:apply-templates select="root/daily/gas" />  
        </xsl:copy>
        <xsl:apply-templates select="root/daily/liquid" />        
   </xsl:template>
   <xsl:template match="root/daily/oil">
            	<xsl:element name="oil_volume">
                  <xsl:value-of select="volume" /> 
             	</xsl:element>  
  </xsl:template>
   <xsl:template match="root/daily/gas">
            	<xsl:element name="gas_volume">
                  <xsl:value-of select="volume" /> 
             	</xsl:element>  
  </xsl:template> 
   <xsl:template match="root/daily/liquid">
            	<xsl:element name="liquid_volume">
                  <xsl:value-of select="volume" /> 
             	</xsl:element>  
  </xsl:template>  
</xsl:stylesheet>
