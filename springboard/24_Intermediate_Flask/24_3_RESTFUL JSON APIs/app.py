"""Flask app for Cupcakes"""
from flask import Flask, request, render_template,  redirect, jsonify
from flask_debugtoolbar import DebugToolbarExtension
from models import db, connect_db, Cupcake

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///cupcakes'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = "chickenzarecool21837"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

connect_db(app)

# GET /api/cupcakes
@app.route('/api/cupcakes')
def api_get_cupcakes():
    """For returning all cupcakes."""
    # Get data about all cupcakes.
    cupcakes = [cake.serialize() for cake in Cupcake.query.all()]
    # Respond with JSON like: {cupcakes: [{id, flavor, size, rating, image}, ...]}.
    return jsonify(cupcakes=cupcakes)
    # The values should come from each cupcake instance.

# GET /api/cupcakes/[cupcake-id]
@app.route('/api/cupcakes/<int:cupcake_id>')
def api_get_single_cupcake(cupcake_id):
    """For returning details of 1 cupcake"""
    # Get data about a single cupcake.
    # This should raise a 404 if the cupcake cannot be found.
    cupcake = Cupcake.query.get_or_404(cupcake_id)
    # Respond with JSON like: {cupcake: {id, flavor, size, rating, image}}.
    return jsonify(cupcake=cupcake.serialize())
    

# POST /api/cupcakes
@app.route('/api/cupcakes', methods=["POST"])
def api_create_cupcake():
    """
    For adding a new cupcake. Must receive request in following format
    {
		"flavor": "TestFlavor2",
		"size": "TestSize2",
		"rating": 10,
		"image": "http://test.com/cupcake2.jpg"
    }
    """

    # Create a cupcake with flavor, size, rating and image data from the body of the request.
    new_cupcake = Cupcake(
        flavor = request.json['flavor'],
        size = request.json['size'],
        rating = request.json['rating'],
        image = request.json['image'] or None
    )
    db.session.add(new_cupcake)
    db.session.commit()
    # Respond with JSON like: {cupcake: {id, flavor, size, rating, image}}.
    return (jsonify(cupcake=new_cupcake.serialize()),201)

# PATCH /api/cupcakes/[cupcake-id]
@app.route('/api/cupcakes/<int:cupcake_id>', methods=['PATCH'])
def api_update_single_cupcake(cupcake_id):
    """For updating a single cupcake using PATCH"""
    # This should raise a 404 if the cupcake cannot be found.
    cupcake = Cupcake.query.get_or_404(cupcake_id)
    # Update a cupcake with the id passed in the URL and flavor, size, rating and image data from the body of the request. You can always assume that the entire cupcake object will be passed to the backend.
    cupcake.flavor = request.json.get('flavor', cupcake.flavor)
    cupcake.size = request.json.get('size', cupcake.size)
    cupcake.rating = request.json.get('rating', cupcake.rating)
    cupcake.image = request.json.get('image', cupcake.image)

    db.session.commit()

    # Respond with JSON of the newly-updated cupcake, like this: {cupcake: {id, flavor, size, rating, image}}.
    return jsonify(cupcake=cupcake.serialize())

# DELETE /api/cupcakes/[cupcake-id]
@app.route('/api/cupcakes/<int:cupcake_id>', methods=['DELETE'])
def api_delete_single_cupcake(cupcake_id):
    # This should raise a 404 if the cupcake cannot be found.
    cupcake = Cupcake.query.get_or_404(cupcake_id) 

    # Delete cupcake with the id passed in the URL. Respond with JSON like {message: "Deleted"}.
    db.session.delete(cupcake)
    db.session.commit()

    return jsonify(message="Deleted")

# GET /
@app.route('/')   
def render_home():
    # This should return an HTML page (via render_template). This page should be entirely static (the route should just render the template, without providing any information on cupcakes in the database). It should show simply have an empty list where cupcakes should appear and a form where new cupcakes can be added.
    return render_template('home.html')
