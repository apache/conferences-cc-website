<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
               <xsl:comment>Specify the object type</xsl:comment>              
            	<xsl:element name="ofs_type">
                  <xsl:text>Well</xsl:text> 
             	</xsl:element>                 
   </xsl:template>   
</xsl:stylesheet>
