from flask import Flask, request, redirect, render_template
from flask_debugtoolbar import DebugToolbarExtension
from models import db, connect_db, User, Post, Tag, PostTag

# Mapping flask to app variable
app = Flask(__name__)
# secret key for sessions
app.config['SECRET_KEY'] = "MyFirstFlaskSurveyApp1234567890"
# stopping flask debugger from intercepting redirects
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

# Having the Debug Toolbar show redirects explicitly is often useful;
# however, if you want to turn it off, you can uncomment this line:
#
# app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False

toolbar = DebugToolbarExtension(app)


connect_db(app)
db.create_all()


@app.route('/')
def root():
    """Homepage redirects to list of users."""

    return redirect("/users")


##############################################################################
# User route

@app.route('/users')
def users_index():
    """Show a page with info on all users"""

    users = User.query.order_by(User.last_name, User.first_name).all()
    return render_template('users/index.html', users=users)


@app.route('/users/new', methods=["GET"])
def users_new_form():
    """Show a form to create a new user"""

    return render_template('users/new.html')


@app.route("/users/new", methods=["POST"])
def users_new():
    """Handle form submission for creating a new user"""

    new_user = User(
        first_name=request.form['first_name'],
        last_name=request.form['last_name'],
        image_url=request.form['image_url'] or None)

    db.session.add(new_user)
    db.session.commit()

    return redirect("/users")


@app.route('/users/<int:user_id>')
def users_show(user_id):
    """Show a page with info on a specific user"""

    user = User.query.get_or_404(user_id)
    posts = Post.query.filter(Post.author_id == user_id)
    return render_template('users/show.html', user=user, posts=posts)


@app.route('/users/<int:user_id>/edit')
def users_edit(user_id):
    """Show a form to edit an existing user"""

    user = User.query.get_or_404(user_id)
    return render_template('users/edit.html', user=user)


@app.route('/users/<int:user_id>/edit', methods=["POST"])
def users_update(user_id):
    """Handle form submission for updating an existing user"""

    user = User.query.get_or_404(user_id)
    user.first_name = request.form['first_name']
    user.last_name = request.form['last_name']
    user.image_url = request.form['image_url']

    db.session.add(user)
    db.session.commit()

    return redirect("/users")


@app.route('/users/<int:user_id>/delete', methods=["POST"])
def users_destroy(user_id):
    """Handle form submission for deleting an existing user"""

    user = User.query.get_or_404(user_id)
    db.session.delete(user)
    db.session.commit()

    return redirect("/users")

# GET /users/[user-id]/posts/new
@app.route('/users/<int:user_id>/posts/new')
def new_post_page(user_id):
    """Show form to add a post for that user."""
    user = User.query.get_or_404(user_id)
    tags = Tag.query.all()
    return render_template('posts/new.html', user=user, tags=tags)

# POST /users/[user-id]/posts/new
@app.route('/users/<int:user_id>/posts/new', methods=["POST"])
def new_post(user_id):
    """Handle add form; add post and redirect to the user detail page."""
    title = request.form['title']
    content = request.form['content']
    tags = request.form.getlist('tags')

    new_post = Post(title=title, content=content, author_id=user_id)
       
    for tag in tags:
        t = Tag.query.filter_by(name=tag).first()
        new_post.tags.append(t)

    db.session.add(new_post)
    db.session.commit()
    
    return redirect(f"/users/{user_id}")

# GET /posts/[post-id]
@app.route('/posts/<int:post_id>')
def show_post(post_id):
    """Show a post. Show buttons to edit and delete the post."""
    post = Post.query.get_or_404(post_id)
    author = User.query.get_or_404(post.author_id)
    tags = post.tags
    return render_template('posts/view.html', post=post, author=author, tags=tags)

# GET /posts/[post-id]/edit
@app.route('/posts/<int:post_id>/edit')
def edit_post_page(post_id):
    """Show form to edit a post, and to cancel (back to user page)."""
    post = Post.query.get_or_404(post_id)
    all_tags = Tag.query.all()
    post_tags = post.tags
    return render_template('posts/edit.html', post=post, post_tags=post_tags, all_tags=all_tags)

# POST /posts/[post-id]/edit
@app.route('/posts/<int:post_id>/edit', methods=["POST"])
def edit_post(post_id):
    """Handle editing of a post. Redirect back to the post view."""
    post = Post.query.get_or_404(post_id)
    tags = request.form.getlist('tags')

    post.title = request.form['title']
    post.content = request.form['content']
    post.tags.clear()

    for tag in tags:
        t = Tag.query.filter_by(name=tag).first()
        post.tags.append(t)

    db.session.add(post)
    db.session.commit()

    return redirect(f"/posts/{post_id}")
    
# POST /posts/[post-id]/delete
@app.route('/posts/<int:post_id>/delete', methods=["POST"])
def delete_post(post_id):
    """Delete the post."""
    post = Post.query.get_or_404(post_id)

    db.session.delete(post)
    db.session.commit()

    return redirect(f"/users/{post.author_id}")

# GET /tags
@app.route('/tags')
def list_tags():
    """Lists all tags, with links to the tag detail page."""
    tags = Tag.query.all()

    return render_template('tags/list.html', tags=tags)

# GET /tags/[tag-id]
@app.route('/tags/<int:tag_id>')
def show_tag(tag_id):
    """Show detail about a tag. Have links to edit form and to delete."""
    tag = Tag.query.get_or_404(tag_id)
    posts = tag.posts

    return render_template('tags/show.html', tag=tag, posts=posts)

# GET /tags/new
@app.route('/tags/new')
def new_tag_show():
    """Shows a form to add a new tag."""
    return render_template('tags/new.html')

# POST /tags/new
@app.route('/tags/new', methods=["POST"])
def new_tag():
    """Process add form, adds tag, and redirect to tag list."""
    name = request.form['tagname']
    tag = Tag(name=name)
    db.session.add(tag)
    db.session.commit()
    return redirect('/tags')

# GET /tags/[tag-id]/edit
@app.route('/tags/<int:tag_id>/edit')
def edit_tag_show(tag_id):
    """Show edit form for a tag."""
    tag = Tag.query.get(tag_id)
    return render_template('/tags/edit.html', tag=tag)

# POST /tags/[tag-id]/edit
@app.route('/tags/<int:tag_id>/edit', methods=["POST"])
def edit_tag(tag_id):
    """Process edit form, edit tag, and redirects to the tags list."""
    name = request.form['tagname']
    tag = Tag.query.get(tag_id)
    tag.name = name
    db.session.add(tag)
    db.session.commit()

    return redirect(f'/tags/{tag_id}')

# POST /tags/[tag-id]/delete
@app.route('/tags/<int:tag_id>/delete', methods=["POST"])
def delete_tag(tag_id):
    """Delete a tag."""
    tag = Tag.query.get(tag_id)
    db.session.delete(tag)
    db.session.commit()

    return redirect('/tags')