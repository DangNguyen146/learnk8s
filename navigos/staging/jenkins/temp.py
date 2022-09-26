import requests
from requests.auth import HTTPBasicAuth

auth=('tuonghv', '11c3a2cab5285ed4f4ce41de41ad290b1e')
jenkin_root="https://jenkins-cron.vietnamworks.com"
url = jenkin_root+ '/api/json?tree=jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable]]]]]&pretty'


response = requests.post(url,auth = HTTPBasicAuth(auth[0], auth[1]))
print(response)