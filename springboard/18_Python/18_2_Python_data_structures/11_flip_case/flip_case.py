def flip_case(phrase, to_swap):
    """Flip [to_swap] case each time it appears in phrase.

        >>> flip_case('Aaaahhh', 'a')
        'aAAAhhh'

        >>> flip_case('Aaaahhh', 'A')
        'aAAAhhh'

        >>> flip_case('Aaaahhh', 'h')
        'AaaaHHH'

    """
    new_phrase = ''
    for l in phrase:
        if l.upper() == to_swap.upper():
            new_phrase += l.swapcase()
        else:
            new_phrase += l
    return new_phrase


# THEIR SOLUTION
#     to_swap = to_swap.lower()
#     out = ""

#     for ltr in phrase:
#         if ltr.lower() == to_swap:
#             ltr = ltr.swapcase()
#         out += ltr

#     return out