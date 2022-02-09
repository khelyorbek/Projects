# Imports from flask
from flask import Flask, request, render_template, redirect, flash
from flask_debugtoolbar import DebugToolbarExtension
# Importing from the python file provided
from surveys import satisfaction_survey

# Mapping flask to app variable
app = Flask(__name__)
# relies on app being defined. used for sesions
app.config['SECRET_KEY'] = "MyFirstFlaskSurveyApp1234567890"
# stopping flask debugger from intercepting redirects
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
# Instantiating the Debug Toolbar
debug = DebugToolbarExtension(app)

# initialize a variable called responses to be an empty list. As people answer questions, you should store their answers in this list.
responses = []

# When the user goes to the root route, render a page that shows the user the title of the survey, the instructions, and a button to start the survey.
@app.route('/')
def show_home():
    return render_template('home.html', title = satisfaction_survey.title, instructions = satisfaction_survey.instructions)

# When the user arrives at one of these pages, it should show a form asking the current question, and listing the choices as radio buttons.
@app.route('/questions/<int:num>')
def show_question(num):
    # checking if the question number is greater than the number of answers submitted
    if num > len(responses):
        # if so, will redirect them to the question that they left off
        flash("Wrong question number! You have been redirected...")
        return redirect(f'/questions/{len(responses)}')
    else:
        # if not, continues as normal rendering the question number as requested
        return render_template('question.html', question = satisfaction_survey.questions[num], title = satisfaction_survey.title, num = num)

# Answering the question should fire off a POST request to /answer with the answer the user selected (we’ll handle this route next).
@app.route('/answer',methods=["POST"])
def log_answer():
    # hidden input from the question.html. Current question number
    nextQ = int(request.form['num']) + 1
    
    ans = request.form["answer"]

    # adding the answer to the responses list
    responses.append(ans)

    # debugging
    print(f"Added {ans} to responses. Redirecting to question {nextQ}")

    if len(satisfaction_survey.questions) > nextQ:
        return redirect(f'/questions/{nextQ}')
    else:
        return redirect('/thank_you')

# Adding code for the thank you html page
@app.route('/thank_you')
def thank_user():
    return render_template('thank_you.html')