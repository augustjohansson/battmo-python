module BattMoPythonCallExt

using BattMo
using PythonCall: PythonCall, pyconvert, Py

"""
    make_invokable(func::Py)

Wrap a Python callable `func` so that it can be called from Julia. The return
value is automatically converted to a Julia `Real` via `pyconvert`.
"""
function BattMo.make_invokable(func::Py)
    return (args...) -> pyconvert(Real, func(args...))
end

"""
    InputParams(py_dict::Py)

Construct a `BattMo.InputParams` from a Python dictionary. The dictionary is
recursively converted to a Julia `Dict{String, Any}`.
"""
function BattMo.InputParams(py_dict::Py)
    return BattMo.InputParams(pyconvert(Dict{String, Any}, py_dict))
end

end # module BattMoPythonCallExt
