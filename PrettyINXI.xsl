<?xml version="1.0" encoding="UTF-8"?>

<!--
XML Style Sheet

@category  XSL
@package   PrettyINXI
@author    Luca Mauri - www.lucamauri.com
@copyright 2020 Luca Mauri
@license   https://www.gnu.org/licenses/gpl-3.0.html GNU General Public License version 3
@version   v.1.0
@link      https://github.com/lucamauri/PrettyINXI
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output version="4.0" method="html" indent="no"
                encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"
                doctype-system="http://www.w3.org/TR/html4/loose.dtd" />
    <xsl:template match="/perldata">
        <head>
            <link href="PrettyINXI.css" rel="stylesheet" type="text/css" />
        </head>
        <html>
            <body>
                <h1>INXI Report</h1>
                <p>List of Items</p>
                <xsl:for-each select="hashref/item">
                    <h2><xsl:value-of select="@key"/></h2>  
                    <xsl:for-each select="arrayref/item">
                        <h3><xsl:value-of select="@key"/> - <xsl:value-of select="hashref/@memory_address"/></h3>  
                        <table class="hashref" border="1">
                            <tr>
                                <th>ID</th>
                                <th>Key</th>
                                <th>Value</th>
                            </tr>
                            <xsl:for-each select="hashref/item">
                                <tr>
                                    <td class="tabledesc"><xsl:value-of select="substring-before(@key, '#')"/></td>
                                    <td class="tabledesc"><xsl:value-of select="substring-after(@key, '#')"/></td>
                                    <td class="tableval"><xsl:value-of select="current()"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>                  
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>    
</xsl:stylesheet>