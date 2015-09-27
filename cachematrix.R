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
    
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    
    list(set = set, get = get, 
         setinverse = setinverse, getinverse = getinverse, 
         hello = hello)
    

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getinverse() # get the inverse of matrix
    if(!is.null(m)) {   # if this matrix exists simply return it
        
        message("getting cached inverse matrix")
        return(m)
        
    }
    
    # else we need to compute and set it 
    data <- x$get() # get matrix to be inversed
    inverse <- solve(mymatrix) # compute the inverse of given matrix
    x$setinverse(inverse)
    inverse
    
}
