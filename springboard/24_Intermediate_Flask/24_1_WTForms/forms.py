from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, BooleanField
from wtforms.validators import InputRequired, Optional, AnyOf, NumberRange, URL


# states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
#           "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
#           "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
#           "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
#           "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]


# class AddSnackForm(FlaskForm):
#     email = StringField("Email", validators=[Optional(), Email()])
#     name = StringField("Snack Name",  validators=[
#                        InputRequired(message="Snack Name can't be blank")])
#     price = FloatField("Price in USD")
#     quantity = IntegerField("How many?")
#     is_healthy = BooleanField("This is a healthy snack")

#     # category = RadioField("Category", choices=[
#     #                       ('ic', 'Ice Cream'),  ('chips', 'Potato Chips'),  ('candy', 'Candy/Sweets')])
#     category = SelectField("Category", choices=[
#                           ('ic', 'Ice Cream'),  ('chips', 'Potato Chips'),  ('candy', 'Candy/Sweets')])


# class EmployeeForm(FlaskForm):
#     name = StringField("Employee Name", validators=[
#                        InputRequired(message="Name cannot be blank")])
#     state = SelectField('State', choices=[(st, st) for st in states])
#     dept_code = SelectField("Department Code")

class AddPetForm(FlaskForm):
    """Form for adding a pet."""
    # Pet name
    name = StringField("Name:", validators=[InputRequired()])
    # Species. the species should be either “cat”, “dog”, or “porcupine”
    species = StringField("Species:", validators=[InputRequired(), AnyOf(["Cat","Dog","Porcupine", "shrew of the elephant variety"])])
    # Photo URL. the photo URL must be a URL (but it should still be able to be optional!)
    photo_url = StringField("Photo URL:", validators=[Optional(), URL()])
    # Age. the age should be between 0 and 30, if provided
    age = IntegerField("Age:", validators=[Optional(), NumberRange(min=0, max=30)])
    # Notes
    notes = StringField("Notes:", validators=[Optional()])

class EditPetForm(FlaskForm):
    """Form for editing a pet."""
    # Pet name
    name = StringField("Name:", validators=[InputRequired()])
    # Species. the species should be either “cat”, “dog”, or “porcupine”
    species = StringField("Species:", validators=[InputRequired(), AnyOf(["Cat","Dog","Porcupine", "shrew of the elephant variety"])])
    # Photo URL. the photo URL must be a URL (but it should still be able to be optional!)
    photo_url = StringField("Photo URL:", validators=[Optional(), URL()])
    # Age. the age should be between 0 and 30, if provided
    age = IntegerField("Age:", validators=[Optional(), NumberRange(min=0, max=30)])
    # Notes
    notes = StringField("Notes:", validators=[Optional()])
    # Available for adoption. 
    available = BooleanField("Available for adoption?")