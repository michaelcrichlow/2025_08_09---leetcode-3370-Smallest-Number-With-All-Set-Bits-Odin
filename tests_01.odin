package test

import "core:fmt"
import p_int "python_int_functions"
print :: fmt.println

main :: proc() {
    print(smallest_number_01(5))
    print(smallest_number_01(10))
    print(smallest_number_01(3))

    // OUTPUT:
    // 7
    // 15
    // 3
}

// simple, 'first way I thought of' solution
// Average Time in Debug Build:      246 ns
// Average Time in Optimized Build:  61 ns
smallest_number_00 :: proc(n: int) -> int {
    _n := n
    for (!p_int.has_all_bits_set(_n)) {
        _n += 1
    }
    return _n
}


// better, more efficient solution
// Average Time in Debug Build:      86 ns
// Average Time in Optimized Build:  21 ns
smallest_number_01 :: proc(n: int) -> int {
    if n <= 0 {
        return 0
    }

    // If already has all bits set, return it
    if (n + 1) & n == 0 {
        return n
    }

    // Find next power of 2
    next_pow := 1
    for (next_pow <= n) {
        next_pow <<= 1
    }

    return next_pow - 1
}
