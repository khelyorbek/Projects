from unittest import TestCase
from app import app
from models import db, User

# Copying current PROD DB and making a TST one
# khely=# CREATE DATABASE blogly_test
# WITH TEMPLATE blogly;
# CREATE DATABASE

# Use test database and don't clutter tests with SQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly_test'
app.config['SQLALCHEMY_ECHO'] = False
app.config['TESTING'] = True
# This is a bit of hack, but don't use Flask DebugToolbar
app.config['DEBUG_TB_HOSTS'] = ['dont-show-debug-toolbar']

# Dropping tables
db.drop_all()
# Re-creating them based on data model
db.create_all()

class BloglyTestCase(TestCase):
    """ Test for models for User."""

    def setUp(self):
        """ Clean up before testing """
        User.query.delete()

        u = User(first_name="Test",last_name="Testing", image_url="https://pbs.twimg.com/profile_images/974603248119222272/N5PLzyan.jpg")

        db.session.add(u)
        db.session.commit()

        self.first_name = u.first_name
        self.last_name = u.last_name
        self.user = u

    def tearDown(self):
        """ Clean up after testing """
        db.session.rollback()
        User.query.delete()
        db.session.commit()

    def test_users_list(self):
        with app.test_client() as client:
            resp = client.get("/users")
            html = resp.get_data(as_text=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn('Test Testing', html)

    def test_view_user(self):
        with app.test_client() as client:
            i = User.query.first()
            resp = client.get(f"/users/{i.id}")
            html = resp.get_data(as_text=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn('Test Testing', html)
            self.assertIn('<img src="https://pbs.twimg.com/profile_images/974603248119222272/N5PLzyan.jpg"', html)

    def test_create_user(self):
        with app.test_client() as client:
            resp = client.get("/users/new")
            html = resp.get_data(as_text=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn('<input type="text" name="first_name" placeholder="Enter a first name">', html)
            

    def test_delete_user(self):
        with app.test_client() as client:
            i = User.query.first()
            resp = client.get(f"/users/{i.id}/delete")
            html = resp.get_data(as_text=True)
            self.assertNotIn('Test Testing', html)