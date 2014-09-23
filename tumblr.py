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

client.create_photo('YOURTUMBLRURL', state="published", data="/path/to/repo/photos/"+sys.argv[1]+".jpg", caption=sys.argv[1])