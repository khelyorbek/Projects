"""Blogly application."""

from crypt import methods
from flask import Flask, render_template, redirect, request
from flask_debugtoolbar import DebugToolbarExtension
from models import db, connect_db, User

# Mapping flask to app variable
app = Flask(__name__)
# secret key for sessions
app.config['SECRET_KEY'] = "MyFirstFlaskSurveyApp1234567890"
# stopping flask debugger from intercepting redirects
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
# Instantiating the Debug Toolbar
debug = DebugToolbarExtension(app)

# Initiating the connection to the DB
connect_db(app)
# Creating the data model
db.create_all()

# GET /
@app.route('/')
def home():
    # Redirect to list of users. (We’ll fix this in a later step).
    return redirect('/users')

# GET /users
@app.route('/users')
def users():
    u = User.query.all()
    return render_template('users.html', users=u)

# GET /users/[user-id]
@app.route('/users/<int:user_id>')
def show_user(user_id):
    u = User.query.get(user_id)
    return render_template('view_user.html', user = u)

# GET /users/new
@app.route('/users/new')
def add_user():
        return render_template('add_user.html')

# POST /users/new
@app.route('/users/new', methods=["POST"])
def new_user():
    f_name = request.form['first_name']
    l_name = request.form['last_name']
    i_url = request.form['image_url']
    new_user = User(first_name=f_name, last_name=l_name, image_url=i_url)

    db.session.add(new_user)
    db.session.commit()
    return redirect('/users')

# GET /users/[user-id]/edit
@app.route('/users/<int:user_id>/edit')
def edit_user(user_id):
    u = User.query.get(user_id)
    return render_template('edit_user.html', user = u)

# POST /users/[user-id]/edit
@app.route('/users/<int:user_id>/edit', methods=["POST"])
def submit_edit_user(user_id):
    f_name = request.form['first_name']
    l_name = request.form['last_name']
    i_url = request.form['image_url']
    
    u = User.query.get(user_id)

    u.first_name = f_name
    u.last_name = l_name
    u.image_url = i_url

    db.session.add(u)
    db.session.commit()
    return redirect('/users')

# POST /users/[user-id]/delete
@app.route('/users/<int:user_id>/delete', methods=["POST"])
def delete_user(user_id):
    User.query.filter_by(id=user_id).delete()
    db.session.commit()
    return redirect('/users')
