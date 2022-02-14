from unittest import TestCase
from app import app
# Importing items related to Flask
from flask import Flask, session, render_template, request, jsonify
from boggle import Boggle
import pdb

class FlaskTests(TestCase):
    """Class for all the unit tests"""

    def test_show_home(self):
        """Testing the home page for good status code, rendering of a button and the session cokie"""
        with app.test_client() as client:
            # mapping the response to a variable
            res = client.get("/")
            # mapping the HTML content to a variable
            html = res.get_data(as_text=True)

            # testing to make sure we are getting a good status code
            self.assertEqual(res.status_code, 200)
            # print("Home >>> Status Code >>> OK - Good Status Code")

            # testing the rendering of our time left hardcoded parapgraph
            self.assertIn('<p>Time Left: <span id="time_left">60</span></p>', html)
            # print("Home >>> time left hardcoded parapgraph >>> OK - Exists")

            # testing the rendering of current score hardcoded parapgraph
            self.assertIn('<p>Current Score: <span id="game_score">0</span></p>', html)
            # print("Home >>> current score hardcoded parapgraph >>> OK - Exists")

            # testing to make sure the session cookie is the same as our global variable
            self.assertIn("board", session)
            # print("Home >>> Board Cookie >>> OK - Board value exists in Cookies")

    def test_check_word(self):
        """Testing the check page for good status code and good return"""
        # mapping the test_client as client
        with app.test_client() as client:
            # mapping the session_transaction as s
            with client.session_transaction() as s:
                # setting the board manuallay
                # otherwise will error
                s["board"] = [
                    ["T", "E", "S", "T", "S"],
                    ["T", "E", "S", "T", "S"],
                    ["T", "E", "S", "T", "S"],
                    ["T", "E", "S", "T", "S"],
                    ["T", "E", "S", "T", "S"]]

            # mapping the response to a variable
            # adding the word param that the method is expecting
            res = client.get("/check?word=test")
            
            # testing to make sure we are getting a good status code
            self.assertEqual(res.status_code, 200)
            # print("Check >>> Status Code >>> OK - Good Status Code")

            # checking to make sure the result comes back as OK
            # have to use json because the return is in that format
            self.assertEqual(res.json['result'],'ok')
            # print("Check >>> Response with data passed >>> OK - Correct Response")

    def test_add_to_score(self):
        """Testing the add to score page to make sure the calculation are being done and cookies are updating"""
        # mapping the test_client as client
        with app.test_client() as client:
            # mapping the session_transaction as s
            with client.session_transaction() as s:
                # setting the score cookies to 10
                s['score'] = 10

        # sending a post request
        # the app.py is expecting a json format so I am using json=
        # if I use data= it will throw a TypeError: 'NoneType' error.
        # After 3 hours of researching, found a solution: https://stackoverflow.com/questions/20001229/how-to-get-posted-json-in-flask
        res = client.post('/add_score', json={'add':'5'})
        # getting the html of the respionse
        html = res.get_data(as_text=True)
        # comparing the response to a string 15 because the response is also a string
        self.assertEqual(html,'15')

    def test_end_game(self):
        """Testing the end game functionality, should increment the times_played session cookie
        Shoud also figure out if current score is better than stored session cookie highest_score
        If the current score is better than the high score, set the high score as current score"""

        # mapping the test_client as client
        with app.test_client() as client:
            # mapping the session_transaction as s
            with client.session_transaction() as s:
                # setting the highest score cookies to 10
                s['highest_score'] = 10

                # setting the times played cookies to 5
                s['times_played'] = 5
            

            # sending a post request and passing a json with score 13
            res = client.post('/end_game', json={'current_score':'13'})
        
            # highest score was 10 but we sent 13 as current score
            # expected result is that our highest_score session cookie should be 13 now
            self.assertEqual(session['highest_score'],13)
            
            # times_played was set to 5
            # expected result is 6 because it gets incremented every time end_game() runs
            self.assertEqual(session['times_played'],6)