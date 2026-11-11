<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Root template -->
   <xsl:template match="/">
        <xsl:apply-templates select="root/daily" />
   </xsl:template>
   <xsl:template match="root/daily">
              <xsl:element name="well_number">
                  <xsl:value-of select="well_no" />
             	</xsl:element>
               <xsl:comment>Specify the object type</xsl:comment>              
            	<xsl:element name="ofs_type">
                  <xsl:text>Well</xsl:text> 
             	</xsl:element>                 
   </xsl:template>   
</xsl:stylesheet>
