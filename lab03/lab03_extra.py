""" Optional problems for Lab 3 """

from lab03 import *

## Higher order functions

def cycle(f1, f2, f3):
    """Returns a function that is itself a higher-order function.

    >>> def add1(x):
    ...     return x + 1
    >>> def times2(x):
    ...     return x * 2
    >>> def add3(x):
    ...     return x + 3
    >>> my_cycle = cycle(add1, times2, add3)
    >>> identity = my_cycle(0)
    >>> identity(5)
    5
    >>> add_one_then_double = my_cycle(2)
    >>> add_one_then_double(1)
    4
    >>> do_all_functions = my_cycle(3)
    >>> do_all_functions(2)
    9
    >>> do_more_than_a_cycle = my_cycle(4)
    >>> do_more_than_a_cycle(2)
    10
    >>> do_two_cycles = my_cycle(6)
    >>> do_two_cycles(1)
    19
    """
    funs = [f1, f2, f3]

    def cycle_through(n):
        def inner_cycle(x):
            count = 0

            while count < n:
                x = funs[count % len(funs)](x)
                count += 1
            
            return x
        return inner_cycle
    return cycle_through

## Lambda expressions

def is_palindrome(n):
    """
    Fill in the blanks '_____' to check if a number
    is a palindrome.

    >>> is_palindrome(12321)
    True
    >>> is_palindrome(42)
    False
    >>> is_palindrome(2015)
    False
    >>> is_palindrome(55)
    True
    """
    x, y = n, 0
    f = lambda: 10 * y + x % 10
    while x > 0:
        x, y = x // 10, f()
    return y == n

## More recursion practice

def skip_mul(n):
    """Return the product of n * (n - 2) * (n - 4) * ...

    >>> skip_mul(5) # 5 * 3 * 1
    15
    >>> skip_mul(8) # 8 * 6 * 4 * 2
    384
    """
    if n == 2 or n == 1:
        return n
    else:
        return n * skip_mul(n - 2)

def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    def is_prime(x):
        if x <= 1:
            return True
        elif n % x == 0:
            return False
        else:
            return is_prime(x - 1)

    return is_prime(n - 1)

def interleaved_sum(n, odd_term, even_term):
    """Compute the sum odd_term(1) + even_term(2) + odd_term(3) + ..., up
    to n.

    >>> # 1 + 2^2 + 3 + 4^2 + 5
    ... interleaved_sum(5, lambda x: x, lambda x: x*x)
    29
    """
    def helper(total, count, is_even, odd_term, even_term):
        if count > n:
            return total
        elif is_even == 0:
            total += odd_term(count)
        else:
            total += even_term(count)

        return helper(total, count + 1, 1 - is_even, odd_term, even_term)

    return helper(0, 1, 0, odd_term, even_term)


def ten_pairs(n):
    """Return the number of ten-pairs within positive integer n.

    >>> ten_pairs(7823952)
    3
    >>> ten_pairs(55055)
    6
    >>> ten_pairs(9641469)
    6
    """
    if n == 0:
        return 0
    else:
        return ten_pairs_helper(n // 10, n % 10) + ten_pairs( n // 10)


def ten_pairs_helper(n, target):
    if n == 0:
        return 0
    elif n % 10 + target == 10:
        return 1 + ten_pairs_helper(n // 10, target)
    else:
        return ten_pairs_helper(n // 10, target)
