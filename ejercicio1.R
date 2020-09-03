set.seed(123) # Semilla para obtener resultados reproducibles

# Enfoque con loops-------------------------------------------------------------

SIMTIM <- vector()
DOWNT <- vector()
repairs <- vector()

for(NSIM in 1:100){ # 100 simulaciones
  SIMTIM[NSIM] <- 0 # Inicialización de simulation time
  DOWNT[NSIM] <- 0 # Inicialización de downtime
  component_repair <- 0
  repairs[NSIM] <- 0

  while(SIMTIM[NSIM] <= 2500){
    DOWNT[NSIM] <- DOWNT[NSIM] + component_repair
    component_failure <- rexp(n = 1, rate = 1/500)
    SIMTIM[NSIM] <- SIMTIM[NSIM] + DOWNT[NSIM] + component_failure
    component_repair <- rnorm(n = 1, mean = 25, sd = 5)
    if(SIMTIM[NSIM] <= 2500) repairs[NSIM] <- repairs[NSIM] + 1
  }
}

simuls <- data.frame(NSIM = 1:100,
                     DOWNT = round(DOWNT, 1),
                     pct_downtime = round(DOWNT, 1) / 2500,
                     repairs)

write.csv(x = simuls, file = "simuls.csv", row.names = FALSE)