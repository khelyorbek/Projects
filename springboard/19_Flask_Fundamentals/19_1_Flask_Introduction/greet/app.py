# Greet
# In the greet folder, Make a simple Flask app that responds to these routes with simple text messages:
from flask import Flask
app = Flask(__name__)

# /welcome
# Returns “welcome”
@app.route('/welcome')
def welcome():
    return 'welcome'

# /welcome/home
# Returns “welcome home”
@app.route('/welcome/home')
def welcome_home():
    return 'welcome home'

# /welcome/back
# Return “welcome back”
@app.route('/welcome/back')
def welcome_back():
    return 'welcome back'


# UNIT TESTS PASSED
# ...
# ----------------------------------------------------------------------
# Ran 3 tests in 0.006s

# OK