
import os
from pathlib import Path
from google import genai
from google.genai import types

api_key = os.environ.get("GEMINI_API_KEY")

if not api_key:
    raise RuntimeError("GEMINI_API_KEY environment variable is not set.")

client = genai.Client(api_key=api_key)

output_dir = Path("src/main/webapp/images/foods")
output_dir.mkdir(parents=True, exist_ok=True)

prompt = """
Create a photorealistic restaurant-quality food photograph of
Paneer Butter Masala, an Indian dish with soft paneer cubes in
rich orange tomato-butter gravy, served in a dark ceramic bowl.
Natural restaurant lighting, appetizing presentation, realistic
food texture, close-up composition, no text, no watermark,
square image suitable for a food delivery website.
"""

response = client.models.generate_content(
    model="gemini-2.5-flash-image",
    contents=prompt,
    config=types.GenerateContentConfig(
        response_modalities=["IMAGE", "TEXT"]
    ),
)

saved = False

for part in response.parts:
    if part.inline_data is not None:
        image = part.as_image()
        image.save(str(output_dir / "paneer-butter-masala.png"))
        saved = True
        break

if not saved:
    raise RuntimeError("No image returned. Check model access and API errors.")

print("Image saved:", output_dir / "paneer-butter-masala.png")

