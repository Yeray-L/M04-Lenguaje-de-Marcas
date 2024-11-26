<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html>           
            <head>
                <title>Receta: <xsl:value-of select="recepta/nom" /></title>
                <link rel="stylesheet" href="../projecto2/css/ex1.css" />
            </head>



            <body>
            
                    <img id="imagen1" src="../projecto2/imagenes/Logo-Delicias.png" alt="Delicias" />
                    <hr/>
                    <ul>
                        <ul id="menu">
                            <a id="menub" href="../projecto2/ex1.html">INICIO</a>
                            <a id="menub" href="../projecto2/sobre_mi/sobremi.html">SOBRE MÍ</a>
                            <a id="menub" href="../projecto2/receta/receta.html">RECETAS</a>
                            <a id="menub" href="../projecto2/contacto/contacto.html">CONTACTO</a>
                            <a id="menub" href="../projecto2/listado/listado.html">OTRAS COSAS</a>
                        </ul>
                    </ul>
                    <hr/>


                <div class="receta-container">
                    <h1><xsl:value-of select="recepta/nom" /></h1>
                    <p><strong>Autor:</strong> <xsl:value-of select="recepta/autor/nom" /></p>
                    <p><strong>DNI:</strong> <xsl:value-of select="recepta/autor/dni" /></p>
                    
                    <!-- Mostrar ingredientes -->
                    <h2>Ingredientes</h2>
                    <ul>
                        <xsl:for-each select="recepta/ingredients/ingredient">
                            <li>
                                <xsl:value-of select="nom" />: 
                                <xsl:value-of select="quantitat/valor" />
                                <xsl:value-of select="quantitat/mesura" />
                            </li>
                        </xsl:for-each>
                    </ul>
                    <div class="detalle-receta">
                            <!-- Mostrar pasos -->
                        <h2>Pasos</h2>
                        <ol>
                            <xsl:for-each select="recepta/passos/pas">
                                <li><xsl:value-of select="." /></li>
                            </xsl:for-each>
                        </ol>
                    </div>
                </div>
            </body>
                <footer>
                    <ul>
                    <ul id="menu2">
                        <a id="menuc" target="_blank" href="https://www.facebook.com">FACEBOOK</a>
                        <a id="menuc" target="_blank" href="https://www.x.com">TWITTER</a>
                        <a id="menuc" target="_blank" href="https://www.instagram.com">INSTAGRAM</a>
                        <a id="menuc" target="_blank" href="https://www.pinterest.com">PINTEREST</a>
                        <a id="menuc" target="_blank" href="mailto:daniel.hernandez.zerpa.7e7@itb.cat">EMAIL</a>
                        <a id="menuc" target="_blank" href="./index.html">RSS</a>
                    </ul>
                    </ul>
                </footer>
        </html>
    </xsl:template>
</xsl:stylesheet>
