"""Models for Cupcake app."""
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt

db = SQLAlchemy()
bcrypt = Bcrypt()


def connect_db(app):
    db.app = app
    db.init_app(app)

class User(db.Model):
    """Data model for User"""
    __tablename__ = 'users'
    id = db.Column(db.Integer, autoincrement=True)
    
    # username - a unique primary key that is no longer than 20 characters.
    username = db.Column(db.String(20), primary_key=True, unique=True, nullable=False)

    # password - a not-nullable column that is text
    password = db.Column(db.Text, nullable=False)

    # email - a not-nullable column that is unique and no longer than 50 characters.
    email = db.Column(db.String(50), nullable=False, unique=True)

    # first_name - a not-nullable column that is no longer than 30 characters.
    first_name = db.Column(db.String(30), nullable=False)

    # last_name - a not-nullable column that is no longer than 30 characters.
    last_name = db.Column(db.String(30), nullable=False)

    @classmethod
    def register(cls, username, pwd, email, fname, lname):
        """Register user w/hashed password and return user"""
        hashed = bcrypt.generate_password_hash(pwd)
        # turn bytestring into normal (unicode utf8) string
        hashed_utf8 = hashed.decode("utf8")
        # return instance of user w/username and hashed pwd
        return cls(username=username, password=hashed_utf8, email=email, first_name=fname, last_name=lname)

    @classmethod
    def authenticate(cls, username, pwd):
        """Validate that user exists & password is correct.
        Return user if valid; else return False.
        """
        u = User.query.filter_by(username=username).first()
        if u and bcrypt.check_password_hash(u.password, pwd):
            # return user instance
            return u
        else:
            return False

class Feedback(db.Model):
    """Data model for Feedback of users"""
    __tablename__ = 'feedbacks'

    # id - a unique primary key that is an auto incrementing integer
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    # title - a not-nullable column that is at most 100 characters
    title = db.Column(db.String(100), nullable=False)

    # content - a not-nullable column that is text
    content = db.Column(db.Text, nullable=False)

    # username - a foreign key that references the username column in the users table
    username = db.Column(db.String(20), db.ForeignKey('users.username'))
    user = db.relationship('User', backref='feedbacks')
