from dotenv import load_dotenv
import os
import discord
import asyncio
import json

# Env variables
load_dotenv()
DISCORD_BOT_TOKEN = os.getenv('DISCORD_BOT_TOKEN')
DISCORD_CHANNEL_ID = os.getenv('DISCORD_CHANNEL_ID')

# Get minecraft server ip
url = ""
with open('terraform.tfstate') as json_file:
    data = json.load(json_file)
    ip = data['resources'][1]['instances'][0]['attributes']['ipv4_address']
    port = "25565"
    url = ip + ":" + port

# Discord bot
client = discord.Client()

@client.event
async def on_ready():
    channel = client.get_channel(int(DISCORD_CHANNEL_ID))
    await channel.send("Nouveau serveur Minecraft sur :")
    await channel.send(url)
    os._exit(0)

client.run(DISCORD_BOT_TOKEN)
