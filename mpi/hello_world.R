suppressMessages(library(pbdMPI))

msg = paste("Hello World! rank", comm.rank(), "out of", comm.size())
cat(msg, "\n")

finalize()
