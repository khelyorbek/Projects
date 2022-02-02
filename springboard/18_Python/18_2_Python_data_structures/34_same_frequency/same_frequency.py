def same_frequency(num1, num2):
    """Do these nums have same frequencies of digits?
    
        >>> same_frequency(551122, 221515)
        True
        
        >>> same_frequency(321142, 3212215)
        False
        
        >>> same_frequency(1212, 2211)
        True
    """
    # My solution
    n1List = [x for x in str(num1)]
    n2List = [x for x in str(num2)]

    n1Set = {x for x in str(num1)}
    n2Set = {x for x in str(num2)}

    n1Dic = {}
    n2Dic = {}

    for n1 in n1Set:
        n1Dic[n1] = n1List.count(n1)

    for n2 in n2Set:
        n2Dic[n2] = n2List.count(n2)

    if n1Dic == n2Dic:
        return True
    else:
        return False

    # Their solution
# def freq_counter(coll):
#     """Returns frequency counter mapping of coll."""

#     counts = {}

#     for x in coll:
#         counts[x] = counts.get(x, 0) + 1

#     return counts


# def same_frequency(num1, num2):
#     """Do these nums have same frequencies of digits?

#         >>> same_frequency(551122, 221515)
#         True

#         >>> same_frequency(321142, 3212215)
#         False

#         >>> same_frequency(1212, 2211)
#         True
#     """

#     return freq_counter(str(num1)) == freq_counter(str(num2))