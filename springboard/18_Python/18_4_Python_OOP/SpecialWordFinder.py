from wordfinder import WordFinder

class SpecialWordFinder(WordFinder):
    def readFile(self):
        super().readFile()
        
        self.words = [x for x in self.words if x != '']
        self.words = [x for x in self.words if not x.startswith('#')]


### TESTS ###
# In [1]: %run SpecialWordFinder.py

# In [2]: c = SpecialWordFinder("words_newline_comments.txt")
# 127 lines read.

# In [3]: c.random()
# Out[3]: 'schalmey'

# In [4]: c.random()
# Out[4]: 'odso'

# In [5]: c.random()
# Out[5]: 'Boche'

# In [6]: c.random()
# Out[6]: 'pronglike'