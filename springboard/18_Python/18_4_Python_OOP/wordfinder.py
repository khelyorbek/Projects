from random import sample

class WordFinder:
    """Word Finder: finds random words from a dictionary."""
    
    # it is instantiated with a path to a file on disk that contains words, one word per line
    def __init__(self,path):
        """
        Constructor sets the passed argument 'path' into a class variable called 'path'
        Creates a new class variable 'words' and sets it to a empty List
        Calls the 'readFile' method
        """
        self.path = path
        self.words = []

        self.readFile()

    # it reads that file, and makes an attribute of a list of those words
    def readFile(self):
        """
        Creates a local variable 'file' and stores all the contents of the file.
        Also creates a local variable 'lineCounter' and sets it to 0
        Loops over each line of the file and appends it to a 'words' list
        Increases the counter every time the loop runs
        Prints out the 'lineCounter' variable that contains the number of lines read 
        Closes the file once done
        """
        file = open(self.path,'r')
        lineCounter = 0

        for line in file:
            self.words.append(line.strip('\n'))
            lineCounter += 1
        
        # it prints out “[num-of-words-read] words read”
        print(f"{lineCounter} lines read.")
        
        file.close()


    def random(self):
        """
        Creates a local list variable 'ranWords' and uses the sample library to store 1 random sample item from the full list
        Takes the first item of the list and strips the \n from the end
        Return the stripped result
        """
        ranWords = sample(self.words,k=1)
        return ranWords[0]

### TESTS ###
# In [5]: c = WordFinder("words_hundred.txt")
# 100 lines read.

# In [6]: c.random()
# Out[6]: 'bellicism'

# In [7]: c.random()
# Out[7]: 'clinting'

# In [8]: c.random()
# Out[8]: 'compurgatorial'

# In [9]: c.random()
# Out[9]: 'woolenize'