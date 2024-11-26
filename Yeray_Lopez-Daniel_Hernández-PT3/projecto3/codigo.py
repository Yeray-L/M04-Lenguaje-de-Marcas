from lxml import etree

# Archivos XML y XSLT
xml_file = 'recetas.xml'  # Ajusta el nombre si es necesario
xslt_file = 'recetas-html.xslt'

# Cargar y analizar los archivos XML y XSLT
xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

# Encontrar todas las recetas en el XML
recipes = xml.xpath('//recepta')
print(f"Se encontraron {len(recipes)} recetas en el XML.")
#print(f"check recipes: {recipes}")


# Aplicar la transformación para cada receta
for recipe in recipes:
    # Extraer el nombre y el autor de la receta
    recipe_name = recipe.find('nom').text
    recipe_author = recipe.find('autor/nom').text
    print(f"Procesando receta: {recipe_name} por {recipe_author}")

    # Realizar la transformación en la receta completa
    output = transform(recipe)
    print(f"check output: {output}")


    # Verificar si la transformación generó un resultado
    if output is not None:
        # Generar un nombre de archivo basado en el nombre de la receta
        filename = f"{recipe_name.replace(' ', '_')}.html"
        print(f"check: {filename}")
        

        # Escribir el resultado en un archivo HTML
        with open(filename, 'wb') as f:
            f.write(etree.tostring(output, pretty_print=True, encoding='UTF-8'))

        print(f"Generado: {filename}")
    else:
        print(f"Falló la transformación para la receta: {recipe_name}")
