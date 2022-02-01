def reverse_string(phrase):
    """Reverse string,

        >>> reverse_string('awesome')
        'emosewa'

        >>> reverse_string('sauce')
        'ecuas'
    """
    # turning string into a list
    l = list(phrase)
    # reversing the list
    l.reverse()
    # turning the list back into a string
    s = "".join(l)
    # returning the string
    return s

    # SOLUTION HAD THIS CODE. MUCH SMALLER AND EASIER
    # return phrase[::-1]

    # In [2]: "hello"[::-1]
    # Out[2]: 'olleh'