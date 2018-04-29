__precompile__()
module ReduceLinAlg
importall Reduce
using Compat
import Compat.String

#   This file is part of ReduceLinAlg.jl. It is licensed under the MIT license
#   Copyright (C) 2018 Michael Reed

const VectorAny = Union{Vector,RowVector}

const lin = [
    :hessian,
    :mat_jacobian,
    :band_matrix,
    :block_matrix,
    :char_matrix,
    :char_poly,
    :diagonal,
    :extend,
    :gram_schmidt,
    :hilbert,
    :jordan_block,
    :kronecker_product,
]

const unr = [
    :cholesky,
    :coeff_matrix,
    :hermitian_tp,
    :symmetricp,
    :toeplitz,
    :triang_adjoint,
    :vandermonde,
]

:(export $([lin;unr]...)) |> eval

for fun in lin
    @eval begin
        $(Reduce.parsegen(fun,:calculus))
        $(Reduce.unfoldgen(fun,:calculus))
        function $fun(expr::Compat.String,s...;be=0)
            convert(Compat.String, $fun(RExpr(expr),s...;be=be))
        end
    end
end

for fun in unr
    @eval begin
        $(Reduce.parsegen(fun,:unary))
        $(Reduce.unfoldgen(fun,:unary))
        function $fun(expr::Compat.String;be=0)
            convert(Compat.String, $fun(RExpr(expr);be=be))
        end
    end
end

const MatExpr = Union{Array{Any,2},Array{Expr,2},Array{Symbol,2},Expr,Symbol}

band_matrix(r::Union{Vector,RowVector,Expr,Symbol},v::Integer) = band_matrix(list(r),v) |> parse
block_matrix(r::Integer,c::Integer,s::VectorAny) = block_matrix(RExpr(r),RExpr(c),list(s)) |> parse

char_matrix(r::Reduce.MatExpr,v::Any) = char_matrix(list(r),RExpr(v)) |> parse
char_poly(r::Reduce.MatExpr,v::Any) = char_matrix(list(r),RExpr(v)) |> parse

extend(a::MatExpr,r::Integer,c::Integer,s) = extend(RExpr(a),r,c,RExpr(s)) |> parse

hessian(r::Reduce.ExprSymbol,l::T) where T <: VectorAny  = hessian(r,list(l))

@doc """
    hessian(expr,var_list::Vector)

Computes the Hessian matrix of `expr` with respect to the variables in `var_list`.

This is an n×n matrix where n is the number of variables and the (i,j)th entry is `df(expr,var_list[i],var_list[j])`.
""" hessian

hilbert(a::Integer,r) = hilbert(RExpr(a),RExpr(r)) |> parse

function mat_jacobian(r::T,v::S) where T <: VectorAny where S <: VectorAny
    mat_jacobian(list(r),list(v)) |> parse
end

@doc """
    mat_jacobian(expr_list::Vector,var_list::Vector)

Computes the Jacobian matrix of `expr_list` with respect to `var_list`.

This is a matrix whose (i,j)th entry is `df(expr_list[i],var_list[j])`. The matrix is n×m where n is the number of variables and m is the number of expressions.
""" mat_jacobian

jacobian = mat_jacobian

jordan_block(r::Any,s::Integer) = jordan_block(RExpr(r),s) |> parse

@doc """
    jordan_block(expr,square_size::Integer)

Computes the square Jordan block matrix `J` of dimension `square_size`.

The entries of `J` are `J[i,i] = expr` for i = 1,...,n, `J[i,i+1] = 1` for i = 1,...,n-1, and all other entries are 0.
""" jordan_block

kronecker_product(a::MatExpr,b::MatExpr) = kronecker(RExpr(a),RExpr(b)) |> parse

cholesky(r::Array{T,2}) where T <: Number = cholesky(RExpr(r)) |> parse |> mat
coeff_matrix(r::VectorAny) = coeff_matrix(list(r)) |> parse
diagonal(r::VectorAny) = diagonal(list(r)) |> parse
gram_shmidt(r::Vector{<:Vector}) = gram_shmidt(list(r)) |> parse
hermitian_tp(r::MatExpr) = hermitian_tp(RExpr(r)) |> parse
symmetricp(r::MatExpr) = symmetricp(RExpr(r)) |> parse
toeplitz(r::VectorAny) = toeplitz(list(r)) |> parse
triang_adjoint(r::MatExpr) = triang_adjoint(RExpr(r)) |> parse
vandermonde(r::VectorAny) = vandermonde(list(r)) |> parse

function __init__()
    load_package(:linalg)
end

end # module
