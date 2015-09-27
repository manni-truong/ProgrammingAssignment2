## Manni Truong, WoodMac 2015

## Put comments here that give an overall description of what your
## functions do


## makeCacheMatrix is effectively an extension of the matrix object in R. It provides
## a cache functionality to avoid doing a calcuation that already has been done. In 
## particular the inverse of a matrix is being cached.
## To initialise a new object a matrix is passed in. The object has 4 functions (get, set,
## getinverse, setinverse) that are exposed via a list mapping that maps the function   
## name to the function. 
## The functions can be accessed via the $ notation. 

## Example use:
# m <- matrix(rnorm(4), nrow = 2, ncol = 2) # creates new 2x2 matrix
# mat <- makeCacheMatrix(m) # create new makeCacheMatrix
# mat$get() # will return m matrix

makeCacheMatrix <- function(x = matrix()) {
    
    i <- NULL # i for inverse
    set <- function(y) { # y is input of set function
        
        x <<- y     # <<- assignment makes sure that x is replaced with y outside the scope of set function
        i <<- NULL  # restores i back to null since we were passed a new matrix
        
    }
    get <- function() x # just returns the matrix argument
    
    hello <- function() print("Hello world.")
    
    setinverse <- function(inverse) i <<- inverse # stores given inverse to i variable, does not calculate inverse matrix
    getinverse <- function() i # simply returns i
    
    list(set = set, get = get, 
         setinverse = setinverse, getinverse = getinverse) # store functions so they can be accessed later via "$" 
    

}


## cacheSolve is an extension of R's solve function. Similarly to solve the function
## retuns the inverse of a matrix. However rather than taking a matrix object, it needs
## a makeCacheMatrix object (see above for implementation). When a makeCacheMatrix is passed
## in, cacheSolve checks whether the inverse has already been calculated. If it has, 
## the cached inverse is being returned. Else it will be calculated and cached.

## Exmple use:
# cacheSolve(mat) # mat is a makeCacheMatrix object

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getinverse() # get the inverse of matrix
    if(!is.null(m)) {   # if this matrix exists simply return it
        
        message("getting cached inverse matrix")
        return(m)
        
    }
    
    # else we need to compute and set it 
    data <- x$get() # get matrix to be inversed
    inverse <- solve(data) # compute the inverse of given matrix
    x$setinverse(inverse)
    inverse
    
}
