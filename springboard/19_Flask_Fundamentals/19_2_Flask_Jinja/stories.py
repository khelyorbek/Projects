"""Madlibs Stories."""


class Story:
    """Madlibs story.

    To  make a story, pass a list of prompts, and the text
    of the template.

        >>> s = Story(["noun", "verb"],
        ...     "I love to {verb} a good {noun}.")

    To generate text from a story, pass in a dictionary-like thing
    of {prompt: answer, promp:answer):

        >>> ans = {"verb": "eat", "noun": "mango"}
        >>> s.generate(ans)
        'I love to eat a good mango.'
    """

    def __init__(self,name, words, text):
        """Create story with words and template text."""
        self.name = name
        self.prompts = words
        self.template = text

    def generate(self, answers):
        """Substitute answers into text."""

        text = self.template

        for (key, val) in answers.items():
            text = text.replace("{" + key + "}", val)

        return text


# Here's a story to get you started


story1 = Story("Story 1",
    ["place", "noun", "verb", "adjective", "plural_noun"],
    """Once upon a time in a long-ago {place}, there lived a
       large {adjective} {noun}. It loved to {verb} {plural_noun}."""
)

story2 = Story("Story 2",
    ["noun", "main_character", "noun2", "secondary_character", "noun3","verb_past_tense"],
    """Bitter about {noun}'s cruel games, {main_character} struggles to adjust to {noun2} when a mysterious character {secondary_character} forces them into a situation well outside their control that could result in a lot of {noun3} being {verb_past_tense}.."""
)

story3 = Story("Story 3",
    ["main_character", "verb_past_tense", "verb2_present_tense", "noun_object", "verb", "object", "verb3_past_tense"],
    """On just another average day, {main_character} is {verb_past_tense} to {verb2_present_tense} the {noun_object} around them {verb} when they are involved in a case of mistaken {object} that will eventually lead to them being {verb3_past_tense}."""
)

story4 = Story("Story 4",
    ["noun", "main_character", "verb1_past_tense", "object", "noun", "verb2_past_tense"],
    """Stuck enduring the {noun} grind, {main_character} is tasked with {verb1_past_tense} an important {object} when they witness a secret {noun} that will lead to them being {verb2_past_tense}."""
)

names = {x.name: x for x in [story1,story2,story3,story4]}

# Example of how to use this
# 1 Create an instance of this class and define what you want the variable to be and what the text of the story to be
# s = Story(['noun','verb'],"I like to {verb} {noun}")

# 2 Pass in some values to the variables
# s.generate({'noun':'cheese','verb':'eat'})

# In [15]: s.generate({'noun':'cheese','verb':'eat'})
# Out[15]: 'I like to eat cheese'