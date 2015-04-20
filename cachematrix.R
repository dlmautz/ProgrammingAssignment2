## Matrix Caching Functions for Coursera R Programming - Assignment 2
## Daniel Mautz - April 2015

## makeCacheMatrix:
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  xInv <- NULL
  set <- function(y) {
    x <<- y
    xInv <<- NULL
  }
  get <- function() x
  setInv <- function(inv) xInv <<- inv
  getInv <- function() xInv
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}

## cacheSolve:
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should
## retrieve the inverse from the cache.

cacheSolve <- function(x = matrix()) {
  xInv <- x$getInv()
  if(!is.null(xInv)) {
    message("getting cached data")
    return(xInv)
  }
  xInv <- solve(x$get())
  x$setInv(xInv)
  xInv
}

## makeRandomSquareMatrix:
## Creates a square matrix with size based on sole argument, to be used when testing
## makeCacheMatrix and cacheSolve functions above.

makeRandomSquareMatrix <- function(n=3) {
  if(n>10) n<-10
  repeat {
    x <- matrix(sample(1:100, n^2, replace=TRUE),nrow=n,ncol=n)
    if(det(x)!=0) break
  }
  x
}