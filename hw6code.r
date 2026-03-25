##1D plot
states <- 0:4

PiDist <- c(1/12, 1/4, 1/3, 1/4, 1/12)
q50Dist <- c(1/6, 0, 2/3, 0, 1/6)

df <- data.frame(
  State = factor(rep(states, 2)),
  Probability = c(PiDist, q50Dist),
  Type = rep(c("Stationary (pi)", "Step 50 (q50)"), each = 5)
)
barplot(rbind(PiDist, q50Dist), 
        beside = TRUE, 
        names.arg = states,
        col = c("blue", "red"),
        main = "Comparison of q50 vs Stationary Distribution",
        xlab = "State (x + y)",
        ylab = "Probability",
        legend.text = c("pi", "q50"))

##4B simulation
a <- 0.49
MaxGen <- 200
NumTrials <- 1000
ExtinctionCount <- 0


set.seed(123)
for (i in 1:NumTrials) {
  X <- 1 
  
  for (gen in 1:MaxGen) {
    if (X == 0) {
      ExtinctionCount <- ExtinctionCount + 1
      break 
    }
    
    Zn <- rbinom(1, size = X, prob = 1 - a)
    X <- 2 * Zn
  }
}


ProbExtinction <- ExtinctionCount / NumTrials

ProbExtinction
