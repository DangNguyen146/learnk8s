import requests
import json

url = "https://api-staging.vietnamworks.com/api/rest/v3/jobs/786603?isShowExpired=1"

response = requests.request("GET", url)
data = response.json()

print(data["data"]["skills"][0]["skillName"])