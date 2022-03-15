from unittest import TestCase
from app import app
from models import db, User, Post

# Copying current PROD DB and making a TST one
# khely=# CREATE DATABASE blogly_test
# WITH TEMPLATE blogly;
# CREATE DATABASE

# Use test database and don't clutter tests with SQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly_test'
app.config['SQLALCHEMY_ECHO'] = False

# Dropping tables
db.drop_all()
# Re-creating them based on data model
db.create_all()

class BloglyModelTestCase(TestCase):
    """ Test for models for User."""

    def setUp(self):
        """ Clean up before testing """
        User.query.delete()

    def tearDown(self):
        """ Clean up after testing """
        db.session.rollback()

    def test_new_user(self):
        u = User(first_name="Test",last_name="Testing")
        self.assertEqual(u.first_name,"Test")
        self.assertEqual(u.last_name,"Testing")
        
    def test_new_post(self):
        p = Post(title="Test Title", content="Test content")
        self.assertEqual(p.title,"Test Title")
        self.assertEqual(p.content,"Test content")