<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Root template -->
   <xsl:template match="/">

        <xsl:apply-templates select="root/daily">
          <xsl:sort select="well_number"
                    data-type="number"
                    order="descending" />
        </xsl:apply-templates>
   </xsl:template>
   <xsl:template match="root/daily">
            	<xsl:element name="well_number">
                            <xsl:attribute name="well_name" >
                    <xsl:value-of select="well_name" />
              </xsl:attribute> 
                <xsl:value-of select="well_no" />
             	</xsl:element>  
              <xsl:element name="country">
                  <xsl:value-of select="well_name/@country" />
             	</xsl:element>                 
   </xsl:template>   
</xsl:stylesheet>
