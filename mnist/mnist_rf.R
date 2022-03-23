dir = "/scratch/project/dd-21-42/data/mnist/"
## Data from:
## https://www.kaggle.com/benedictwilkinsai/mnist-hd5f0
## There is also a csv version
## https://www.kaggle.com/oddrationale/mnist-in-csv
## Requires kaggle log on
## 
library(rhdf5)
h5tr = H5Fopen(paste0(dir, "train.hdf5"))
train = as.double(h5tr$image)
dim(train) = c(28*28, 60000)
train = as.data.frame(t(train))
label = factor(as.character(h5tr$label))

h5ts = H5Fopen(paste0(dir, "test.hdf5"))
test = as.double(h5ts$image)
dim(test) = c(28*28, 10000)
test = as.data.frame(t(test))
label = factor(as.character(h5ts$label))

library(parallel)
library(randomForest)
set.seed(seed = 123, "L'Ecuyer-CMRG")

n = nrow(train)
n_test = nrow(test)

nc = as.numeric(commandArgs(TRUE)[2])
ntree = lapply(splitIndices(512, nc), length)
rf = function(x, train, label) randomForest(train, y = label, ntree=x, nodesize = 200,
                              norm.votes = FALSE)
rf.out = mclapply(ntree, rf, train = train, label = label, mc.cores = nc)
rf.all = do.call(combine, rf.out)

crows = splitIndices(nrow(test), nc) 
rfp = function(x) as.vector(predict(rf.all, test[x, ])) 
cpred = mclapply(crows, rfp, test = test, mc.cores = nc) 
pred = do.call(c, cpred) 

correct <- sum(pred == test$lettr)
cat("Proportion Correct:", correct/(n_test), "\n")
