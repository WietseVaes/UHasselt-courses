#Oef2
#create transition 3x3 transition matrix
T1 = matrix(1/3,nrow = 4, ncol = 4) - diag(4)/3
T2 = matrix(0,nrow = 6, ncol = 6)
for (i in 1:6) {
  T2[i,1:i] <- 1/i
}

sample_mc  <-   function ( T ,  E_1 ,  n )   {
  trajectory  =   c ()
  E_n  =  E_1
  for   ( i  in   1 : n )   {
    #get the row of T that corresponds to state E_n
    pmf  =   T [ E_n ,]
    #sample from the pmf
    E_n  =   sample ( x = 1 : nrow ( T ), prob = pmf ,  size = 1 )
    #append the result to the return vector
    trajectory  =   c ( trajectory ,  E_n )
  }
  return   ( trajectory )
}
sample_mc(T1, E_1=1,n = 16)
sample_mc(T2, E_1=6,n = 16)

