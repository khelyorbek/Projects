from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def connect_db(app):
    db.app = app
    db.init_app(app)

# MODELS GO BELOW!
class Pet(db.Model):
    """Pet Model"""
    __tablename__ = "pet"

    # id: auto-incrementing integer
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # name: text, required
    name = db.Column(db.Text, nullable=False)
    # species: text, required
    species = db.Column(db.Text, nullable=False)
    # photo_url: text, optional
    photo_url = db.Column(db.Text, nullable=True, default="https://i.pinimg.com/originals/22/1c/20/221c2021c91d60b1eb13ea676460a92c.png")
    # age: integer, optional
    age = db.Column(db.Integer, nullable=True)
    # notes: text, optional
    notes = db.Column(db.Text, nullable=True)
    # available: true/false, required, should default to available
    available = db.Column(db.Boolean, nullable=False, default=True)
