"""
This is a minimal contest submission file. You may also submit the full
hog.py from Project 1 as your contest entry.

Only this file will be submitted. Make sure to include any helper functions
from `hog.py` that you'll need here! For example, if you have a function to
calculate Free Bacon points, you should make sure it's added to this file
as well.

Don't forget: your strategy must be deterministic and pure.
"""

TEAM_NAME = '' # Change this line!

def final_strategy(score, opponent_score):
    """Write a brief description of your final strategy.

    *** YOUR DESCRIPTION HERE ***
    """
    # BEGIN PROBLEM 12
    GOAL_SCORE = 100
    if score >= GOAL_SCORE - 10 and score > opponent_score:
        return swap_strategy(score, opponent_score, 3, 1)

        if score > opponent_score and opponent_score > GOAL_SCORE / 2:
            return swap_strategy(score, opponent_score, 11, 5)

            return swap_strategy(score, opponent_score, 10, 6)
    # END PROBLEM 12

def swap_strategy(score, opponent_score, margin=8, num_rolls=4):
    """This strategy rolls 0 dice when it triggers a beneficial swap. It also
    rolls 0 dice if it gives at least MARGIN points. Otherwise, it rolls
    NUM_ROLLS.
    """
    # BEGIN PROBLEM 11
    diff = free_bacon(opponent_score)
    swaped = is_swap(score + diff, opponent_score)

    if (swaped and score < opponent_score) or (not swaped and diff >= margin):
        return 0
    else:
        return num_rolls
    # END PROBLEM 11
