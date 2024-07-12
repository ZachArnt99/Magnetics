Vg <- 160
V <- 24
Iloadmax <- 1.5
turns_ratio <- 8
fs <- 150000
rho <- 1.724*10^-6

Ij <- 5
Rj <- 5
lj <- 5 #length of winding j
AWj <- 5 #Cross-sectional area of wire in winding j
#Rj = rho*lj/AWj
Pcuj <- Ij^2*Rj #This is the copper loss in winding j
nj <- 5
MLT <- 5
lj <- nj*MLT
alphaj <- 5
Awj <- WA*Ku*alphaj/nj
#Rj=rho*nj^2*MLT/(WA*Ku*alphaj)
#Pcuj = nj^2Ij^2*rho*MLT/(WA*Ku*alphaj) It is notable that the copper loss in winding j goes like 1/alphaj, so the smaller the portion of the window area we allocate to winding j, the larger its copper loss will be
#Pcutot = 所有Pcuj的和 = ksai
ksai <- 5 #This is the Lagrange multiplier
Pcutot <- ksai
#alpham <- nm*Im/sum from j = 1 to j = infinity of nj*Ij The portion of the core window that should be allocated to each winding equals the ratio of that winding's amp-turns to the amp-turns of all of the windings
#Alternately, alpham = VmIm/sum from j = 1 to j = infinity of VjIj Since voltages are proportional to the number of windings when all windings are on the same core, this is equivalent to the other form of alpham
i2 <- 5
n2 <- 5
n1 <- 5
i2reflected <- i2*n2/n1
n3 <- 5
i3 <- 5
i3reflected <- i3*n3/n1
ik <- 5
nk <- 5
ikreflected <- ik*nk/n1
#iM is the sum of all of the is from 1 to k referenced to the primary by reflecting through the respective turns ratios
#The magnetizing current is n1*iM, i.e. the number of turns in the primary times the total current of all of the windings referenced to the primary by reflecting through the respective turns ratios. n1*iM = B(t)*Ac*Rg. Note, it's actually (Rc+Rg), but we're assuming that Rc is small relative to Rg, so we leave Rc out of the equation.
#We're designing to a certain Bmax, so we'll stipulate n1*iMmax = Bmax*Ac*Rg=Bmax*lg/mu0 This is equation 1, where lg is the length of the air gap.
#
#We are designing for a specific magnetizing inductance LM = n1^2/Rg = n1^2*mu0*Ac/lg This is equation 2
Itot <- iM #I THINK! DOUBLE CHECK THIS! Itot is the sum of all of the currents referenced to the primary
#We are also designing for a specific total copper loss 
#Pcu = rho*MLT*LM^2*Itot^2*IMmax^2/(Bmax^2*Ac^2*WA*Ku) This can be re-arranged to isolate the core geometry terms on the LHS of the equation
#Ac^2*WA/MLT = rho*LM^2*Itot^2*IMmax^2/(Bmax^2*Ku*Pcu) Note, the left hand side is now my Kg, which is used to select the core size just as in the single winding inductor design process. I need to choose a Kg >= this value.
#Once I have selected a core, I need to plug in its Ac, WA, and MLT to calculate the lg, all of the n values 1 through k, and wire gauges for all of the windings.

#Flyback converter analysis
Vg <- 160
V <- 24
Iloadmax <- 1.5
turns_ratio <- 8
fsw <- 150000
Pcu <- 0.75 #Actually, my Pcu needs to be less than 0.75W
