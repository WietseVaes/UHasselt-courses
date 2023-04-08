#Oef.1 
#create transition 3x3 transition matrix
T = matrix ( c ( 0.6 , 0.3 , 0.1 , 0.4 , 0.5 , 0.1 , 0.3 , 0.4 , 0.3 ),  ncol = 3 ,  nrow = 3 ,  byrow = TRUE )
#sample from pmf in R
pmf  =   T [ 2 ,]
x  =   sample ( x = 1 : nrow ( T ), prob = pmf ,  size = 1000 ,  replace = TRUE )
hist ( x )
#function to generate a trajectory of n steps, from an MC,
#with a transition matrix T,
#a start state E_1
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
sample_mc(T, E_1=matrix(c(1 , 0, 0),nrow=3,ncol=1),n = 26)[26]
sample_mc(T, E_1=matrix(c(0 , 0, 1),nrow=3,ncol=1),n = 16)[16]

