R = QQ[x_1..x_t]
v = flatten entries vars R
s = subsets(v, 2)
G = graph(R,s)
time j = coverIdeal G
m = product v

oldCalc = (mon,n,J) -> (
    while ((mon^(n-1) % J^n) != 0) do (
	n = n + 1;
--	print n;
	);
    n
    )

fastPower = (I,n) -> (
    J := I;
    for i from 2 to n do J = J*I;
    return J)

test = (mon,n,J) -> (
    ans := 0;
--    print("The time to calculate the "|n|"th power is: ");
--    time I := fastPower(J,n);
    print("Taking "|n|"th Powers");
    I := fastPower(J,n);  
    print("Done with Powers, now testing");
    scan(flatten entries gens I, l -> if(mon^(n-1) % l == 0) then (ans = 1; break));
    return ans)

newCalc = (mon,n,J) -> (
    ans := 0;
--    I := J;
    for i from 2 to t do (
--	I = J*I; -- For some reason doing this makes things take more time. Odd.
	T := test(mon,i,J);
--	print T;
--	print(T!=0);
	if ( T != 0 ) then ( ans = i; break )
	);
    ans)

end

restart
needsPackage"EdgeIdeals"
t=3 -- Dont for get to save!
load"test-stone.m2"
m
n = 2
time newCalc(m,n,j)

n = 2
time oldCalc(m,n,j)


time for i from 2 to 9 do print(test(m,i,j) != 0)
test(m,2,j) != 0
test(m,3,j)
test(m,8,j) 


---- looking at unmixed
restart
R = QQ[a..f]
I = ideal"bde,abd"
L_0 = {b,c,e,f}
L_1 = {a,c,e,f}
L_2 = {a,c,d,e}
for i from 0 to 2 do L_i = apply(subsets(L_i,3),l-> product l)
peek L
for i from 0 to 2 do(
    for j from 0 to 2 do(
	for k from 0 to 2 do(
	    K = I + ideal(L_0#i) + ideal(L_0#j) + ideal(L_0#k);
	    KprimesDim = apply(minimalPrimes K, k -> dim k);
	    print K;
	    if min KprimesDim == max KprimesDim then J_(i,j,k) = K;
	    )
	)
    )
peek J
J

-- Random Test
restart
R = QQ[a,b,c,d,e,f]
S = flatten entries vars R
T = subsets subsets S




restart
needsPackage"Visualize"
R = QQ[a,b,c]
I = ideal"ab,bc"
trim I*I
visualize(I*I)
