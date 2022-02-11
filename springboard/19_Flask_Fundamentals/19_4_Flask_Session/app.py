# Imports from flask
from http.client import responses
from flask import Flask, request, render_template, redirect, flash, session
from flask_debugtoolbar import DebugToolbarExtension

# Importing from the python file provided
from surveys import satisfaction_survey

# Mapping flask to app variable
app = Flask(__name__)
# secret key for sessions
app.config['SECRET_KEY'] = "MyFirstFlaskSurveyApp1234567890"
# stopping flask debugger from intercepting redirects
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
# Instantiating the Debug Toolbar
debug = DebugToolbarExtension(app)

# When the user goes to the root route, render a page that shows the user the title of the survey, the instructions, and a button to start the survey.
@app.route('/')
def show_home():
    # returning a home.html template ane passing 2 variables that will be used using Jinja
    return render_template('home.html', title = satisfaction_survey.title, instructions = satisfaction_survey.instructions)

# Setting up a POST page that will initialize the sessions by encrypting and setting a cookie responses
@app.route('/init-session', methods=["POST"])
def init_session():
    # setting the responses cookie to empty list
    session["responses"] = []
    # redirecting to the first question
    return redirect('/questions/0')

# When the user arrives at one of these pages, it should show a form asking the current question, and listing the choices as radio buttons.
@app.route('/questions/<int:num>')
def show_question(num):
    # grabbing the value of responses cookie and decrypting, then storing into a variable.
    responses = session["responses"]

    # checking if the question number is greater than the number of answers submitted
    # this is to prevent users from going far ahead of the current question
    if num > len(responses):
        # if so, flash a message
        flash("Wrong question number! You have been redirected...")
        # then will redirect them to the question that they left off
        return redirect(f'/questions/{len(responses)}')
    else:
        # if not, continues as normal rendering the question number as requested
        return render_template('question.html', question = satisfaction_survey.questions[num], title = satisfaction_survey.title, num = num)

# Answering the question should fire off a POST request to /answer with the answer the user selected (we’ll handle this route next).
@app.route('/answer',methods=["POST"])
def log_answer():
    # grabbing the value of responses cookie and decrypting, then storing into a variable.
    responses = session["responses"]

    # hidden input from the question.html. Stores a next question number
    nextQ = int(request.form['num']) + 1
    
    # grabbing a value of the answer query key
    ans = request.form["answer"]

    # adding the answer to the responses variable
    responses.append(ans)

    # appending the answer to the cookie that we have stored
    session["responses"] = responses

    # debugging
    # print(f"Added {ans} to responses. Redirecting to question {nextQ}")

    # checking if the next question number is less than the lenght of the question array
    if len(satisfaction_survey.questions) > nextQ:
        # if its less, will display the next question
        return redirect(f'/questions/{nextQ}')
    else:
        # if its >= then its the end of the questions and displays a thank you page
        return redirect('/thank_you')

# Adding code for the thank you html page
@app.route('/thank_you')
def thank_user():
    # grabbing the value of responses cookie and decrypting, then storing into a variable.
    responses = session["responses"]
    # rendering a template and passing the full list as a variable
    return render_template('thank_you.html',responses = responses)