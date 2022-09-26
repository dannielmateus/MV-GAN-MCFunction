# USES randomp BY emeraldfyr3
# RUN _init BEFORE (NAMESPACE: math)

# INITIALIZE: S, x, y, w1, w2
# S = w1*x + w2*y

scoreboard players set math_in1 em 1000
scoreboard players set math_in2 em 10000
scoreboard players set scale em 1000
scoreboard players set S em 15500
scoreboard players set w1 em 0
scoreboard players set w2 em 0
scoreboard players set x em 5
scoreboard players set y em 3
scoreboard players set x_w em 0
scoreboard players set y_w em 0

# SET w1, w2
function math:randomp
scoreboard players operation w1 em += math_out em
function math:randomp
scoreboard players operation w2 em += math_out em

# x_w = w1*x / y_w = w2*x
scoreboard players operation x_w em += w1 em
scoreboard players operation x_w em *= x em
scoreboard players operation y_w em += w2 em
scoreboard players operation y_w em *= y em

# CALCULATE PREDICTED S
scoreboard players set cS em 0
scoreboard players operation cS em += x_w em
scoreboard players operation cS em += y_w em

scoreboard players set deltaS em 0
scoreboard players operation deltaS em += S em
scoreboard players operation deltaS em -= cS em
scoreboard players operation error em += deltaS em
scoreboard players operation error em /= scale em
