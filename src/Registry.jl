module Registry

import ..Pkg, ..Types
using Pkg: depots
using ..Types: RegistrySpec

"""
    Pkg.Registry.add(url::String, path::String=DEPOT_PATH[1])
    Pkg.Registry.add(registry::RegistrySpec, path::String=DEPOT_PATH[1])

Add a new registry by cloning from `url`.
"""
function add end
add(url::String, depot::String = depots()[1]) = add(RegistrySpec(url=url), depot)
add(registry::RegistrySpec, depot::String = depots()[1]) =
    Types.clone_registry(registry, depot)

"""
    Pkg.Registry.rm(registry::String)
    Pkg.Registry.rm(registry::RegistrySpec)

Remove registry.
"""
function rm end
rm(registry::String) = rm(RegistrySpec(name = registry))
rm(registry::RegistrySpec) = Types.remove_registry(registry)

"""
    Pkg.Registry.up(registry::RegistrySpec)
    Pkg.Registry.up(registry::Vector{RegistrySpec})

Update registries.
"""
up(regs=registries()) = Pkg.API.update_registries(regs)


end # module
