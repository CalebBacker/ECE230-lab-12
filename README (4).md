# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The modulo counter divides the clock by 2 * Count because the output only flips when the counter reaches its final value. It takes 6 clock ticks to make the output flip once, and you need two flips to make a full cycle.
### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The ring counter goes to all 1s on the first clock because it usually starts in the all-zeros state after reset, and the feedback logic is built so that if everything is zero, the inputs to the flip-flops are forced to 1. On the first clock edge, all those 1s get loaded into the flip-flops, so the outputs all become 1.
### 3 - What width of ring counter would you use to get to an output of ~1KHz?
you would need a ring counter with width 100,000 bits to get ~1 kHz out of a 100 MHz clock.
