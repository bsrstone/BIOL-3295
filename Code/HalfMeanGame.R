# Half-mean game
############
# Guesses x_i
x = c(17,2,20,66,72,24,25,17,63,12,21,46,50,25)
# Guesses for NE: 17,5,1,28,25,25,46,12,23,25,25
0.5*mean(x)

# Two people guessed 17 - they are the winners!

# But is 17 a NE and/or an ESS?
# Let there be n players in the game.
# Let pi^* = 17 and pi = 16
# Mean: (17*(n+1) + 16*1)/n
# Half the mean is: 0.5*(17*(n+1) + 16*1)/n
# If everyone guessed 17, the mean would be 17 and half the mean
# would be 17/2=8.5. However, one person guessed 16, so 1/2 the mean
# is a little bit less than 8.5. If n=1 half the mean is 8.25 and
# half the mean approaches 8.5 as n becomes large. Either way, the
# one individual that guessed 16 gets the 1,000,000 pts.

# W(pi, pi^*) = W(16,17) = 1,000,000
# W(pi^*,pi^*) = W(17,17) = 0

# pi^* does not have higher fitness. Since W(pi, pi^*)<=W(pi^*,pi^*)
# for all pi, finding just one pi, i.e., pi = 16, that has higher
# fitness is enough to show that pi^*=17 is not a NE or ESS.

# If pi = 18, then pi^* would have higher fitness, but that is not
# sufficient, pi^* must have higher fitness in the pi^* population for
# all possible pi.

#... it seems like low values do well. Is pi^* = 1 the NE? Note that
# no guess lower that pi^* = 1 is possible. Let pi = 2 and pi^* = 1.

# Half the mean is 0.5*(1*(n-1) + 2*1)/n. This is a number between 0.5 (if
# n is very large) and 0.75 (if n=2). pi^* = 1 is closer to 0.5-0.75 then pi = 2
# So, W(pi,pi^*) = W(2,1) = 0 pts
# W(pi^*,pi^*) = W(1,1) = 1,000,000 pts

# Technically, we need to argue that all other choices for pi will also
# yield 'losses' in the pi^* population. Suppose pi = 100.
# Half mean: = 0.5*((n-1)*1 + 100*1)/n between 0.5 and 50.5/2 = 25.25
# pi^* = 1 is closest to 25.25 => 1,000,000pts

# Therefore, pi^* = 1 is again both an ESS and an NE.

# I'll give an example in class of a NE that is not an ESS.
