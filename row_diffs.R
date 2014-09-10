# How to create diffs between adjacent rows (with a group)
require(plyr)

dfx <- data.frame(
  group = c(rep('A', 3), rep('B', 1), rep('C', 3)),
  age = c(4, 7, 8, 4, 3, 9, 1)
)
dfx

calcDiffs <- function(values) {
  diffs <- diff(values)
  # diff returns vector of length n - 1 --> prepend 0 for first row
  append(0, diffs) 
}

# within each group, calculate age-diffs between rows
diffs <- ddply(dfx, .(group), summarize, diff = calcDiffs(age))
diffs