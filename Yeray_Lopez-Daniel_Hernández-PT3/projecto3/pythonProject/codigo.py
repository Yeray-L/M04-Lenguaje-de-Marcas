# Load the XML and XSLT files
xml_file = 'recipes.xml'
xslt_file = 'recipes-to-html.xslt'

# Parse the XML and XSLT files
xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

# Check if the XML has recipe elements
recipes = xml.xpath('//recipe')
print(f"Found {len(recipes)} recipes in the XML.")

# Apply the transformation for each recipe
for recipe in recipes:
    print(f"Processing recipe: {recipe.get('id')} - {recipe.find('name').text}")

    # Perform the transformation on the individual recipe
    output = transform(recipe)

    # Check if the transformation produced output
    if output is not None:
        # Generate the output HTML filename based on the recipe ID
        filename = f"recipe{recipe.get('id')}.html"

        # Write the output to the respective file
        with open(filename, 'wb') as f:
            f.write(etree.tostring(output, pretty_print=True))

        print(f"Generated: {filename}")
    else:
        print(f"Transformation failed for recipe {recipe.get('id')}")
