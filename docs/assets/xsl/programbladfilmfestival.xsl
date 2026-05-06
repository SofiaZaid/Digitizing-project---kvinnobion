<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>
    
    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI"/>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:TEI[@xml:id='filmfestival-public-01']">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text><xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                    Kvinnobion - en del av kvinnorörelsen
                </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                <link rel="stylesheet" href="assets/css/main.css"/>
                <!--        <link rel="stylesheet" href="assets/css/desktop.css"/>-->
            </head>
            <body>
                <header>
                    <h1>
                        Galleri
                    </h1>
                </header>
                <nav id="sitenav">
                    <a href="home.html">Hem</a> |
                    <a href="gallery.html">Galleri</a> |
                    <a href="about.html">Om oss</a> |
                    <a href="resources.html">Resurser</a> |
                </nav>
                <main id="manuscript">
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei"/>
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="row" id="headerGallery">
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </div>
                    <div class="container">
                        <!-- define a row layout with bootstrap's css classes (two columns with content, and an empty column in between) -->
                        
                        <div class="row">
                            <div class="col-sm">
                                <h3>Faksimil</h3>
                                <!-- needs fixing if we have more than one facsimile -->
                                <xsl:for-each select="tei:facsimile">
                                    <article>
                                        <!-- make an HTML <img> element, with a maximum width of 400 pixels -->
                                        <img class="img-full zoom">
                                            <!-- give this HTML <img> attribute three more attributes:
                                                        @src to locate the image file
                                                        @title for a mouse-over effect
                                                        @alt for alternative text (in case the image fails to load, 
                                                            and so people with a visual impairment can still understant what the image displays 
                                                      
                                                      in the XPath expressions below, we use the variable $facs (declared above) 
                                                            so we can use this page's @facs element with to find the corresponding <surface>
                                                            (because it matches with the <surface's @xml:id) 
                                                
                                                      we use the substring-after() function because when we match our page's @facs with the <surface>'s @xml:id,
                                                            we want to disregard the hashtag in the @facs attribute-->
                                            
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:surface[1]/tei:figure/tei:graphic[1]/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:surface[1]/tei:figure/tei:label"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="tei:surface[1]/tei:figure/tei:figDesc"/>
                                            </xsl:attribute>
                                        </img>
                                    </article>
                                </xsl:for-each>
                            </div>
                            <div class="col-sm transcription">
                                <h3>Transkription</h3>
                                <article>
                                    <xsl:apply-templates select="tei:text/tei:body/tei:div[1]"/>
                                </article>
                            </div>           
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <h3>Faksimil</h3>
                                <!-- needs fixing if we have more than one facsimile -->
                                <xsl:for-each select="tei:facsimile">
                                    <article>
                                        <!-- make an HTML <img> element, with a maximum width of 400 pixels -->
                                        <img class="img-full zoom">
                                            <!-- give this HTML <img> attribute three more attributes:
                                                        @src to locate the image file
                                                        @title for a mouse-over effect
                                                        @alt for alternative text (in case the image fails to load, 
                                                            and so people with a visual impairment can still understant what the image displays 
                                                      
                                                      in the XPath expressions below, we use the variable $facs (declared above) 
                                                            so we can use this page's @facs element with to find the corresponding <surface>
                                                            (because it matches with the <surface's @xml:id) 
                                                
                                                      we use the substring-after() function because when we match our page's @facs with the <surface>'s @xml:id,
                                                            we want to disregard the hashtag in the @facs attribute-->
                                            
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:surface[2]/tei:figure/tei:graphic[1]/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:surface[2]/tei:figure/tei:label"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="tei:surface[2]/tei:figure/tei:figDesc"/>
                                            </xsl:attribute>
                                        </img>
                                    </article>
                                </xsl:for-each>
                            </div>
                            <div class="col-sm transcription">
                                <h3>Transkription</h3>
                                <article>
                                    <xsl:apply-templates select="tei:text/tei:body/tei:div[2]"/>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <h3>Faksimil</h3>
                                <!-- needs fixing if we have more than one facsimile -->
                                <xsl:for-each select="tei:facsimile">
                                    <article>
                                        <!-- make an HTML <img> element, with a maximum width of 400 pixels -->
                                        <img class="img-full zoom">
                                            <!-- give this HTML <img> attribute three more attributes:
                                                        @src to locate the image file
                                                        @title for a mouse-over effect
                                                        @alt for alternative text (in case the image fails to load, 
                                                            and so people with a visual impairment can still understant what the image displays 
                                                      
                                                      in the XPath expressions below, we use the variable $facs (declared above) 
                                                            so we can use this page's @facs element with to find the corresponding <surface>
                                                            (because it matches with the <surface's @xml:id) 
                                                
                                                      we use the substring-after() function because when we match our page's @facs with the <surface>'s @xml:id,
                                                            we want to disregard the hashtag in the @facs attribute-->
                                            
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:surface[3]/tei:figure/tei:graphic[1]/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:surface[3]/tei:figure/tei:label"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="tei:surface[3]/tei:figure/tei:figDesc"/>
                                            </xsl:attribute>
                                        </img>
                                    </article>
                                </xsl:for-each>
                            </div>
                            <div class="col-sm transcription">
                                <h3>Transkription</h3>
                                <article>
                                    <xsl:apply-templates select="tei:text/tei:body/tei:div[3]"/>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <h3>Faksimil</h3>
                                <!-- needs fixing if we have more than one facsimile -->
                                <xsl:for-each select="tei:facsimile">
                                    <article>
                                        <!-- make an HTML <img> element, with a maximum width of 400 pixels -->
                                        <img class="img-full zoom">
                                            <!-- give this HTML <img> attribute three more attributes:
                                                        @src to locate the image file
                                                        @title for a mouse-over effect
                                                        @alt for alternative text (in case the image fails to load, 
                                                            and so people with a visual impairment can still understant what the image displays 
                                                      
                                                      in the XPath expressions below, we use the variable $facs (declared above) 
                                                            so we can use this page's @facs element with to find the corresponding <surface>
                                                            (because it matches with the <surface's @xml:id) 
                                                
                                                      we use the substring-after() function because when we match our page's @facs with the <surface>'s @xml:id,
                                                            we want to disregard the hashtag in the @facs attribute-->
                                            
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:surface[4]/tei:figure/tei:graphic[1]/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:surface[4]/tei:figure/tei:label"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="tei:surface[4]/tei:figure/tei:figDesc"/>
                                            </xsl:attribute>
                                        </img>
                                    </article>
                                </xsl:for-each>
                            </div>
                            <div class="col-sm transcription">
                                <h3>Transkription</h3>
                                <article>
                                    <xsl:apply-templates select="tei:text/tei:body/tei:div[4]"/>
                                </article>
                            </div>
                        </div>
                    </div>
                </main>
                <footer>
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <div>
                                <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                                    <img src="assets/img/logos/cc.svg" class="copyright_logo" alt="Creative Commons License"/><img src="assets/img/logos/by.svg" class="copyright_logo" alt="Attribution 4.0 International"/>
                                </a>
                            </div>
                            <div>
                                2026
                            </div>
                        </div>
                    </div>
                </footer>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
    <!-- by default all text nodes are printed out, unless something else is defined.
    We don't want to show the metadata. So we write a template for the teiHeader that
    stops the text nodes underneath (=nested in) teiHeader from being printed into our
    html-->
    
    <!-- turn tei linebreaks (lb) into html linebreaks (br) -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <!--   <xsl:template match="tei:cb">
        <col>
            <xsl:apply-templates/>
        </col>
    </xsl:template>-->
    <!-- not: in the previous template there is no <xsl:apply-templates/>. This is because there is nothing to
    process underneath (nested in) tei lb's. Therefore the XSLT processor does not need to look for templates to
    apply to the nodes nested within it.-->
    
    <!-- we turn the tei head element (headline) into an html h1 element-->
    <xsl:template match="tei:head [@xml:id='filmfestival-public-01']">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <!-- transform tei paragraphs into html paragraphs -->
    <xsl:template match="tei:p">
        <p>
            <!-- apply matching templates for anything that was nested in tei:p -->
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:sic">
        <strike>
            <xsl:apply-templates/>
        </strike>
    </xsl:template>   
    <xsl:template match="tei:hi[@rend='bold']">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template> 
    <xsl:template match="tei:hi[@rend='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template> 
</xsl:stylesheet>