<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet version = "1.0"
                xmlns:pre="http://oving.hvl.no/fag"
                xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="html" />

   <xsl:template match = "/pre:hvl/pre:emner">
      <html>
         <body>
            <h1>HVL Fagoversikt: Informasjonsteknologi</h1>
            <h2>1. og 2.studieår</h2>
            <p>Følgende oversikt viser emner for år 1. og 2.studieår ved Informasjonsteknologi studiet ved HVL.</p>
            <table border = "1" width="600">
               <tr bgcolor = "#9acd32">
                  <th>Kode</th>
                  <th>Emne</th>
                  <th>Studiepoeng</th>
                  <th>Semester</th>
               </tr>
               <xsl:for-each select = "pre:emne[pre:semester&gt;=1 and pre:semester&lt;=4]">
                  <xsl:sort select="pre:semester" order="descending"/>
                  <tr>
                     <td><xsl:value-of select = "pre:kode"/></td>
                     <td><xsl:value-of select = "pre:navn"/></td>
                     <td align="center"><xsl:value-of select = "pre:poeng" /></td>
                     <td align="center"><xsl:value-of select = "pre:semester" /></td>
                  </tr>
               </xsl:for-each>
            </table>

            <h2>3.studieår</h2>
            <p>Følgende oversikt viser emner for 3.studieår ved Informasjonsteknologi studiet ved HVL.</p>
            <p>Hvilke fagkombinasjoner avhenger av spesialisering og valgte valgfag.</p>

            <table border = "1"  width="600">
               <tr bgcolor = "#9acd32">
                  <th>Kode</th>
                  <th>Emne</th>
                  <th>Studiepoeng</th>
                  <th>semester</th>
               </tr>
               <xsl:for-each select = "pre:emne[pre:semester>4]">
                  <xsl:sort data-type="number" select="pre:semester"/>
                  <tr>
                     <td><xsl:value-of select = "pre:kode"/></td>
                     <td><xsl:value-of select = "pre:navn"/></td>
                     <td align="center"><xsl:value-of select = "pre:poeng" /></td>
                     <td align="center"><xsl:value-of select = "pre:semester" /></td>
                  </tr>
               </xsl:for-each>
            </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>