# AL_Project1
## Manual
Input interger N, get the damage.
<br />
below are the calculation of damage.
<br />
| F(N) | Range |
| :--  | :---- |
|  2*N+F(N/5) |   N>20  |
|  F(N-2)+F(N-3) |   10 < N <= 20  |
|  F(N-1)+F(N-2) |   1 < N <= 10  |
|  1 |   N = 1  |
|  5 |   N = 0  |
|  -1 |   otherwise  |

## Sample Input/Output

| num | Input | Output |
| :-- | :---- | :----- |
|  1. |   -1  |     -1 |
|  2. |    0  |      1 |
|  3. |    1  |      5 |
|  4. |    7  |     73 |
|  5. |   12  |    500 |
|  6. |   26  |     80 |
|  7. |  100  |   4672 |
|  8. | 20000 |  50029 |

## Outcome
```
Input a number:
0
The damage:
1
-- program is finished running (0) --

Input a number:
1
The damage:
5
-- program is finished running (0) --

Input a number:
7
The damage:
73
-- program is finished running (0) --

Input a number:
12
The damage:
500
-- program is finished running (0) --

Input a number:
26
The damage:
80
-- program is finished running (0) --

Input a number:
100
The damage:
4672
-- program is finished running (0) --

Input a number:
20000
The damage:
50029
-- program is finished running (0) --
```


## Code Intro
