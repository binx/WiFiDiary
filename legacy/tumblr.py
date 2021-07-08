import pytumblr
import sys

CONSUMER_KEY = ''
CONSUMER_SECRET = ''
OATH_KEY = ''
OATH_SECRET = ''

client = pytumblr.TumblrRestClient(
    CONSUMER_KEY,
    CONSUMER_SECRET,
    OATH_KEY,
    OATH_SECRET
)

client.create_photo('TUMBLRURL', state="published", data="/path/to/repo/photos/"+sys.argv[1]+sys.argv[2]+".jpg", caption=sys.argv[2])