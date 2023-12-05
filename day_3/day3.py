import math as m
import re

board = list(open('add_your_input_path'))
chars = {(rows, columns): [] for rows in range(140) for columns in range(140)
         if board[rows][columns] not in '01234566789.'}

for rows, row in enumerate(board):
    for n in re.finditer(r'\d+', row):
        edge = {(rows, columns) for rows in (rows - 1, rows, rows + 1)
                for columns in range(n.start() - 1, n.end() + 1)}

        for o in edge & chars.keys():
            chars[o].append(int(n.group()))

print('Part 1: ', sum(sum(p) for p in chars.values()),
      '\nPart 2: ', sum(m.prod(p) for p in chars.values() if len(p) == 2))
