"""Models for Blogly."""
# Importing SQLA
from flask_sqlalchemy import SQLAlchemy

# Mapping SQLA to a variable
db = SQLAlchemy()

# In additiona mapping the 2 item below into a function
def connect_db(app):
    # Mapping SQLA to our Flask app
    db.app = app
    # Initializing the DB connection to our Flask App
    db.init_app(app)

# MODELS GO BELOW! (Patterns / Schema)
class User(db.Model):
    """User class."""
    # Dunder for creating a table
    __tablename__ = 'users'
    
    # Defining the columns
    # id, an autoincrementing integer number that is the primary key
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    
    first_name = db.Column(db.String(50),nullable=False,unique=False)
    last_name = db.Column(db.String(50),nullable=False,unique=False)

    # Set the default to a random profile icon if no avatar is present
    image_url = db.Column(db.String(999),nullable=True, default="https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png")
