Our docstrings contain snippets of Python code which can be used to run tests to check if your function operates as it should. To run these “doctests”:

python3 -m doctest [filename].py
Make sure all of the tests pass!

Or if you want the test to output what its doing:
python -m doctest -v product.py