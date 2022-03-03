"""
    applyBC(f::AbstractMatrix, BCtype::String) -> matrix{<:Real}

This routine apply different types of BC to a given matrix f.
The solution is returned as a matrix the same size as `f`.
"""
function applyBC(f::AbstractMatrix, BCtype::String)

    Nx = size(f,2)
    Ny = size(f,1)
    
    if BCtype == "no-slip"
        f[1,:] .= 0
        f[:,1] .= 0
        f[Ny,:] .= 0
        f[:,Nx] .= 0
    elseif BCtype == "periodic"
        f[1,:] = f[Ny-1,:]  
        f[:,1] = f[:,Nx-1]
        f[Ny,:] = f[2,:]
        f[:,Nx] = f[:,2]
    end
    
    return f 
end