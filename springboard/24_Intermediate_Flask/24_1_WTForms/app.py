from crypt import methods
from flask import Flask, request, render_template,  redirect, flash, session
from flask_debugtoolbar import DebugToolbarExtension
from models import db,  connect_db, Pet
from forms import AddPetForm, EditPetForm

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///pet_adoption'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = "chickenzarecool21837"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

connect_db(app)

@app.route('/')
def show_home():
    """Listing pets on the homepage"""
    pets = Pet.query.all()
    return render_template('home.html', pets=pets)

@app.route('/add')
def add_pet_show():
    """Handle the input generation for adding a pet"""
    form = AddPetForm()
    return render_template('pet_add_form.html', form=form)

@app.route('/add', methods=["POST"])
def add_pet():
    """Handle validation and adding the pet"""
    form = AddPetForm()
    if form.validate_on_submit():
        name = form.name.data
        species = form.species.data
        photo_url = form.photo_url.data
        age = form.age.data
        notes = form.notes.data

        if photo_url == '':
            photo_url = 'https://i.pinimg.com/originals/22/1c/20/221c2021c91d60b1eb13ea676460a92c.png'

        p = Pet(name=name,species=species,photo_url=photo_url,age=age,notes=notes)
        db.session.add(p)
        db.session.commit()

        return redirect('/')
    else:
        # Should not redirect. If we do, the error messages don't show up.
        return render_template('pet_add_form.html', form=form)

@app.route('/view/<int:id>')
def view_pet(id):
    """View information about a pet"""
    pet = Pet.query.get_or_404(id)
    return render_template('pet_view_info.html',pet=pet)

@app.route('/edit/<int:id>')
def edit_pet_show(id):
    """Handle the population of the form for editing"""
    pet = Pet.query.get_or_404(id)
    form = EditPetForm(obj=pet)
    return render_template('pet_edit_form.html', form=form)

@app.route('/edit/<int:id>', methods=["POST"])
def edit_pet(id):
    """Handle validation and editing the pet in response to POST Request"""
    pet = Pet.query.get_or_404(id)
    form = EditPetForm()
    if form.validate_on_submit():
        pet.name = form.name.data
        pet.species = form.species.data
        pet.photo_url = form.photo_url.data
        pet.age = form.age.data
        pet.notes = form.notes.data
        pet.available = form.available.data

        if pet.photo_url == '':
            pet.photo_url = 'https://i.pinimg.com/originals/22/1c/20/221c2021c91d60b1eb13ea676460a92c.png'

        db.session.add(pet)
        db.session.commit()

        return redirect(f'/view/{id}')
    else:
        # Should not redirect. If we do, the error messages don't show up.
        return render_template('pet_edit_form.html', form=form)

@app.route('/delete/<int:id>')
def delete_pet(id):
    """Handle delete request for pet"""
    Pet.query.filter_by(id=id).delete()
    db.session.commit()
    return redirect('/')