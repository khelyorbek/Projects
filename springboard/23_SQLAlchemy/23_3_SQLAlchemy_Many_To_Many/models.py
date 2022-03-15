"""SQLAlchemy models for blogly."""

from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

DEFAULT_IMAGE_URL = "https://www.freeiconspng.com/uploads/icon-user-blue-symbol-people-person-generic--public-domain--21.png"


class User(db.Model):
    """Site user."""

    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    image_url = db.Column(db.Text, nullable=False, default=DEFAULT_IMAGE_URL)

    @property
    def full_name(self):
        """Return full name of user."""

        return f"{self.first_name} {self.last_name}"

    posts = db.relationship('Post', backref='user')

class Post(db.Model):
    """User post."""

    __tablename__ = "posts"

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.Text, nullable=False)
    content = db.Column(db.Text, nullable=False)
    # created_at a date+time that should automatically default to the when the post is created
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.datetime.now)
    # a foreign key to the User table
    author_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable = False)

class Tag(db.Model):
     """Post tags"""  

     __tablename__ = "tags"

     id = db.Column(db.Integer, primary_key=True)
     name = db.Column(db.Text, unique=True, nullable=False)

     # Add relationships so you can see the .tags for a post, and the .posts for a tag.
     posts = db.relationship('Post', secondary='posttags', backref='tags')

class PostTag(db.Model):
    """Post to Tag relationship table"""

    __tablename__ = "posttags"

    post_id = db.Column(db.Integer, db.ForeignKey("posts.id"),primary_key=True)
    tag_id = db.Column(db.Integer, db.ForeignKey("tags.id"),primary_key=True)
    

def connect_db(app):
    """Connect this database to provided Flask app.

    You should call this in your Flask app.
    """

    db.app = app
    db.init_app(app)
