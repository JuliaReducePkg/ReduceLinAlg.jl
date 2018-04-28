__precompile__()
module ReduceLinAlg
importall Reduce
using Compat
import Compat.String

#   This file is part of ReduceLinAlg.jl. It is licensed under the MIT license
#   Copyright (C) 2018 Michael Reed

const VectorAny = Union{Vector,RowVector}
import Reduce: parse_calculus, treecombine!, irr

const lin = [
    :hessian,
    :mat_jacobian
]

:(export $(lin...)) |> eval

for fun in lin
    @eval begin
        $(Reduce.parsegen(fun,:calculus))
        $(Reduce.unfoldgen(fun,:calculus))
    end
end

for fun in lin
    @eval begin
        function $fun(expr::Compat.String,s...;be=0)
            convert(Compat.String, $fun(RExpr(expr),s...;be=be))
        end
    end
end

hessian(r::Reduce.ExprSymbol,l::T) where T <: VectorAny  = hessian(r,list(l))

function mat_jacobian(r::T,v::S) where T <: VectorAny where S <: VectorAny
    mat_jacobian(list(r),list(v)) |> parse
end

jacobian = mat_jacobian

function __init__()
    load_package(:linalg)
end

end # module
