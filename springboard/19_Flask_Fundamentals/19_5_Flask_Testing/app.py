"""Main application file for the Boogle Exercise"""

# Importing the Boggle class from the boggle python file
from boggle import Boggle
# Importing items related to Flask
from flask import Flask, session, render_template, request, jsonify


# mapping Boggle class to the boggle_game variable
boggle_game = Boggle()
# mapping the Flask object into an app variable
app = Flask(__name__)
# secret key for Flask sessions
app.config['SECRET_KEY'] = "MyFirstFlaskSurveyApp1234567890"
# stopping flask debugger from intercepting redirects
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False


# Creating a route for the home page index 
@app.route('/')
def show_home():
    """To generate a board of random letters and renders a template called home.html"""
    # generating a board on the backend using a function from the boggle.py file
    board = boggle_game.make_board()

    # Debugging
    # print("show_home() >>> board >>>",board)

    # will also be using this board in other routes, placing it in the session
    session["board"] = board

    # initializing the cookie of score to be 0 when the page loads. to keep track of the current score
    session["score"] = 0

    # initializing 2 cookies that keep track of our highest score and times played      
    # if they don't exist, setting to 0
    highest_score = session.get('highest_score',0)
    times_played = session.get('times_played',0)

    # Debugging
    # print('show_home() >>> highest_score >>>',highest_score)
    # print('show_home() >>> times_played >>>',times_played)
    # print('show_home() >>> session >>>',session)

    # rendering a template called home and passing the board method variable to the Jinja template
    # also passing values of 2 session cookies
    return render_template('home.html', board = board, highest_score = highest_score, times_played = times_played)

@app.route('/check')
def check_word():
    """For checking if a passed word= exists in the session cookie board and is a valid word"""
    # grabbing the argument word passed to us from home.html JS
    guessed_word = request.args['word']

    # mapping the current board session cookie to a variable
    board_cookie = session["board"]

    # Debugging
    # print("check_word() >>> guessed_word >>> ",guessed_word)

    # making sure that the word exists in the dictionary and is valid on the board 
    # using the check_valid_word function from the boggle.py file.
    # check_valid_word accepts a board first and then the guessed word next
    check_result = boggle_game.check_valid_word(board_cookie, guessed_word)

    # returning a JSONified version and mapping check_result variable to the result key
    return jsonify({"result": check_result})


@app.route('/add_score', methods=["POST"])
def add_to_score():
    """For adding the parameter add= to the score cookie that we have stored"""
    # grabbing the argument add passed to us from home.html JS
    # must use .json because the content type of the axis post request is a json
    points = request.json['add']
    # Debugging
    # print("add_to_score() >>> points >>>",points)

    # mapping the current score cookie to a variable
    score = session["score"]
    
    # Debugging
    # print("add_to_score() >>> score >>>",score)

    # turning points into an integer because its a string from .json
    # adding the points to the current score
    sum = score + int(points)

    # setting the score cookie to a new value of sum
    session["score"] = sum

    # returning sum as a response to the post request as a string
    return str(sum)

@app.route('/end_game', methods=["POST"])
def end_game():
    """For receiving the current score from the front-end and comparing to the highest score saved in cookies
    Also increments the times_played session cookie by 1
    """

    # initializing 2 cookies that keep track of our highest score and times played      
    highest_score = session.get('highest_score',0)
    times_played = session.get('times_played',0)

    # Debugging
    # print("end_game() >>> highest_score >>>",highest_score)
    # print("end_game() >>> times_played >>>",times_played)

    # getting the current score from the JSON string that was passed from app.js
    # turning it into an int for comparing later
    current_score_raw = request.json["current_score"]
    current_score = int(current_score_raw)

    # Debugging
    # print("end_game() >>> curr_score >>>",current_score)

    # incrementing the times_played by 1
    times_played += 1
    # settings the new value to be the cookie value
    session['times_played'] = times_played

    # if our current score is bigger than the highest_score recorded
    if highest_score < current_score:
        # set the current score as the highest score
        session['highest_score'] = current_score

    # returning the current score because we have to return something
    return str(highest_score)