package = {
    homepage = "https://pnpm.io",
    name = "pnpm",
    description = "Fast, disk space efficient package manager",
    licenses = "MIT",
    repo = "https://github.com/pnpm/pnpm",
    docs = "https://pnpm.io/motivation",

    -- xim pkg info
    archs = {"x86_64"},
    status = "stable", -- dev, stable, deprecated
    categories = {"package-manager", "typescript"},

    xpm = {
        windows = {
            deps = { "nodejs@22.12.0" },
            ["latest"] = { ref = "9.15.0"},
            ["9.15.0"] = { },
        },
        ubuntu = {
            deps = { "nodejs@22.12.0" },
            ["latest"] = { ref = "9.15.0"},
            ["9.15.0"] = { },
        },
        debian = { ref = "ubuntu" },
        archlinux = { ref = "ubuntu" },
    },
}

import("xim.base.runtime")

local pkginfo = runtime.get_pkginfo()

function installed()
    return os.iorun("xvm list pnpm")
end

function install()
    local pnpm_installcmd_template = "npm install -g pnpm@%s --prefix %s"
    os.iorun(string.format(pnpm_installcmd_template, pkginfo.version, pkginfo.install_dir))
    return true
end

function config()
    print("config xvm...")
    local xvm_pnpm_template = "xvm add pnpm %s --path %s/bin"
    os.exec(string.format(xvm_pnpm_template, pkginfo.version, pkginfo.install_dir))
    return true
end

function uninstall()
    os.exec("xvm remove pnpm " .. pkginfo.version)
    return true
end