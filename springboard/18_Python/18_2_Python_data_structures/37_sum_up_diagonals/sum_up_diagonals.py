def sum_up_diagonals(matrix):
    """Given a matrix [square list of lists], return sum of diagonals.

    Sum of TL-to-BR diagonal along with BL-to-TR diagonal:

        >>> m1 = [
        ...     [1,   2],
        ...     [30, 40],
        ... ]
        >>> sum_up_diagonals(m1)
        73

        >>> m2 = [
        ...    [1, 2, 3],
        ...    [4, 5, 6],
        ...    [7, 8, 9],
        ... ]
        >>> sum_up_diagonals(m2)
        30
    """
    sum = 0

    for i in range(len(matrix)):
        sum += matrix[i][i]
        sum += matrix[i][-1 -i]

    return sum
        # 00 01 02
        # 10 11 12
        # 20 21 22

        # 00 11 22
        # 02 11 20

        # -1 - 0 = -1
        # -1 - 1 = -2
        # -1 - 2 = -3