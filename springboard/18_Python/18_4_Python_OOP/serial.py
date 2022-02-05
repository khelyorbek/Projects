"""Python serial number generator."""

class SerialGenerator:
    """Machine to create unique incrementing serial numbers.
    
    >>> serial = SerialGenerator(start=100)

    >>> serial.generate()
    100

    >>> serial.generate()
    101

    >>> serial.generate()
    102

    >>> serial.reset()

    >>> serial.generate()
    100
    """
    def __init__(self,start):
        """
        Constructor that accepts a value parameters and stores it into a start_value variable which always stays the same.
        It also creates a variable 'iterate' which is initialized as the same number.
        """
        self.start_value = start
        self.iterate = self.start_value - 1

    def generate(self):
        """
        Method that will increment the value of 'iterate' by 1 and return it
        """
        self.iterate += 1
        return self.iterate
    
    def reset(self):
        """
        Method that will reset the value of 'iterate' back to its original number stored in 'start_value'
        """
        self.iterate = self.start_value - 1

# ALL TESTS PASSED