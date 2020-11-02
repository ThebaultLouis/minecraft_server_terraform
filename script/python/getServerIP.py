import json

with open('terraform.tfstate') as json_file:
    data = json.load(json_file)
    print(data['resources'][1]['instances'][0]['attributes']['ipv4_address'])
    
