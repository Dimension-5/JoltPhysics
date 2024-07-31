set_xmakever('2.9.4')
add_rules('mode.release', 'mode.debug')
set_policy('build.ccache', not is_plat('windows'))
if is_mode("debug") then
    set_targetdir(path.absolute('bin/', os.projectdir()))
else
    set_targetdir(path.absolute('bin/release', os.projectdir()))
end

option("_check_env")
set_showmenu(false)
set_default(false)
after_check(function(option)
    if not is_arch("x64", "x86_64", "arm64") then
        option:set_value(false)
        utils.error("Illegal environment. Please check your compiler, architecture or platform.")
        return
    end
    if not (is_mode("debug") or is_mode("release") or is_mode("releasedbg")) then
        option:set_value(false)
        utils.error("Illegal mode. set mode to 'release', 'debug' or 'releasedbg'.")
        return
    end
    option:set_value(true)
end)
option_end()

if get_config('_check_env') then
    includes("xmake/xmake_func.lua", "Jolt")
end