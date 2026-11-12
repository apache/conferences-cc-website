<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Root template -->
   <xsl:template match="/">
        <xsl:apply-templates select="root//daily" />
   </xsl:template>
   <xsl:template match="root//daily">
     		<xsl:if test="starts-with(well_no,'4')">   
         	<xsl:element name="well_name">
          	<xsl:value-of select="substring-after(well_name,' ')" />
         	</xsl:element>    
          <xsl:element name="well_number">          
            <xsl:value-of select="well_no" />
         	</xsl:element>
          <xsl:element name="city_country">          
            <xsl:value-of select="concat(substring-before(well_name,' '),'-',well_name/@country)" />
         	</xsl:element>
          <xsl:element name="gas_volume">          
            <xsl:value-of select="floor(gas/volume)" />
         	</xsl:element>  
          <xsl:element name="oil_volume">          
            <xsl:value-of select="ceiling(oil/volume)" />
         	</xsl:element>  
          <xsl:element name="liquid_volume">          
            <xsl:value-of select="round(liquids/volume)" />
         	</xsl:element>             
    	</xsl:if> 
   </xsl:template>
</xsl:stylesheet>