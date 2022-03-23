dir = "/scratch/project/dd-21-42/data/MNIST/"
mnist = "http://yann.lecun.com/exdb/mnist/"
dir.create(dir, recursive = TRUE)
  
library(curl)
curl_download(paste0(mnist, "train-images-idx3-ubyte.gz"), dir)
curl_download(paste0(mnist, "train-labels-idx1-ubyte.gz"), dir)
curl_download(paste0(mnist, "t10k-images-idx3-ubyte.gz"), dir)
curl_download(paste0(mnist, "t10k-labels-idx1-ubyte.gz"), dir)

