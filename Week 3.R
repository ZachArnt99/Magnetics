lc <- 5 
muc <- 5 #The magnetic permeability (mu) of the core. This is mu0*murelative
Ac <- 5 #Cross-sectional area of the core (in cm^2)
Rc <- lc/(muc*Ac)
lg <- 5 #length of the air gap
mu0 <- 4*pi*10^-7 #H/m
Rg <- lg/(mu0*Ac)
i <- 5
n <- 5
Phi <- 5
n <- 5
i <- 5
ni <- Phi*Rg
Bsat <- 5
Imax <- 5 #(A)
Bmax <- 5 #(T) Maximum flux density of the core
B <- 5
ni <- B*Ac*Rg
#n*Imax = Bmax*Ac*Rg=Bmax*lg/mu0 This is equation 1. It relates Imax to Bmax. It's also a function of the number of turns (n) and the gap length (lg) which are design choices which we haven't selected yet.
I <- Imax
B <- Bmax
L <- 5 (H)
#L = n^2/Rg = mu0*Ac*n^2/lg This is equation 2. It relates our target inductance to the area of the core (Ac), the number of turns (n), and the length of the air gap (lg) At this point, we still don't know Ac, n, or lg. These are all design choices we have yet to make.
WA <- 5#Window area (in cm^2). This is a features of the core. It is a geometrical feature that limits the number of turns we can use
AW <- 5#Area of the wire. This is the bare copper area
Ku <- 5 #Fill factor (a.k.a. window utilization factor). This is how much of the available window area we can use. It is a number less than one. It accounts for the shape of the cross-section of copper, insulation, bobbin volume, added insulation between windings, etc. Typical values: for a low-voltage, foil-winding inductor, 0.65; for a typical device wound on a bobbin in the lab: 0.5; for an off-line transformer: 0.25-0.30; for a high-voltage transformer: 0.05 to 0.2 
#Ku*WA >= n*AW This is equation 3.
lb <- 5 #length of the wire
R <- 5 #(Ω) dc resistance of the wire
rho <- 1.724*10^-6 #(Ω*cm) Resistivity of copper at room temperature
rho100C <- 2.3*10^-6 #Ω*cm The resistivity of copper at 100°C is higher than it is at 25°C 
R <- rho*lb/AW
MLT <- 5 #Mean Length per Turn (in cm). This is a feature of the core, and should be given in the core's spec sheet.
lb <- n*MLT
R <- rho*n*MLT/AW #This is equation 4. It is the dc resistance of the winding.
#The variables that come from the core are: Ac, WA, and MLT
#The known/given quantities (a.k.a. specifications) are: Imax, Bmax mu0, inductance (L), fill factor (Ku), R, and rho. We have to know the values of these and have decided on them BEFORE WE START DESIGNING OUR INDUCTOR.
#The unknown design variables are: number of turns (n), length of air gap (lg), and bare wire copper area (a.k.a. area of the wire (Aw)) These are things we have to choose during the design process.

#Ac^2*WA/MLT >= rho*L^2*Imax^2/Bmax^2*R*Ku The right hand side is populated with specifications or other known quantities. The left hand side is a function of only core geometry. We will call Ac^2*WA/MLT the core geometrical constant (Kg). Notice how the different variables on the right hand side affect the value of the equation. This is good for design insight.
Kg <- Ac^2*WA/MLT #I need to choose a core that has Kg greater than or equal to this.
#After I choose a core, I need to go back to equations 1, 2, and 3 to solve for the remaining unknowns.

#Step 1 - Determine core size
L <- 108.88*10^-6
Imax <- 5.35714286+5.35714286/10 
Bmax <- .225 
R <- .026133
Ku <- 0.5 
Kg <- rho*L^2*Imax^2/(Bmax^2*R*Ku)*10^8 #(cm^5)
#I need to choose a core with Kg equal to or larger than this, and assign its values for Ac, WA, and MLT
Ac <- 1.18 
WA <- .503
MLT <- 5.62

lg <- mu0*L*Imax^2*10^4/(Bmax^2*Ac)
n <- Bmax*lg/(mu0*Imax)
n <- 24
Aw <- rho*n*MLT/R
AW <- Ku*WA/n
rho*n*MLT/AW
