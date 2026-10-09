from PIL import Image

img = Image.open('night_s_edge.png')
img = img.convert('RGBA')

# Simple approach: make white background transparent
pixels = img.load()

for y in range(img.height):
    for x in range(img.width):
        r, g, b, a = pixels[x, y]
        # If pixel is very light, make it transparent
        if r > 240 and g > 240 and b > 240:
            pixels[x, y] = (255, 255, 255, 0)

img.save('night_s_edge_clean.png')
print('Fixed with simple pixel loop')
