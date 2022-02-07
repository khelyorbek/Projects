from flask import Flask, request, render_template
import stories

app = Flask(__name__)

# Creating a route for the homepage
@app.route('/')
def get_story():
    return render_template('get_story.html',names = stories.names)

# Creating a route to prompt the user for the input
@app.route('/prompts')
def get_prompts():
    storyNo = request.args["names"]
    story = stories.names[storyNo]

    # returning a HTML template and passing the list of prompts
    return render_template('prompts.html',prompts = story.prompts,story_no = storyNo)

@app.route('/story')
def show_story():
    storyNo = request.args["story_no"]
    
    story = stories.names[storyNo]

    # getting all the query arguments and passing it into generate method of the Story Class
    # then saving it into a variable called story
    storyText = story.generate(request.args)
    
    # returning a HTML template and passing 
    return render_template('story.html',story=storyText)