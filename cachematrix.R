## Manni Truong, WoodMac 2015

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        
        x <<- y
        m <<- NULL
        
    }
    get <- function() x # just returns the matrix
    
    hello <- function() print("Hello world.")
    
    list(set = set, get = get, hello = hello)
    

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
