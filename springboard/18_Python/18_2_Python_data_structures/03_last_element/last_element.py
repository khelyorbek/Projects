def last_element(lst):
    """Return last item in list (None if list is empty.
    
        >>> last_element([1, 2, 3])
        3
        
        >>> last_element([]) is None
        True
    """
    if lst == []:
        # checked solution and don't need this because it returns None automatically
        # but I will keep it here
        return None
    else:
        return lst[-1]