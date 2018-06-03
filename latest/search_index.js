var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "User\'s Manual",
    "title": "User\'s Manual",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#ReduceLinAlg.jl-1",
    "page": "User\'s Manual",
    "title": "ReduceLinAlg.jl",
    "category": "section",
    "text": "LINALG: Linear algebra package A selection of functions that are useful in the world of linear algebraThis Julia package relies on the Reduce.jl parser generator, Julia docs (stable / latest).Meta-package ReduceAlgebra.jl, upstream docs (LINALG / pdf), Julia docs (stable / latest)"
},

{
    "location": "index.html#.37-LINALG:-Linear-algebra-package-1",
    "page": "User\'s Manual",
    "title": "16.37 LINALG: Linear algebra package",
    "category": "section",
    "text": "This package provides a selection of functions that are useful in the world of linear algebra.Author: Matt Rebbeck."
},

{
    "location": "index.html#.37.1-Introduction-1",
    "page": "User\'s Manual",
    "title": "16.37.1 Introduction",
    "category": "section",
    "text": "This package provides a selection of functions that are useful in the world of linear algebra. These functions are described alphabetically in subsection 16.37.3 and are labelled 16.37.3.1 to 16.37.3.53. They can be classified into four sections(n.b: the numbers after the dots signify the function label in section 16.37.3).Contributions to this package have been made by Walter Tietze (ZIB). "
},

{
    "location": "index.html#ReduceLinAlg.hessian",
    "page": "User\'s Manual",
    "title": "ReduceLinAlg.hessian",
    "category": "function",
    "text": "hessian(expr,var_list::Vector)\n\nComputes the Hessian matrix of expr with respect to the variables in var_list.\n\nThis is an n×n matrix where n is the number of variables and the (i,j)th entry is df(expr,var_list[i],var_list[j]).\n\n\n\n"
},

{
    "location": "index.html#ReduceLinAlg.mat_jacobian",
    "page": "User\'s Manual",
    "title": "ReduceLinAlg.mat_jacobian",
    "category": "function",
    "text": "mat_jacobian(expr_list::Vector,var_list::Vector)\n\nComputes the Jacobian matrix of expr_list with respect to var_list.\n\nThis is a matrix whose (i,j)th entry is df(expr_list[i],var_list[j]). The matrix is n×m where n is the number of variables and m is the number of expressions.\n\n\n\n"
},

{
    "location": "index.html#ReduceLinAlg.jordan_block",
    "page": "User\'s Manual",
    "title": "ReduceLinAlg.jordan_block",
    "category": "function",
    "text": "jordan_block(expr,square_size::Integer)\n\nComputes the square Jordan block matrix J of dimension square_size.\n\nThe entries of J are J[i,i] = expr for i = 1,...,n, J[i,i+1] = 1 for i = 1,...,n-1, and all other entries are 0.\n\n\n\n"
},

{
    "location": "index.html#Library-1",
    "page": "User\'s Manual",
    "title": "Library",
    "category": "section",
    "text": "ReduceLinAlg.hessian\nReduceLinAlg.mat_jacobian\nReduceLinAlg.jordan_block"
},

]}
