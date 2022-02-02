def titleize(phrase):
    """Return phrase in title case (each word capitalized).

        >>> titleize('this is awesome')
        'This Is Awesome'

        >>> titleize('oNLy cAPITALIZe fIRSt')
        'Only Capitalize First'
    """
# MY CODE
    cap = False
    sent = ''
    for c in phrase:
        if c == phrase[0]:
            sent += c.upper()
        elif c == ' ' and cap == False:
           cap = True
           sent += c
        elif c != ' ' and cap == True:
            sent += c.upper()
            cap = False
        else:
            sent += c.lower()
    return sent

# THEIR CODE
    # there's a built-in method for this!
    # return phrase.title()

    # or, if you didn't know that, could capitalize each word by hand
    # return ' '.join([s.capitalize() for s in phrase.split(' ')])