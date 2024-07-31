target("Jolt")
set_toolchains("clang-cl")
_config_project({
    project_kind = "shared"
})
add_defines("JPH_SHARED_LIBRARY", {
    public = true
})
add_defines("JPH_BUILD_SHARED_LIBRARY")
add_includedirs("..", {
    public = true
})
add_files("**.cpp")
target_end()
