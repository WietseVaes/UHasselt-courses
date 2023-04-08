Gambler <-function(E_0,E_max,max,p){
  R<-rbinom(max,1,p)
  for (i in 1:max){
    E_0 = E_0 + 1 - 2*R[i]
    if (E_0 == E_max) {
      return("E2")
    }
    if (E_0 == 0) {
      return("E1")
    }
  }
  if (E_0 != E_max) {
    return("E3")
  } else {
    return("E2")
  }
}

N=10000
traject = c()
for (i in 1:N){ 
  traject = c(traject,Gambler(200, 220, 2000,0.35))
}

kans = sum(traject == "E2")/N
kans
