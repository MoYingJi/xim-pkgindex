package = {
    -- base info
    name = "cmake",
    description = "A Powerful Software Build System",

    maintainers = "Kitware",
    licenses = "BSD-3Clause",
    repo = "https://github.com/Kitware/CMake",
    contributors = "https://github.com/Kitware/CMake/blob/master/CONTRIBUTORS.rst",
    docs = "https://cmake.org/documentation",

    -- xim pkg info
    type = "package",
    archs = {"x86_64", "arm64"},
    status = "stable", -- dev, stable, deprecated
    categories = {"build", "system", "cmake"},
    keywords = {"build", "system", "cmake", "make", "generator", "cross-platform"},

    -- xvm: xlings version management
    xvm_enable = true,

    xpm = {
        linux = {
            ["latest"] = { ref = "4.0.2" },
            ["4.0.2"] = "XLINGS_RES",
        },
        macosx = {
            ["latest"] = { ref = "4.0.2" },
            ["4.0.2"] = "XLINGS_RES",
        },
        windows = {
            ["latest"] = { ref = "4.0.2" },
            ["4.0.2"] = "XLINGS_RES",
        },
    },
}

import("xim.libxpkg.pkginfo")
import("xim.libxpkg.xvm")

function install()
    os.tryrm(pkginfo.install_dir())
    local cmakedir = pkginfo.install_file()
        :replace(".zip", "")
        :replace(".tar.gz", "")
    os.mv(cmakedir, pkginfo.install_dir())
    return true
end

function config()
    xvm.add("cmake", { bindir = path.join(pkginfo.install_dir(), "bin") })
    return true
end

function uninstall()
    xvm.remove("cmake")
    return true
end