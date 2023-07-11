-- https://luajit.org/ext_ffi_tutorial.html
local ffi = require("ffi")

-- https://github.com/neovim/neovim/blob/19fb573ad992b6f658b58159314eeea0c2f30953/src/nvim/highlight_group.c#L3025
ffi.cdef([[
  int get_magenta(void);
  char *hello_world(void);
]])

local c_lib = ffi.load("./main.so")
local rs_lib = ffi.load("./target/release/libnvim_ffi.dylib")

print("-- Hello World")
print("C:", ffi.string(c_lib.hello_world()))
print("Rust:", ffi.string(rs_lib.hello_world()))

print("-- Magenta")
print("Lua:", vim.api.nvim_get_color_by_name("Magenta"))
print("C:", c_lib.get_magenta())
print("Rust:", rs_lib.get_magenta())
