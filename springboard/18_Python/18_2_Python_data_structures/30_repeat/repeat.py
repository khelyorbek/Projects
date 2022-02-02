def repeat(phrase, num):
    """Return phrase, repeated num times.

        >>> repeat('*', 3)
        '***'

        >>> repeat('abc', 2)
        'abcabc'

        >>> repeat('abc', 0)
        ''

    Ignore illegal values of num and return None:

        >>> repeat('abc', -1) is None
        True

        >>> repeat('abc', 'nope') is None
        True
    """
    # My solution
    return phrase*num if isinstance(num,int) and num >= 0 else None

    # Their solution
    # if not isinstance(num, int) or num < 0:
    #     return None

    # return phrase * num