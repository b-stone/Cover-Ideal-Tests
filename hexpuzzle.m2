R = ZZ[x_1..x_19]
row_1 = x_1 + x_2 + x_3 -38
row_2 = x_4 + x_5 + x_6 + x_7-38
row_3 = x_8 + x_9 + x_10 + x_11 + x_12-38
row_4 = x_13 + x_14 + x_15 + x_16-38
row_5 = x_17 + x_18 + x_19-38

diag_1 = x_8 + x_13 + x_17 - 38
diag_2 = x_4 + x_9 + x_14 + x_18 -38
diag_3 = x_1 + x_5 + x_10 + x_15 + x_19 -38
diag_4 = x_2 + x_6 + x_11 + x_16 -38
diag_5 = x_3 + x_7 + x_12 -38

gaid_1 = x_12 + x_16 + x_19 -38
gaid_2 = x_7 + x_11 + x_15 + x_18 -38
gaid_3 = x_3 + x_6 + x_10 + x_14 + x_17 -38
gaid_4 = x_2 + x_5 + x_9 + x_13 -38
gaid_5 = x_1 + x_4 + x_8 -38

zeros = for j from 1 to 19 list (
    product(
	for i from 1 to 19 list (
	    x_j - i
	    )
	)
    )

uniqueness = (product(flatten entries vars R)) -  19!

generatorsOfI = flatten(append(flatten zeros, flatten(
    for i from 1 to 5 list (
    	{row_i,diag_i,gaid_i}
    	)
    )
))

generatorsOfI = flatten(append(generatorsOfI,{x_10 - 5,x_2 - 19,uniqueness}))

I = ideal(generatorsOfI)
gens gb I
