<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Root template -->
   <xsl:template match="/">
    		<xsl:apply-templates select="root/daily" />
   </xsl:template>
   <xsl:template match="root/daily">
   	<xsl:element name="well_number">
   		<xsl:if test="starts-with(well_no,'9')">
    			<xsl:value-of select="well_no" />
    		</xsl:if> 
    	</xsl:element>
   </xsl:template>   
</xsl:stylesheet>
