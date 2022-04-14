# AL_Project1
## Manual
Input interger N, than get the damage.
<br />
Below are the calculation of damage.
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

**In main**, we jump to function right after input. <br />
Then decide which case should it go, by <br />
using 'blt' and 'beq', or simplily jump to <br />
otherwise if all above condition fail. <br />
<br />
We only modify s11(output answer) in cases 'N=1','N=0' <br />
and 'otherwise'. Which means it only modify s11 in the <br />
above three cases.<br />
<br />
Other three cases, 'N>20','10<N<=20' and '1<N<=10', will <br />
call function again, so it won't change s11 but need to <br />
store ra(return address), s5(current N) in to stack, than <br />
load them back after return. <br />
Ended by jumping back to return address. <br />
The last return address be called in stack, is leading us <br />
back to main. So we can finish calculating and print out <br />
the answer.<br />
<br />
**Below are the six cases:** <br />
<br />
**N>20**: <br />
 <tab /> First store ra(return address), s5(current N) <br />
  in the stack.<br />
  Second, calculate N/5 inorder to call F(N/5).<br />
  Third, load s5 back to compute 2*N, than add to s11.<br />
**10<N<=20**: <br />
   Different from 'N>20', call function two times, with <br />
    (N-2) and (N-3).<br />
**1<N<=10**: <br />
  Same as '10<N<=20', but call function with (N-2) and (N-3). <br />
**N=1**: <br />
  Simplily do addition to s11. <br />
**N=0**: <br />
  Simplily do addition to s11. <br />
**otherwise**: <br />
  Simplily do addition to s11. <br />

