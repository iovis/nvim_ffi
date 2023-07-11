default: build

build:
    clang -o main.so main.c -std=c11 -shared -fPIC -Wl,-undefined -Wl,dynamic_lookup
    cargo build --release
