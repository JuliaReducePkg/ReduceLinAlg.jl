__precompile__()
module ReduceLinAlg
importall Reduce
using Compat
import Compat.String

#   This file is part of ReduceLinAlg.jl. It is licensed under the MIT license
#   Copyright (C) 2018 Michael Reed

const lin = [
    :hessian,
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

hessian(r::Reduce.ExprSymbol,l::T) where T <: Union{Vector,RowVector} = hessian(r,list(l))

function __init__()
    load_package(:linalg)
end

end # module
