<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:syriaca="http://syriaca.org">
    
    <xsl:output encoding="UTF-8" indent="yes" method="xml" name="xml" />
    
    <xsl:variable name="n">
        <xsl:text>
</xsl:text>
    </xsl:variable>
    <xsl:variable name="s"><xsl:text> </xsl:text></xsl:variable>

    <xsl:template match="/">
        <xsl:for-each select="//row">
            <xsl:variable name="filename" select="concat(Bibl_ID,'.xml')"/>
            <xsl:result-document href="{$filename}" format="xml">
                <xsl:processing-instruction name="xml-model">
                    <xsl:text>href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
                </xsl:processing-instruction>
                <xsl:value-of select="$n"/>
                
                <TEI
                    xml:lang="en"
                    xmlns="http://www.tei-c.org/ns/1.0">
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <title level="a" xml:lang="en">
                                    <xsl:value-of select="Headword"/>
                                </title>
                                <title level="m" xml:lang="en">The Gorgias Encyclopedic Dictionary of the Syriac Heritage</title>
                                <sponsor>Syriaca.org: The Syriac Reference Portal</sponsor>
                                <funder>The National Endowment for the Humanities</funder>
                                <funder>The International Balzan Prize Foundation</funder>
                                <principal>David A. Michelson</principal>
                                <editor role="general" ref="http://syriaca.org/editors.xml#tcarlson">Thomas A. Carlson</editor>
                                <editor role="general" ref="http://syriaca.org/editors.xml#dmichelson">David A. Michelson</editor>
                                <editor role="creator" ref="http://syriaca.org/editors.xml#tcarlson">Thomas A. Carlson</editor>
                                <respStmt>
                                    <resp>XML coded by</resp>
                                    <name ref="http://syriaca.org/editors.xml#tcarlson">Thomas A. Carlson</name>
                                </respStmt>
                                <respStmt>
                                    <resp>Page numbers entered by</resp>
                                    <name ref="http://syriaca.org/editors.xml#avawter">Alex Vawter</name>
                                </respStmt>
                            </titleStmt>
                            <editionStmt>
                                <edition n="1.0"/>
                            </editionStmt>
                            <publicationStmt>
                                <authority>Syriaca.org: The Syriac Reference Portal</authority>
                                <idno type="URI">http://syriaca.org/bibl/<xsl:value-of select="Bibl_ID"/>/tei</idno>
                                <availability>
                                    <licence target="http://creativecommons.org/licenses/by/3.0/">
                                        <p>Distributed under a Creative Commons Attribution 3.0 Unported License.</p>
                                    </licence>
                                </availability>
                                <date><xsl:value-of select="current-date()"/></date>
                            </publicationStmt>
                            <sourceDesc>
                                <p>Born digital.</p>
                            </sourceDesc>
                        </fileDesc>
                        <revisionDesc>
                            <change who="http://syriaca.org/editors.xml#tcarlson"><xsl:attribute name="when" select="current-date()"/>CREATED: bibl</change>
                        </revisionDesc>
                    </teiHeader>
                    <text>
                        <body>
                            <biblStruct>
                                <analytic>
                                    <xsl:choose>
                                        <xsl:when test="contains(Author,' and ')">
                                            <xsl:for-each select="tokenize(Author,' and ')">
                                                <author><xsl:value-of select="."/></author>
                                            </xsl:for-each>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <author><xsl:value-of select="Author"/></author>        <!-- FUTURE: parse author names by last [A-Z]\. -->
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <title level="a" xml:lang="en"><xsl:value-of select="Headword"/></title>
                                </analytic>
                                <monogr>
                                    <editor>
                                        <persName>
                                            <forename>Sebastian</forename>
                                            <addName type="middle-initial">P.</addName>
                                            <surname>Brock</surname>
                                        </persName>
                                    </editor>
                                    <editor>
                                        <persName>
                                            <forename>Aaron</forename>
                                            <addName type="middle-initial">M.</addName>
                                            <surname>Butts</surname>
                                        </persName>
                                    </editor>
                                    <editor>
                                        <persName>
                                            <forename>George</forename>
                                            <addName type="middle-initial">A.</addName>
                                            <surname>Kiraz</surname>
                                        </persName>
                                    </editor>
                                    <editor>
                                        <persName>
                                            <forename>Lucas</forename>
                                            <surname>Van Rompay</surname>
                                        </persName>
                                    </editor>
                                    <title xml:lang="en" level="m">The Gorgias Encyclopedic Dictionary of the Syriac Heritage</title>
                                    <idno type="URI">http://syriaca.org/bibl/1</idno>
                                    <imprint>
                                        <publisher>Gorgias Press</publisher>
                                        <pubPlace ref="http://syriaca.org/place/840">Piscataway, <placeName ref="http://syriaca.org/place/841">NJ</placeName></pubPlace>
                                        <date>2011</date>
                                    </imprint>
                                    <biblScope type="page"><xsl:value-of select="Pages"/></biblScope>
                                </monogr>
                                <idno type="URI">http://syriaca.org/bibl/<xsl:value-of select="Bibl_ID"/></idno>
                            </biblStruct>
                        </body>
                    </text>
                </TEI>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>