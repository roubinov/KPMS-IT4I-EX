source("flexiblas_setup.r")

x = matrix(rnorm(1e7), nrow = 1e4)
beta = rep(1, ncol(x))
err = rnorm(nrow(x))
y = x %*% beta + err
data = as.data.frame(cbind(y, x))
names(data) = c("y", paste0("x", 1:ncol(x)))

## lm --------------------------------------
setback("NETLIB", "lm")
system.time((lm.yx = lm(y ~ ., data)))

setback("OPENBLAS", "lm")
for(i in 0:3) {
  setthreads(2^i, "lm")
  print(system.time((lm.yx = lm(y ~ ., data))))
}

## qr --------------------------------------
setback("NETLIB", "qr")
system.time((qr.x = qr(x)))

setback("OPENBLAS")
for(i in 0:3) {
  setthreads(2^i, "qr")
  print(system.time((qr.x = qr(x))))
}
for(i in 0:7) {
  setthreads(2^i, "qr", LAPACK = TRUE)
  print(system.time((qr.x = qr(x))))
}
for(i in 0:7) {
  setthreads(2^i, "lm")
  print(system.time((lm.yx = lm(y ~ ., data, LAPACK = TRUE))))
}

## prcomp --------------------------------------
setback("NETLIB", "prcomp")
system.time((prc.x = prcomp(x)))

setback("OPENBLAS")
for(i in 0:7) {
  setthreads(2^i, "prcomp")
  print(system.time((prc.x = prcomp(x))))
}

## princomp --------------------------------------
setback("NETLIB", "prcomp")
system.time((prc.x = prcomp(x)))

setback("OPENBLAS")
for(i in 0:7) {
  setthreads(2^i, "princomp")
  print(system.time((prc.x = princomp(x))))
}
