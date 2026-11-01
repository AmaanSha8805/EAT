#!/usr/bin/env python3
"""
EAT Food Image Mapping System
Creates dish-specific image mappings for all food items
"""

import psycopg2
import json
import re
from collections import defaultdict

# Database configuration
DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'eat_db',
    'user': 'postgres',
    'password': 'panda'
}

# Comprehensive dish-to-image mapping
# Each dish type maps to multiple high-quality Unsplash images
DISH_IMAGE_MAPPING = {
    # North Indian Main Course
    'butter_chicken': [
        'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80',
        'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&q=80',
        'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=500&q=80'
    ],
    'paneer_tikka_masala': [
        'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80',
        'https://images.unsplash.com/photo-1608226666698-73633c661cfa?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],
    'paneer_butter_masala': [
        'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80',
        'https://images.unsplash.com/photo-1608226666698-73633c661cfa?w=500&q=80',
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80'
    ],
    'dal_makhani': [
        'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=500&q=80',
        'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80',
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80'
    ],
    'kadai_paneer': [
        'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80',
        'https://images.unsplash.com/photo-1608226666698-73633c661cfa?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],
    'palak_paneer': [
        'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80',
        'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80',
        'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&q=80'
    ],
    'shahi_paneer': [
        'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80',
        'https://images.unsplash.com/photo-1608226666698-73633c661cfa?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],
    'mix_veg': [
        'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&q=80',
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80'
    ],
    'malai_kofta': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80',
        'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&q=80'
    ],
    'matar_paneer': [
        'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=500&q=80',
        'https://images.unsplash.com/photo-1608226666698-73633c661cfa?w=500&q=80',
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80'
    ],

    # Biryani
    'chicken_biryani': [
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80',
        'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
        'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80'
    ],
    'veg_biryani': [
        'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80',
        'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80'
    ],
    'mutton_biryani': [
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80',
        'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
        'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80'
    ],

    # Roti/Naan/Bread
    'naan': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80'
    ],
    'butter_naan': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80'
    ],
    'garlic_naan': [
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80'
    ],
    'tandoori_roti': [
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80'
    ],
    'paratha': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80'
    ],
    'aloo_paratha': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80'
    ],
    'paneer_paratha': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80'
    ],
    'kulcha': [
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1563379091339-03b21e4c00c4?w=500&q=80'
    ],

    # South Indian
    'masala_dosa': [
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80'
    ],
    'rava_dosa': [
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80'
    ],
    'idli': [
        'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80'
    ],
    'idli_sambar': [
        'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80'
    ],
    'uttapam': [
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80'
    ],
    'vada': [
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80',
        'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80'
    ],

    # Chinese
    'chicken_manchurian': [
        'https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80'
    ],
    'veg_manchurian': [
        'https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80'
    ],
    'gobi_manchurian': [
        'https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80'
    ],
    'veg_fried_rice': [
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80',
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80',
        'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80'
    ],
    'chicken_fried_rice': [
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&q=80',
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80',
        'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=500&q=80'
    ],
    'hakka_noodles': [
        'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80',
        'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&q=80',
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80'
    ],
    'spring_roll': [
        'https://images.unsplash.com/photo-1606525436872-0996a0590969?w=500&q=80',
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],
    'chilli_chicken': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=500&q=80',
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80'
    ],

    # Pizza
    'margherita_pizza': [
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80',
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80',
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80'
    ],
    'pepperoni_pizza': [
        'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500&q=80',
        'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500&q=80',
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80'
    ],
    'cheese_pizza': [
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&q=80',
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80',
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80'
    ],
    'veggie_pizza': [
        'https://images.unsplash.com/photo-1511689660979-10d2b1aada49?w=500&q=80',
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80',
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80'
    ],
    'pizza': [
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80',
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&q=80',
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&q=80'
    ],

    # Burger
    'burger': [
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=500&q=80'
    ],
    'chicken_burger': [
        'https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500&q=80',
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=500&q=80'
    ],
    'veg_burger': [
        'https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500&q=80',
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=500&q=80'
    ],
    'cheese_burger': [
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=500&q=80',
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80'
    ],

    # Coffee
    'cappuccino': [
        'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80',
        'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80',
        'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=500&q=80'
    ],
    'latte': [
        'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=500&q=80',
        'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80',
        'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=500&q=80'
    ],
    'cold_coffee': [
        'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80',
        'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=500&q=80',
        'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500&q=80'
    ],
    'espresso': [
        'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80',
        'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=500&q=80',
        'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=500&q=80'
    ],
    'filter_coffee': [
        'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=500&q=80',
        'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=500&q=80',
        'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=500&q=80'
    ],

    # Tea
    'masala_chai': [
        'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80',
        'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80',
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80'
    ],
    'green_tea': [
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80',
        'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80',
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80'
    ],
    'lemon_tea': [
        'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80',
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80',
        'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=500&q=80'
    ],
    'iced_tea': [
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80',
        'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80',
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80'
    ],

    # Cakes
    'chocolate_cake': [
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80'
    ],
    'vanilla_cake': [
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],
    'red_velvet_cake': [
        'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80'
    ],
    'black_forest_cake': [
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=500&q=80',
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80'
    ],
    'butterscotch_cake': [
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=500&q=80',
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80'
    ],
    'pineapple_cake': [
        'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=500&q=80'
    ],
    'fruit_cake': [
        'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=500&q=80'
    ],
    'truffle_cake': [
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],

    # Pastries
    'chocolate_pastry': [
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],
    'black_forest_pastry': [
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],
    'vanilla_pastry': [
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],
    'pineapple_pastry': [
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],
    'strawberry_pastry': [
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],

    # Ice Cream
    'chocolate_ice_cream': [
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80',
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&q=80',
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80'
    ],
    'vanilla_ice_cream': [
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80',
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&q=80',
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80'
    ],
    'strawberry_ice_cream': [
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80',
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&q=80',
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80'
    ],
    'butterscotch_ice_cream': [
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80',
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&q=80',
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80'
    ],
    'ice_cream_sundae': [
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&q=80',
        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&q=80',
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&q=80'
    ],

    # Indian Sweets
    'gulab_jamun': [
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80',
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80',
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80'
    ],
    'rasgulla': [
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80',
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80',
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80'
    ],
    'kheer': [
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80'
    ],
    'jalebi': [
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80',
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80',
        'https://images.unsplash.com/photo-1666190054763-aca5363780e7?w=500&q=80'
    ],

    # Maharashtrian
    'misal_pav': [
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80'
    ],
    'pav_bhaji': [
        'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80'
    ],
    'vada_pav': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],
    'pithla_bhakri': [
        'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=500&q=80'
    ],

    # Snacks/Street Food
    'samosa': [
        'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80'
    ],
    'aloo_tikki': [
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
        'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],
    'bhel_puri': [
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80',
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80'
    ],
    'sev_puri': [
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80'
    ],
    'dahi_misal': [
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80'
    ],
    'sabudana_khichdi': [
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80',
        'https://images.unsplash.com/photo-1626132647523-66d29aa5c7e7?w=500&q=80'
    ],

    # Sandwich
    'sandwich': [
        'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80',
        'https://images.unsplash.com/photo-1481070555726-e2e8ed353856?w=500&q=80',
        'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80'
    ],
    'grilled_sandwich': [
        'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80',
        'https://images.unsplash.com/photo-1481070555726-e2e8ed353856?w=500&q=80',
        'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80'
    ],
    'veg_sandwich': [
        'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80',
        'https://images.unsplash.com/photo-1481070555726-e2e8ed353856?w=500&q=80',
        'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500&q=80'
    ],

    # French Fries
    'french_fries': [
        'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80',
        'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80'
    ],
    'fries': [
        'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80',
        'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80'
    ],

    # Onion Rings
    'onion_rings': [
        'https://images.unsplash.com/photo-1639024471283-03518883512d?w=500&q=80',
        'https://images.unsplash.com/photo-1639024471283-03518883512d?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],

    # Salad
    'caesar_salad': [
        'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&q=80',
        'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&q=80',
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80'
    ],
    'greek_salad': [
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500&q=80',
        'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&q=80',
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80'
    ],
    'salad': [
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80',
        'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&q=80',
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500&q=80'
    ],

    # Soup
    'mushroom_soup': [
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80'
    ],
    'tomato_soup': [
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80'
    ],
    'soup': [
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500&q=80',
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?w=500&q=80'
    ],

    # Beverages/Shakes
    'mango_smoothie': [
        'https://images.unsplash.com/photo-993483514752-2c9dc0f97e51?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-993483514752-2c9dc0f97e51?w=500&q=80'
    ],
    'chocolate_shake': [
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80'
    ],
    'oreo_shake': [
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80'
    ],
    'strawberry_shake': [
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80'
    ],
    'fresh_juice': [
        'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500&q=80',
        'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80'
    ],
    'lassi': [
        'https://images.unsplash.com/photo-1587015566805-245e8285665e?w=500&q=80',
        'https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?w=500&q=80',
        'https://images.unsplash.com/photo-1587015566805-245e8285665e?w=500&q=80'
    ],
    'fresh_lime_soda': [
        'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80',
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80',
        'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&q=80'
    ],

    # Bakery
    'croissant': [
        'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=500&q=80',
        'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=500&q=80',
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&q=80'
    ],
    'chocolate_croissant': [
        'https://images.unsplash.com/photo-1608198093002-ad4e005484ec?w=500&q=80',
        'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=500&q=80',
        'https://images.unsplash.com/photo-1608198093002-ad4e005484ec?w=500&q=80'
    ],
    'muffin': [
        'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=500&q=80',
        'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=500&q=80',
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&q=80'
    ],
    'bagel': [
        'https://images.unsplash.com/photo-1585449078915-0279c1cc5e59?w=500&q=80',
        'https://images.unsplash.com/photo-1585449078915-0279c1cc5e59?w=500&q=80',
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&q=80'
    ],
    'bread': [
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&q=80',
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&q=80',
        'https://images.unsplash.com/photo-1585449078915-0279c1cc5e59?w=500&q=80'
    ],

    # Continental
    'grilled_chicken': [
        'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=500&q=80',
        'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=500&q=80',
        'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80'
    ],
    'fish_and_chips': [
        'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80',
        'https://images.unsplash.com/photo-1586190848861-99c8a3da7c47?w=500&q=80',
        'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&q=80'
    ],
    'vegetable_lasagna': [
        'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=500&q=80',
        'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=500&q=80',
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80'
    ],
    'chocolate_mousse': [
        'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80',
        'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],

    # Rice dishes
    'jeera_rice': [
        'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80',
        'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80',
        'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80'
    ],
    'steamed_rice': [
        'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80',
        'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80',
        'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80'
    ],
    'rice': [
        'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80',
        'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
        'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=500&q=80'
    ],

    # Momos
    'veg_momos': [
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80',
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],
    'momos': [
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80',
        'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],

    # Soft Drinks
    'coke': [
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&q=80',
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&q=80',
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80'
    ],
    'pepsi': [
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&q=80',
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&q=80',
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&q=80'
    ],

    # Garlic Bread
    'garlic_bread': [
        'https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=500&q=80',
        'https://images.unsplash.com/photo-1619535860434-ba1d8fa12536?w=500&q=80',
        'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80'
    ],

    # Pasta
    'pasta_alfredo': [
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80',
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80',
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=500&q=80'
    ],
    'chicken_pasta': [
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=500&q=80',
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=500&q=80',
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80'
    ],
    'pasta': [
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80',
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=500&q=80',
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&q=80'
    ],

    # Brownie
    'brownie': [
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80',
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],

    # Cheesecake
    'cheesecake': [
        'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=500&q=80',
        'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=500&q=80',
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80'
    ],

    # Generic fallback for unmatched items
    'generic': [
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80',
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80',
        'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&q=80'
    ]
}

def normalize_dish_name(name):
    """Normalize dish name for matching"""
    name = name.lower().strip()
    # Remove common variations
    name = re.sub(r'\s+', ' ', name)  # Multiple spaces to single
    name = re.sub(r'[^\w\s]', '', name)  # Remove special chars
    return name

def match_dish_to_image(food_item):
    """Match a food item to the appropriate image"""
    name = normalize_dish_name(food_item['name'])

    # Try exact matches first
    if name in DISH_IMAGE_MAPPING:
        images = DISH_IMAGE_MAPPING[name]
        return images[hash(name) % len(images)]

    # Try pattern matching
    patterns = [
        (r'butter\s*chicken', 'butter_chicken'),
        (r'paneer\s*tikka\s*masala', 'paneer_tikka_masala'),
        (r'paneer\s*butter\s*masala', 'paneer_butter_masala'),
        (r'dal\s*makhani', 'dal_makhani'),
        (r'kadai\s*paneer', 'kadai_paneer'),
        (r'palak\s*paneer', 'palak_paneer'),
        (r'shahi\s*paneer', 'shahi_paneer'),
        (r'mix\s*veg', 'mix_veg'),
        (r'malai\s*kofta', 'malai_kofta'),
        (r'matar\s*paneer', 'matar_paneer'),
        (r'chicken\s*biryani', 'chicken_biryani'),
        (r'veg\s*biryani', 'veg_biryani'),
        (r'mutton\s*biryani', 'mutton_biryani'),
        (r'butter\s*naan', 'butter_naan'),
        (r'garlic\s*naan', 'garlic_naan'),
        (r'tandoori\s*roti', 'tandoori_roti'),
        (r'aloo\s*paratha', 'aloo_paratha'),
        (r'paneer\s*paratha', 'paneer_paratha'),
        (r'masala\s*dosa', 'masala_dosa'),
        (r'rava\s*dosa', 'rava_dosa'),
        (r'idli\s*sambar', 'idli_sambar'),
        (r'idli', 'idli'),
        (r'chicken\s*manchurian', 'chicken_manchurian'),
        (r'veg\s*manchurian', 'veg_manchurian'),
        (r'gobi\s*manchurian', 'gobi_manchurian'),
        (r'veg\s*fried\s*rice', 'veg_fried_rice'),
        (r'chicken\s*fried\s*rice', 'chicken_fried_rice'),
        (r'hakka\s*noodles', 'hakka_noodles'),
        (r'spring\s*roll', 'spring_roll'),
        (r'chilli\s*chicken', 'chilli_chicken'),
        (r'margherita\s*pizza', 'margherita_pizza'),
        (r'pepperoni\s*pizza', 'pepperoni_pizza'),
        (r'cheese\s*pizza', 'cheese_pizza'),
        (r'veggie\s*pizza', 'veggie_pizza'),
        (r'pizza', 'pizza'),
        (r'chicken\s*burger', 'chicken_burger'),
        (r'veg\s*burger', 'veg_burger'),
        (r'cheese\s*burger', 'cheese_burger'),
        (r'burger', 'burger'),
        (r'cappuccino', 'cappuccino'),
        (r'cold\s*coffee', 'cold_coffee'),
        (r'espresso', 'espresso'),
        (r'filter\s*coffee', 'filter_coffee'),
        (r'masala\s*chai', 'masala_chai'),
        (r'green\s*tea', 'green_tea'),
        (r'lemon\s*tea', 'lemon_tea'),
        (r'iced\s*tea', 'iced_tea'),
        (r'chocolate\s*cake', 'chocolate_cake'),
        (r'vanilla\s*cake', 'vanilla_cake'),
        (r'red\s*velvet\s*cake', 'red_velvet_cake'),
        (r'black\s*forest\s*cake', 'black_forest_cake'),
        (r'butterscotch\s*cake', 'butterscotch_cake'),
        (r'pineapple\s*cake', 'pineapple_cake'),
        (r'fruit\s*cake', 'fruit_cake'),
        (r'truffle\s*cake', 'truffle_cake'),
        (r'chocolate\s*pastry', 'chocolate_pastry'),
        (r'black\s*forest\s*pastry', 'black_forest_pastry'),
        (r'vanilla\s*pastry', 'vanilla_pastry'),
        (r'pineapple\s*pastry', 'pineapple_pastry'),
        (r'strawberry\s*pastry', 'strawberry_pastry'),
        (r'chocolate\s*ice\s*cream', 'chocolate_ice_cream'),
        (r'vanilla\s*ice\s*cream', 'vanilla_ice_cream'),
        (r'strawberry\s*ice\s*cream', 'strawberry_ice_cream'),
        (r'butterscotch\s*ice\s*cream', 'butterscotch_ice_cream'),
        (r'ice\s*cream\s*sundae', 'ice_cream_sundae'),
        (r'gulab\s*jamun', 'gulab_jamun'),
        (r'rasgulla', 'rasgulla'),
        (r'kheer', 'kheer'),
        (r'jalebi', 'jalebi'),
        (r'misal\s*pav', 'misal_pav'),
        (r'pav\bhaji', 'pav_bhaji'),
        (r'vada\s*pav', 'vada_pav'),
        (r'pithla\s*bhakri', 'pithla_bhakri'),
        (r'samosa', 'samosa'),
        (r'aloo\s*tikki', 'aloo_tikki'),
        (r'bhel\s*puri', 'bhel_puri'),
        (r'sev\s*puri', 'sev_puri'),
        (r'dahi\s*misal', 'dahi_misal'),
        (r'sabudana\s*khichdi', 'sabudana_khichdi'),
        (r'grilled\s*sandwich', 'grilled_sandwich'),
        (r'veg\s*sandwich', 'veg_sandwich'),
        (r'sandwich', 'sandwich'),
        (r'french\s*fries', 'french_fries'),
        (r'onion\s*rings', 'onion_rings'),
        (r'caesar\s*salad', 'caesar_salad'),
        (r'greek\s*salad', 'greek_salad'),
        (r'salad', 'salad'),
        (r'mushroom\s*soup', 'mushroom_soup'),
        (r'tomato\s*soup', 'tomato_soup'),
        (r'soup', 'soup'),
        (r'mango\s*smoothie', 'mango_smoothie'),
        (r'chocolate\s*shake', 'chocolate_shake'),
        (r'oreo\s*shake', 'oreo_shake'),
        (r'strawberry\s*shake', 'strawberry_shake'),
        (r'fresh\s*juice', 'fresh_juice'),
        (r'lassi', 'lassi'),
        (r'fresh\s*lime\s*soda', 'fresh_lime_soda'),
        (r'chocolate\s*croissant', 'chocolate_croissant'),
        (r'croissant', 'croissant'),
        (r'muffin', 'muffin'),
        (r'bagel', 'bagel'),
        (r'bread', 'bread'),
        (r'grilled\s*chicken', 'grilled_chicken'),
        (r'fish\s*and\s*chips', 'fish_and_chips'),
        (r'vegetable\s*lasagna', 'vegetable_lasagna'),
        (r'chocolate\s*mousse', 'chocolate_mousse'),
        (r'jeera\s*rice', 'jeera_rice'),
        (r'steamed\s*rice', 'steamed_rice'),
        (r'rice', 'rice'),
        (r'veg\s*momos', 'veg_momos'),
        (r'momos', 'momos'),
        (r'coke', 'coke'),
        (r'pepsi', 'pepsi'),
        (r'garlic\s*bread', 'garlic_bread'),
        (r'pasta\s*alfredo', 'pasta_alfredo'),
        (r'chicken\s*pasta', 'chicken_pasta'),
        (r'pasta', 'pasta'),
        (r'brownie', 'brownie'),
        (r'cheesecake', 'cheesecake'),
    ]

    for pattern, dish_key in patterns:
        if re.search(pattern, name):
            images = DISH_IMAGE_MAPPING[dish_key]
            return images[hash(name) % len(images)]

    # Fallback to generic
    images = DISH_IMAGE_MAPPING['generic']
    return images[hash(name) % len(images)]

def connect_to_db():
    """Connect to PostgreSQL database"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        sys.exit(1)

def get_all_food_items(conn):
    """Retrieve all food items"""
    query = """
    SELECT food_id, restaurant_id, name, description, category, image_url, is_vegetarian
    FROM food_items
    ORDER BY restaurant_id, category, name
    """
    cursor = conn.cursor()
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]
    rows = cursor.fetchall()
    items = [dict(zip(columns, row)) for row in rows]
    cursor.close()
    return items

def generate_image_updates(food_items):
    """Generate image update statements for all food items"""
    updates = []
    unmatched = []

    for item in food_items:
        new_image = match_dish_to_image(item)
        if new_image != item['image_url']:
            updates.append({
                'food_id': item['food_id'],
                'name': item['name'],
                'old_image': item['image_url'],
                'new_image': new_image
            })

    return updates

def main():
    print("EAT Food Image Mapping System")
    print("=" * 50)

    # Connect to database
    conn = connect_to_db()
    print("Connected to database successfully")

    # Get all food items
    food_items = get_all_food_items(conn)
    print(f"Retrieved {len(food_items)} food items")

    # Generate updates
    updates = generate_image_updates(food_items)
    print(f"Generated {len(updates)} image updates")

    # Save updates to SQL file
    with open('database/image-correction-updates.sql', 'w') as f:
        f.write("-- EAT Food Image Correction Updates\n")
        f.write(f"-- Generated: {len(updates)} updates\n")
        f.write("-- This script updates food item images to match their actual dish names\n\n")

        for update in updates:
            f.write(f"UPDATE food_items SET image_url = '{update['new_image']}' WHERE food_id = {update['food_id']}; -- {update['name']}\n")

    print("\nSQL updates saved to database/image-correction-updates.sql")

    # Save mapping report
    report = {
        'total_items': len(food_items),
        'updates_generated': len(updates),
        'updates_percentage': round((len(updates) / len(food_items)) * 100, 2),
        'sample_updates': updates[:20]
    }

    with open('image_mapping_report.json', 'w') as f:
        json.dump(report, f, indent=2)

    print("Mapping report saved to image_mapping_report.json")

    # Print summary
    print("\n=== SUMMARY ===")
    print(f"Total food items: {report['total_items']}")
    print(f"Updates needed: {report['updates_generated']}")
    print(f"Percentage: {report['updates_percentage']}%")

    conn.close()
    print("\nMapping complete!")

if __name__ == '__main__':
    main()
