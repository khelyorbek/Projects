"""Flask Feedback"""
from flask import Flask, request, render_template,  redirect, jsonify, session, flash
from flask_debugtoolbar import DebugToolbarExtension
from models import db, connect_db, User, Feedback
from forms import UserForm, LoginForm, FeedbackForm
from sqlalchemy.exc import IntegrityError

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///flask_feedback'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = "chickenzarecool21837"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False


connect_db(app)
debug = DebugToolbarExtension(app)

# GET /
@app.route('/')
def show_home():
    # Redirect to /register.
    return redirect('/register')

# GET /register
@app.route('/register', methods=['GET','POST'])
def register_user():
    # Show a form that when submitted will register/create a user. This form should accept a username, password, email, first_name, and last_name.
    # Make sure you are using WTForms and that your password input hides the characters that the user is typing!
    form = UserForm()
    
    # POST /register
    # Process the registration form by adding a new user. Then redirect to /secret
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        email = form.email.data
        first_name = form.first_name.data
        last_name = form.last_name.data

        new_user = User.register(username, password, email, first_name, last_name)
        db.session.add(new_user)
        try:
            db.session.commit()
        except IntegrityError:
            form.username.errors.append('Username taken.  Please pick another')
            return render_template('register.html', form=form)
        session['username'] = new_user.username
        flash('Welcome! Successfully Created Your Account!', "success")
        return redirect(f'/users/{new_user.username}')

    return render_template('register.html', form=form)


# GET /login
@app.route('/login', methods=['GET','POST'])
def login_user():
    # Show a form that when submitted will login a user. This form should accept a username and a password.
    form = LoginForm()

    # Make sure you are using WTForms and that your password input hides the characters that the user is typing!
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data

        user = User.authenticate(username, password)
        # POST /login
        # Process the login form, ensuring the user is authenticated and going to /secret if so.
        if user:
            flash(f"Welcome Back, {user.username}!", "primary")
            session['username'] = user.username
            return redirect(f'/users/{user.username}')
        else:
            form.username.errors = ['Invalid username/password.']

    return render_template('login.html', form=form)

# Part 6: Let’s change /secret to /users/<username>
# GET /users/<username>
@app.route('/users/<string:username>')
def secret_page(username):
    # Despite all of this wonderful password hashing that you have been doing, anyone can navigate to /secret and see the text “You made it!”. Let’s protect this route and make sure that only users who have logged in can access this route!

    # You should ensure that only logged in users can access this page.
    if "username" not in session:
        flash("Please login first!", "danger")
        return redirect('/login')
    # Display a template the shows information about that user (everything except for their password)
    u = User.query.filter_by(username=username).first()
    f = Feedback.query.filter_by(username=username).all()
    return render_template('user.html', user=u, feedbacks=f)

# GET /logout
@app.route('/logout')
def logout_user():
    # Clear any information from the session and redirect to /

    if "username" not in session:
        flash("Please login first!", "danger")
        return redirect('/login')
    session.pop('username')
    flash("Goodbye!", "info")
    return redirect('/login')

# POST /users/<username>/delete
@app.route('/users/<string:username>/delete', methods=['POST'])
def delete_user(username):
    """For verifyng that user is logged in and deleting user"""
    if "username" not in session:
        flash("Please login first!", "danger")
        return redirect('/login')

    fs = Feedback.query.filter_by(username=username).delete()
    db.session.commit()

    u = User.query.filter_by(username=username).delete()
    db.session.commit()
    flash("Account successfully deleted. We will miss you!", "success")
    return redirect('/login')

# GET /users/<username>/feedback/add
@app.route('/users/<string:username>/feedback/add', methods=['GET','POST'])
def add_user(username):
    #  Make sure that only the user who is logged in can see this form
    if "username" not in session:
        flash("Please login first!", "danger")
        return redirect('/login')

    # Display a form to add feedback
    form = FeedbackForm()

    # POST /users/<username>/feedback/add
    if form.validate_on_submit():
        title = form.title.data
        content = form.content.data

        new_feedback = Feedback(title=title,content=content,username=username)

        db.session.add(new_feedback)
        db.session.commit()
        # Add a new piece of feedback and redirect to /users/<username>
        flash('Successfully added feedback!', "success")
        return redirect(f'/users/{username}')

    return render_template('feedback_add.html', form=form)

# GET /feedback/<feedback-id>/update
@app.route('/feedback/<int:fid>/update', methods=['GET','POST'])
def edit_feedback(fid):
    # Display a form to edit feedback
    feedback = Feedback.query.filter_by(id=fid).first()
    form = FeedbackForm(obj=feedback)
    
    #  Make sure that only the user who is logged in can see this form
    if "username" not in session:
        flash("Please login first!", "danger")
        return redirect('/login')

    # Make sure that only the user who has written that feedback can see this form **
    if session['username'] != feedback.username:
        flash("You do not have permissions to access this resource!", "danger")
        return redirect('/login')

    # POST /feedback/<feedback-id>/update
    if form.validate_on_submit():
        title = form.title.data
        content = form.content.data

        # Update a specific piece of feedback 
        feedback.title = title
        feedback.content = content

        db.session.add(feedback)
        db.session.commit()
        # and redirect to /users/<username>
        flash('Successfully updated feedback!', "success")
        return redirect(f'/users/{feedback.username}')

    return render_template('feedback_edit.html', form=form, feedback=feedback)

# POST /feedback/<feedback-id>/delete
@app.route('/feedback/<int:fid>/delete', methods=['POST'])
def delete_feedback(fid):
    feedback = Feedback.query.filter_by(id=fid).first()
     #  Make sure that only the user who is logged in can see this form
    if "username" not in session:
        flash("Please login first!", "danger")
        return redirect('/login')

    # Make sure that only the user who has written that feedback can see this form **
    if session['username'] != feedback.username:
        flash("You do not have permissions to access this resource!", "danger")
        return redirect('/login')

    Feedback.query.filter_by(id=fid).delete()
    db.session.commit()
    flash("Feedback successfully deleted.", "success")
    return redirect(f'/users/{feedback.username}')
    