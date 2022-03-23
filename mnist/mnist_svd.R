dir = "/scratch/project/dd-21-42/data/mnist/"
## Data from:
## https://www.kaggle.com/benedictwilkinsai/mnist-hd5f0
## There is also a csv version
## https://www.kaggle.com/oddrationale/mnist-in-csv
## Requires kaggle log on
## 
library(rhdf5)
h5tr = H5Fopen(paste0(dir, "train.hdf5"))
train = as.numeric(h5tr$image)
dim(train) = c(28*28, 60000)
train = as.data.frame(t(train))
label = factor(as.character(h5tr$label))

h5ts = H5Fopen(paste0(dir, "test.hdf5"))
test = as.numeric(h5ts$image)
dim(test) = c(28*28, 10000)
test = as.data.frame(t(test))
label = factor(as.character(h5ts$label))

library(parallel)

s
svdmod = function(num, data, k) {
  
}



correct <- sum(pred == test$lettr)
cat("Proportion Correct:", correct/(n_test), "\n")
