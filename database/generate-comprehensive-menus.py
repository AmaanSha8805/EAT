#!/usr/bin/env python3
"""
Generate comprehensive menu items for all restaurants to reach minimum 100 items each.
"""

import json
from collections import defaultdict

# Restaurant data from API
restaurants = [
    {"id": 1, "name": "Veg Aroma Restaurant", "cuisine": "North Indian, Maharashtrian", "pure_veg": True},
    {"id": 2, "name": "Hotel Rajhans Family Rooftop Restaurant", "cuisine": "Chinese", "pure_veg": False},
    {"id": 4, "name": "Hotel Radhika Place and City Palace", "cuisine": "North Indian, Chinese", "pure_veg": False},
    {"id": 31, "name": "Hotel Poonam", "cuisine": "North Indian, Maharashtrian", "pure_veg": True},
    {"id": 32, "name": "Hotel Temptation Pure Veg", "cuisine": "Maharashtrian, North Indian", "pure_veg": True},
    {"id": 33, "name": "Saffron Veg Restaurant", "cuisine": "North Indian, Maharashtrian", "pure_veg": True},
    {"id": 34, "name": "Spice Garden", "cuisine": "North Indian", "pure_veg": False},
    {"id": 35, "name": "Dosa Corner", "cuisine": "South Indian", "pure_veg": False},
    {"id": 36, "name": "Dragon Wok", "cuisine": "Chinese", "pure_veg": False},
    {"id": 37, "name": "Pizza Paradise", "cuisine": "Italian", "pure_veg": False},
    {"id": 38, "name": "Brew & Bean", "cuisine": "Beverages", "pure_veg": False},
    {"id": 39, "name": "Sweet Delights", "cuisine": "Desserts", "pure_veg": False},
]

# Food item templates by cuisine
north_indian_veg = {
    "Starters": [
        ("Paneer Tikka", "Marinated paneer cubes grilled to perfection", 220, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Hara Bhara Kabab", "Spinach and green pea patties", 180, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80"),
        ("Veg Manchurian", "Crispy vegetable balls in tangy sauce", 190, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Spring Roll", "Crispy vegetable spring rolls", 150, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Paneer 65", "Spicy paneer cubes deep fried", 200, "https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80"),
        ("Mushroom Tikka", "Marinated mushrooms grilled", 210, "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80"),
        ("Aloo Tikki", "Spiced potato patties", 120, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Dahi Kebab", "Hung curd patties", 180, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Corn Cheese Balls", "Crispy corn and cheese balls", 170, "https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80"),
        ("Veg Crispy", "Crispy vegetable fingers", 160, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
    ],
    "Main Course": [
        ("Paneer Butter Masala", "Creamy paneer in tomato gravy", 240, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Dal Makhani", "Creamy black lentils", 180, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Mix Veg", "Mixed vegetables in gravy", 200, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Palak Paneer", "Spinach with paneer cubes", 220, "https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80"),
        ("Kadai Paneer", "Paneer in bell pepper gravy", 230, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Shahi Paneer", "Royal paneer in cashew gravy", 250, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80"),
        ("Matar Paneer", "Peas with paneer", 210, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Malai Kofta", "Cheese dumplings in creamy gravy", 260, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Veg Kolhapuri", "Spicy vegetable curry", 220, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Chana Masala", "Chickpeas in spiced gravy", 190, "https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80"),
        ("Rajma Masala", "Kidney beans in gravy", 180, "https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80"),
        ("Aloo Gobi", "Potato and cauliflower curry", 160, "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80"),
        ("Baingan Bharta", "Smoked eggplant curry", 170, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Bhindi Masala", "Okra in spiced gravy", 160, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Paneer Do Pyaza", "Paneer with double onions", 230, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
    ],
    "Rice": [
        ("Vegetable Biryani", "Fragrant rice with mixed vegetables", 220, "https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80"),
        ("Jeera Rice", "Cumin flavored rice", 100, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80"),
        ("Veg Pulao", "Mildly spiced rice with vegetables", 180, "https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80"),
        ("Kashmiri Pulao", "Sweet and aromatic rice", 200, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80"),
        ("Tawa Pulao", "Spiced rice cooked on tawa", 190, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
        ("Lemon Rice", "Tangy lemon flavored rice", 140, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80"),
        ("Curd Rice", "Comforting yogurt rice", 120, "https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80"),
        ("Tomato Rice", "Spicy tomato rice", 150, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80"),
        ("Methi Rice", "Fenugreek flavored rice", 160, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
        ("Coconut Rice", "Coconut flavored rice", 170, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80"),
    ],
    "Bread": [
        ("Butter Naan", "Soft butter naan", 40, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
        ("Garlic Naan", "Naan with garlic butter", 45, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Cheese Naan", "Naan stuffed with cheese", 55, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
        ("Tandoori Roti", "Whole wheat tandoori bread", 25, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Missi Roti", "Spiced gram flour bread", 30, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
        ("Kulcha", "Stuffed bread", 35, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Paratha", "Layered flatbread", 40, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
        ("Aloo Paratha", "Potato stuffed paratha", 50, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Paneer Paratha", "Paneer stuffed paratha", 60, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Laccha Paratha", "Layered crispy paratha", 45, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
    ],
    "Maharashtrian": [
        ("Misal Pav", "Spicy sprouted curry with bread", 140, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Pav Bhaji", "Spiced vegetable mash with bread", 160, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80"),
        ("Vada Pav", "Potato fritter in burger bun", 40, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Puran Poli", "Sweet flatbread with jaggery filling", 60, "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80"),
        ("Sabudana Khichdi", "Tapioca pearls with peanuts", 120, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Pithla Bhakri", "Gram flour curry with flatbread", 100, "https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80"),
        ("Bhel Puri", "Puffed rice with chutneys", 80, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Sev Puri", "Crispy puri with toppings", 90, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Dahi Misal", "Misal with yogurt", 150, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Usal Pav", "Spiced sprouted curry", 130, "https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80"),
    ],
}

north_indian_nonveg = {
    "Starters": [
        ("Chicken Tikka", "Marinated chicken grilled", 260, "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80"),
        ("Chicken 65", "Spicy fried chicken", 240, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Mutton Seekh Kebab", "Minced mutton skewers", 320, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Fish Tikka", "Marinated fish grilled", 280, "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80"),
        ("Chicken Lollipop", "Chicken wings in sauce", 250, "https://images.unsplash.com/photo-1562967916-eb82221dfb92?w=500&q=80"),
        ("Mutton Galouti Kebab", "Melt-in-mouth mutton kebabs", 350, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Reshmi Kebab", "Silky chicken kebabs", 270, "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80"),
        ("Tandoori Chicken", "Spiced tandoori chicken", 290, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Chicken Manchurian", "Chicken in Indo-Chinese sauce", 260, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Prawn Koliwada", "Spiced fried prawns", 340, "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80"),
    ],
    "Main Course": [
        ("Butter Chicken", "Chicken in creamy tomato gravy", 280, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80"),
        ("Chicken Tikka Masala", "Chicken in spiced gravy", 270, "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80"),
        ("Mutton Rogan Josh", "Kashmiri style mutton curry", 340, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Chicken Korma", "Chicken in mild creamy gravy", 260, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Mutton Biryani", "Aromatic mutton rice", 320, "https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80"),
        ("Chicken Biryani", "Aromatic chicken rice", 280, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80"),
        ("Keema Matar", "Minced meat with peas", 260, "https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80"),
        ("Egg Curry", "Eggs in spiced gravy", 180, "https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80"),
        ("Fish Curry", "Fish in coconut gravy", 300, "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&q=80"),
        ("Chicken Do Pyaza", "Chicken with double onions", 270, "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80"),
        ("Mutton Do Pyaza", "Mutton with double onions", 330, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Kadai Chicken", "Chicken in bell pepper gravy", 280, "https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?w=500&q=80"),
        ("Chicken Chettinad", "Spicy South Indian chicken", 290, "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80"),
        ("Mutton Kofta", "Mutton dumplings in gravy", 350, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Egg Bhurji", "Scrambled eggs with spices", 160, "https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80"),
    ],
}

chinese_items = {
    "Starters": [
        ("Veg Spring Roll", "Crispy vegetable rolls", 140, "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80"),
        ("Chicken Spring Roll", "Crispy chicken rolls", 160, "https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80"),
        ("Veg Momos", "Steamed vegetable dumplings", 120, "https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80"),
        ("Chicken Momos", "Steamed chicken dumplings", 140, "https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80"),
        ("Honey Chilli Potato", "Crispy potatoes in honey sauce", 150, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80"),
        ("Crispy Corn", "Fried corn with spices", 160, "https://images.unsplash.com/photo-1529042410759-befb1204b468?w=500&q=80"),
        ("Paneer Chilli", "Spicy paneer in sauce", 180, "https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80"),
        ("Chicken Chilli", "Spicy chicken in sauce", 200, "https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80"),
        ("Veg Wontons", "Fried vegetable wontons", 150, "https://images.unsplash.com/photo-1496116218417-1a781b1c423c?w=500&q=80"),
        ("Chicken Wontons", "Fried chicken wontons", 170, "https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80"),
    ],
    "Main Course": [
        ("Veg Fried Rice", "Stir-fried rice with vegetables", 180, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80"),
        ("Chicken Fried Rice", "Stir-fried rice with chicken", 220, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80"),
        ("Veg Noodles", "Stir-fried noodles with vegetables", 170, "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80"),
        ("Chicken Noodles", "Stir-fried noodles with chicken", 210, "https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80"),
        ("Hakka Noodles", "Spicy vegetable noodles", 180, "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80"),
        ("Schezwan Fried Rice", "Spicy Schezwan rice", 200, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80"),
        ("Manchurian Gravy", "Veg balls in gravy", 190, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Gobi Manchurian", "Cauliflower in sauce", 180, "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80"),
        ("Paneer Fried Rice", "Fried rice with paneer", 200, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80"),
        ("Egg Fried Rice", "Fried rice with egg", 190, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80"),
        ("Singapore Noodles", "Curried noodles", 190, "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80"),
        ("Thai Fried Rice", "Thai style fried rice", 210, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80"),
        ("Veg Manchow Soup", "Spicy vegetable soup", 120, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Hot and Sour Soup", "Spicy tangy soup", 130, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
        ("Sweet Corn Soup", "Creamy corn soup", 110, "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80"),
    ],
}

south_indian_items = {
    "Dosa": [
        ("Masala Dosa", "Crispy dosa with potato filling", 80, "https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop"),
        ("Plain Dosa", "Simple crispy dosa", 60, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop"),
        ("Rava Dosa", "Crispy semolina dosa", 70, "https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop"),
        ("Onion Dosa", "Dosa topped with onions", 75, "https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop"),
        ("Cheese Dosa", "Dosa with cheese", 90, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop"),
        ("Paper Dosa", "Extra thin crispy dosa", 70, "https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop"),
        ("Set Dosa", "Soft spongy dosa", 65, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop"),
        ("Pesarattu", "Green gram dosa", 70, "https://images.unsplash.com/photo-1626132647523-66d4e8c2f8e0?w=400&h=300&fit=crop"),
        ("Mysore Dosa", "Dosa with red chutney", 85, "https://images.unsplash.com/photo-1585937421612-70a008356f36?w=400&h=300&fit=crop"),
        ("Ghee Roast", "Dosa cooked in ghee", 95, "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=400&h=300&fit=crop"),
    ],
    "Idli": [
        ("Idli Sambar", "Steamed rice cakes with sambar", 60, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Plain Idli", "Steamed rice cakes", 40, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Rava Idli", "Semolina idli", 50, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Kanchipuram Idli", "Spiced idli", 60, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Thatte Idli", "Large plate idli", 70, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Mini Idli", "Small idli plates", 55, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Stuffed Idli", "Idli with filling", 65, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Podi Idli", "Idli with spice powder", 60, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
    ],
    "Uttapam": [
        ("Uttapam", "Thick pancake with toppings", 90, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Onion Uttapam", "Uttapam with onions", 95, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Tomato Uttapam", "Uttapam with tomatoes", 95, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Mixed Veg Uttapam", "Uttapam with vegetables", 100, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
        ("Cheese Uttapam", "Uttapam with cheese", 110, "https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&h=300&fit=crop"),
    ],
    "Snacks": [
        ("Vada", "Crispy lentil fritters", 50, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Medu Vada", "Urad dal fritters", 50, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Masala Vada", "Spiced fritters", 55, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=400&h=300&fit=crop"),
        ("Pongal", "Rice and lentil dish", 80, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=400&h=300&fit=crop"),
        ("Upma", "Semolina dish", 60, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400&h=300&fit=crop"),
        ("Ven Pongal", "Spicy pongal", 85, "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=400&h=300&fit=crop"),
        ("Bisi Bele Bath", "Spiced rice dish", 90, "https://images.unsplash.com/photo-1596797038530-2c107229654b?w=400&h=300&fit=crop"),
        ("Curd Rice", "Yogurt rice", 50, "https://images.unsplash.com/photo-1596797038530-2c107229654b?w=400&h=300&fit=crop"),
    ],
}

italian_items = {
    "Pizza": [
        ("Margherita Pizza", "Classic tomato and cheese pizza", 250, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Pepperoni Pizza", "Pizza with pepperoni", 320, "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500&q=80"),
        ("Veggie Pizza", "Loaded vegetable pizza", 280, "https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80"),
        ("BBQ Chicken Pizza", "BBQ chicken pizza", 340, "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80"),
        ("Cheese Pizza", "Extra cheese pizza", 270, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Mushroom Pizza", "Pizza with mushrooms", 290, "https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80"),
        ("Onion Pizza", "Pizza with caramelized onions", 260, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Capsicum Pizza", "Pizza with bell peppers", 270, "https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80"),
        ("Paneer Pizza", "Indian style paneer pizza", 300, "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80"),
        ("Tandoori Chicken Pizza", "Tandoori chicken pizza", 350, "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80"),
    ],
    "Pasta": [
        ("Penne Alfredo", "Creamy white sauce pasta", 240, "https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80"),
        ("Spaghetti Carbonara", "Bacon and egg pasta", 260, "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80"),
        ("Mac and Cheese", "Creamy macaroni and cheese", 220, "https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&q=80"),
        ("Penne Arrabbiata", "Spicy tomato pasta", 230, "https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80"),
        ("Fettuccine Alfredo", "Creamy fettuccine", 250, "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80"),
        ("Lasagna", "Layered pasta with cheese", 280, "https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=500&q=80"),
        ("Ravioli", "Stuffed pasta in sauce", 200, "https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80"),
        ("Pesto Pasta", "Basil pesto pasta", 240, "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80"),
        ("Aglio Olio", "Garlic and olive oil pasta", 210, "https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&q=80"),
        ("Bolognese", "Meat sauce pasta", 270, "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80"),
    ],
    "Sides": [
        ("Garlic Bread", "Toasted garlic bread", 120, "https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=500&q=80"),
        ("Cheese Garlic Bread", "Garlic bread with cheese", 150, "https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=500&q=80"),
        ("Bruschetta", "Tomato bruschetta", 140, "https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=500&q=80"),
        ("Caesar Salad", "Classic caesar salad", 180, "https://images.unsplash.com/photo-1550304943-4f24f54ddde9?w=500&q=80"),
        ("Greek Salad", "Fresh vegetable salad", 160, "https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500&q=80"),
    ],
}

beverage_items = {
    "Coffee": [
        ("Espresso", "Strong black coffee", 80, "https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80"),
        ("Cappuccino", "Espresso with steamed milk", 120, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Latte", "Espresso with lots of milk", 130, "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80"),
        ("Americano", "Espresso with hot water", 100, "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80"),
        ("Mocha", "Chocolate coffee", 140, "https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500&q=80"),
        ("Cold Coffee", "Iced coffee", 120, "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80"),
        ("Frappuccino", "Blended iced coffee", 150, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Irish Coffee", "Coffee with whiskey", 180, "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80"),
        ("Turkish Coffee", "Traditional Turkish coffee", 110, "https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=500&q=80"),
        ("Filter Coffee", "South Indian filter coffee", 90, "https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=300&fit=crop"),
    ],
    "Tea": [
        ("Masala Chai", "Spiced Indian tea", 50, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80"),
        ("Green Tea", "Healthy green tea", 60, "https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80"),
        ("Lemon Tea", "Tea with lemon", 55, "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80"),
        ("Ginger Tea", "Tea with ginger", 55, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80"),
        ("Iced Tea", "Cold tea", 70, "https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80"),
        ("Earl Grey", "Classic black tea", 65, "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80"),
        ("Peppermint Tea", "Mint tea", 60, "https://images.unsplash.com/photo-1556881286-fc6915169721?w=500&q=80"),
        ("Chamomile Tea", "Herbal tea", 65, "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80"),
    ],
    "Cold Drinks": [
        ("Mojito", "Fresh mint mojito", 120, "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80"),
        ("Virgin Mojito", "Non-alcoholic mojito", 100, "https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80"),
        ("Lemonade", "Fresh lemonade", 70, "https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500&q=80"),
        ("Iced Lemon Tea", "Cold lemon tea", 80, "https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80"),
        ("Strawberry Shake", "Strawberry milkshake", 130, "https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80"),
        ("Chocolate Shake", "Chocolate milkshake", 140, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Mango Shake", "Mango milkshake", 130, "https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80"),
        ("Vanilla Shake", "Vanilla milkshake", 120, "https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500&q=80"),
        ("Oreo Shake", "Oreo milkshake", 150, "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80"),
        ("Cold Coffee with Ice Cream", "Coffee with ice cream", 160, "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80"),
    ],
    "Smoothies": [
        ("Berry Smoothie", "Mixed berry smoothie", 140, "https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80"),
        ("Green Smoothie", "Healthy green smoothie", 130, "https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80"),
        ("Mango Smoothie", "Fresh mango smoothie", 140, "https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80"),
        ("Banana Smoothie", "Banana smoothie", 120, "https://images.unsplash.com/photo-1553530979-7ee52a2670c4?w=500&q=80"),
        ("Pineapple Smoothie", "Pineapple smoothie", 130, "https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500&q=80"),
    ],
}

dessert_items = {
    "Cakes": [
        ("Chocolate Cake", "Rich chocolate cake", 180, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Red Velvet Cake", "Classic red velvet", 200, "https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80"),
        ("Vanilla Cake", "Simple vanilla cake", 160, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Black Forest Cake", "Chocolate and cherry cake", 190, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Pineapple Cake", "Pineapple flavored cake", 170, "https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80"),
        ("Butterscotch Cake", "Butterscotch cake", 180, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
        ("Fruit Cake", "Mixed fruit cake", 190, "https://images.unsplash.com/photo-1586788680434-30d324c2d4f7?w=500&q=80"),
        ("Truffle Cake", "Chocolate truffle", 220, "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80"),
    ],
    "Pastries": [
        ("Chocolate Pastry", "Chocolate filled pastry", 80, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Black Forest Pastry", "Cherry chocolate pastry", 90, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Pineapple Pastry", "Pineapple pastry", 80, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Vanilla Pastry", "Cream vanilla pastry", 75, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
        ("Strawberry Pastry", "Strawberry pastry", 85, "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80"),
    ],
    "Ice Cream": [
        ("Vanilla Ice Cream", "Classic vanilla", 100, "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80"),
        ("Chocolate Ice Cream", "Rich chocolate", 110, "https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80"),
        ("Strawberry Ice Cream", "Fresh strawberry", 110, "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80"),
        ("Mango Ice Cream", "Mango flavor", 120, "https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80"),
        ("Butterscotch Ice Cream", "Butterscotch flavor", 110, "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80"),
        ("Kulfi", "Traditional Indian ice cream", 80, "https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80"),
    ],
    "Sweets": [
        ("Gulab Jamun", "Sweet milk dumplings", 80, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Rasgulla", "Spongy cheese balls", 70, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Jalebi", "Crispy sweet spirals", 70, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c?w=500&q=80"),
        ("Rasmalai", "Creamy cheese in milk", 90, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c:500&q=80"),
        ("Kaju Katli", "Cashew fudge", 120, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Barfi", "Milk fudge", 100, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Pedha", "Sweet milk solids", 80, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
        ("Ladoo", "Sweet balls", 70, "https://images.unsplash.com/photo-1666190094762-2b5c8a9f8b8c&w=500&q=80"),
    ],
}

def generate_sql():
    sql_statements = []
    sql_statements.append("-- Migration: Add comprehensive menu items for all restaurants")
    sql_statements.append("-- Date: 2026-10-30")
    sql_statements.append("-- Purpose: Ensure every restaurant has at least 100 unique food items")
    sql_statements.append("")
    
    food_id_counter = 1000  # Start from 1000 to avoid conflicts
    
    for restaurant in restaurants:
        restaurant_id = restaurant["id"]
        restaurant_name = restaurant["name"]
        cuisine = restaurant["cuisine"]
        is_pure_veg = restaurant["pure_veg"]
        
        sql_statements.append(f"-- Restaurant: {restaurant_name} (ID: {restaurant_id})")
        sql_statements.append(f"-- Cuisine: {cuisine}")
        sql_statements.append(f"-- Pure Veg: {is_pure_veg}")
        sql_statements.append("")
        
        # Select appropriate menu based on cuisine
        menu_items = []
        
        if "North Indian" in cuisine or "Maharashtrian" in cuisine:
            if is_pure_veg:
                for category, items in north_indian_veg.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                # Add beverages and desserts to reach 100
                for category, items in beverage_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                for category, items in dessert_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
            else:
                # Add both veg and non-veg
                for category, items in north_indian_veg.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                for category, items in north_indian_nonveg.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, False))
                # Add beverages and desserts
                for category, items in beverage_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                for category, items in dessert_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
        
        elif "Chinese" in cuisine:
            if is_pure_veg:
                for category, items in chinese_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                # Add beverages and desserts
                for category, items in beverage_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                for category, items in dessert_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
            else:
                for category, items in chinese_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                # Add some non-veg Chinese items
                menu_items.extend([
                    ("Chicken Manchurian", "Chicken in Indo-Chinese sauce", 260, "https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80", "Main Course", False),
                    ("Chilli Chicken", "Spicy chicken in sauce", 280, "https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80", "Main Course", False),
                    ("Chicken Fried Rice", "Fried rice with chicken", 240, "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80", "Rice", False),
                    ("Chicken Noodles", "Stir-fried noodles with chicken", 230, "https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80", "Noodles", False),
                    ("Chicken Momos", "Steamed chicken dumplings", 160, "https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80", "Starters", False),
                    ("Chicken Spring Roll", "Crispy chicken rolls", 180, "https://images.unsplash.com/photo-1562967916-eb82221df921?w=500&q=80", "Starters", False),
                    ("Chicken Wontons", "Fried chicken wontons", 190, "https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&q=80", "Starters", False),
                ])
                # Add beverages and desserts
                for category, items in beverage_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
                for category, items in dessert_items.items():
                    for name, desc, price, image in items:
                        menu_items.append((name, desc, price, image, category, True))
        
        elif "South Indian" in cuisine:
            for category, items in south_indian_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            # Add beverages and desserts
            for category, items in beverage_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            for category, items in dessert_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
        
        elif "Italian" in cuisine:
            for category, items in italian_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            # Add beverages and desserts
            for category, items in beverage_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            for category, items in dessert_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
        
        elif "Beverages" in cuisine:
            for category, items in beverage_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            # Add desserts and snacks
            for category, items in dessert_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            # Add some snacks
            menu_items.extend([
                ("Sandwich", "Club sandwich", 120, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80", "Snacks", True),
                ("Grilled Sandwich", "Grilled vegetable sandwich", 100, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80", "Snacks", True),
                ("Cheese Sandwich", "Cheese sandwich", 110, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80", "Snacks", True),
                ("Veg Burger", "Vegetable burger", 140, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks", True),
                ("Cheese Burger", "Cheese burger", 160, "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80", "Snacks", True),
                ("French Fries", "Crispy french fries", 90, "https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80", "Snacks", True),
                ("Onion Rings", "Crispy onion rings", 100, "https://images.unsplash.com/photo-1639024471283-03518883512d?w=500&q=80", "Snacks", True),
            ])
        
        elif "Desserts" in cuisine:
            for category, items in dessert_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            # Add beverages
            for category, items in beverage_items.items():
                for name, desc, price, image in items:
                    menu_items.append((name, desc, price, image, category, True))
            # Add some snacks
            menu_items.extend([
                ("Sandwich", "Club sandwich", 120, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80", "Snacks", True),
                ("Grilled Sandwich", "Grilled vegetable sandwich", 100, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80", "Snacks", True),
                ("Cheese Sandwich", "Cheese sandwich", 110, "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80", "Snacks", True),
            ])
        
        # Ensure minimum 100 items by duplicating with variations if needed
        while len(menu_items) < 100:
            # Add variations of existing items
            for name, desc, price, image, category, is_veg in list(menu_items)[:20]:
                if len(menu_items) >= 100:
                    break
                # Create variation
                new_name = f"Special {name}"
                new_price = price + 20
                menu_items.append((new_name, f"Special {desc}", new_price, image, category, is_veg))
        
        # Generate INSERT statements
        for name, desc, price, image, category, is_veg in menu_items:
            food_id_counter += 1
            sql = f"""INSERT INTO food_items (food_id, restaurant_id, name, description, price, image_url, category, is_vegetarian, is_available, is_trending, preparation_time, portion_size)
VALUES ({food_id_counter}, {restaurant_id}, '{name}', '{desc}', {price:.2f}, '{image}', '{category}', {str(is_veg).lower()}, true, false, 15, 'Regular');"""
            sql_statements.append(sql)
        
        sql_statements.append(f"-- Total items for {restaurant_name}: {len(menu_items)}")
        sql_statements.append("")
        sql_statements.append("")
    
    return "\n".join(sql_statements)

if __name__ == "__main__":
    sql = generate_sql()
    with open("migration-expand-menus-to-100.sql", "w") as f:
        f.write(sql)
    print("SQL migration file generated: migration-expand-menus-to-100.sql")
