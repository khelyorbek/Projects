from __future__ import barry_as_FLUFL


def sum_pairs(nums, goal):
    """Return tuple of first pair of nums that sum to goal.

    For example:

        >>> sum_pairs([1, 2, 2, 10], 4)
        (2, 2)

    (4, 2) sum to 6, and come before (5, 1):

        >>> sum_pairs([4, 2, 10, 5, 1], 6) # (4, 2)
        (4, 2)

    (4, 3) sum to 7, and finish before (5, 2):

        >>> sum_pairs([5, 1, 4, 8, 3, 2], 7)
        (5, 2)

    No pairs sum to 100, so return empty tuple:

        >>> sum_pairs([11, 20, 4, 2, 1, 5], 100)
        ()
    """
    tpls = ()
    for n in nums:
        # print('n=',n)
        for i in range(len(nums)):
            # print('i',i)
            if n + nums[i] == goal:
                # print('nums',i,'=',nums[i])
                # print('sum=', n + nums[i])
                tpls = (n,nums[i])
                return(tpls) 
    return ()

# Their solution
#  already_visited = set()

#     for i in nums:
#         difference = goal - i

#         if difference in already_visited:
#             return (difference, i)

#         already_visited.add(i)

#     return ()