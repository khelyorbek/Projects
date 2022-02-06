# importing math methods from operations file
from operations import add, sub, mult, div
# importing flask and request (to get args)
from flask import Flask, request
# mapping flask to a app variable
app = Flask(__name__)

@app.route('/add')
def app_add():
    a = int(request.args.get('a'))
    b = int(request.args.get('b'))
    r = add(a,b)
    return str(r)

@app.route('/sub')
def app_sub():
    a = int(request.args.get('a'))
    b = int(request.args.get('b'))
    r = sub(a,b)
    return str(r)
    
@app.route('/mult')
def app_mult():
    a = int(request.args.get('a'))
    b = int(request.args.get('b'))
    r = mult(a,b)
    return str(r)

@app.route('/div')
def app_div():
    a = int(request.args.get('a'))
    b = int(request.args.get('b'))
    r = div(a,b)
    return str(r)

# MY OWN TESTS
# I: http://localhost:5000/add?a=10&b=20
# O: 30

# I: http://localhost:5000/sub?a=30&b=20
# O: 10

# I: http://localhost:5000/mult?a=30&b=20
# O: 600

# I: http://localhost:5000/div?a=45&b=15
# O: 3.0

# Unit Tests
#----------------------------------------------------------------------
# Ran 0 tests in 0.000s

# OK

# Further Study
# You probably have a lot of code duplication in your calc routes, given that you’re doing such similar things in each.

# Make a single route/view function that can deal with 4 different kinds of URLs:

# /math/add
# /math/sub
# /math/mult
# /math/div

# Issue the value op passed was a string and was not able to convert to a method itself
# Found solution here: https://stackoverflow.com/questions/7719466/i-have-a-string-whose-content-is-a-function-name-how-to-refer-to-the-correspond
@app.route('/math/<op>')
def app_math(op):
    a = int(request.args.get('a'))
    b = int(request.args.get('b'))
    # Mapping each string value to a method
    ops = {'add':add,'sub':sub,'mult':mult,'div':div}
    r = str(ops[op](a,b))
    return r

    