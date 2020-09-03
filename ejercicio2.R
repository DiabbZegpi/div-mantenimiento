set.seed(456) # Semilla para reproducibilidad

# Supuesto: N° simulaciones = 100, como en el ejercicio 1

system_failure_time <- vector()
failed <- vector()

for(NSIM in 1:100){
  A_failure_time <- rexp(n = 1, rate = 1 / 500)
  C_failure_time <- rexp(n = 1, rate = 1 / 600)
  if(A_failure_time > C_failure_time){
    system_failure_time[NSIM] <- C_failure_time
    failed[NSIM] <- "C"
  } else{
    B_failure_time <- rexp(n = 1, rate = 1/200)
    AB_failure_time <- A_failure_time + B_failure_time
    if(AB_failure_time > C_failure_time){
      system_failure_time[NSIM] <- C_failure_time
      failed[NSIM] <- "C"
    } else{
      system_failure_time[NSIM] <- AB_failure_time
      failed[NSIM] <-"A y B"
    } 
  }
}

simuls <- data.frame(NSIM = 1:100,
                     system_failure_time,
                     failed)

write.csv(x = simuls, file = "data_ejercicio2.csv", row.names = FALSE)