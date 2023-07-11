use std::ffi::CString;

use libc::{c_char, c_int};

extern "C" {
    fn name_to_color(name: *const c_char, idx: *mut c_int) -> c_int;
}

#[no_mangle]
pub extern "C" fn get_magenta() -> i32 {
    let mut dummy: c_int = 0;
    let ref_dummy = std::ptr::addr_of_mut!(dummy);
    let color = CString::new("Magenta").unwrap().into_raw();

    unsafe { name_to_color(color, ref_dummy) }
}

#[no_mangle]
pub extern "C" fn hello_world() -> *mut c_char {
    CString::new("Hello from Rust!").unwrap().into_raw()
}
