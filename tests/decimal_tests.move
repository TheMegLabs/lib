#[test_only]
module lib::decimal_tests;

use lib::decimal::{
    add,
    ceil,
    div,
    floor,
    from,
    from_percent,
    from_u128,
    ge,
    gt,
    le,
    lt,
    mul,
    pow,
    saturating_floor,
    saturating_sub,
    sub
};

#[test]
fun test_basic() {
    let a = from(1);
    let b = from(2);

    assert!(add(a, b) == from(3), 0);
    assert!(sub(b, a) == from(1), 0);
    assert!(mul(a, b) == from(2), 0);
    assert!(div(b, a) == from(2), 0);
    assert!(floor(from_percent(150)) == 1, 0);
    assert!(ceil(from_percent(150)) == 2, 0);
    assert!(lt(a, b), 0);
    assert!(gt(b, a), 0);
    assert!(le(a, b), 0);
    assert!(ge(b, a), 0);
    assert!(saturating_sub(a, b) == from(0), 0);
    assert!(saturating_sub(b, a) == from(1), 0);
    assert!(saturating_floor(from(18446744073709551615)) == 18446744073709551615, 0);
    assert!(saturating_floor(add(from(18446744073709551615), from(1))) == 18446744073709551615, 0);
    assert!(
        from_u128(340282366920938463463374607431768211455).add(from(1)).to_scaled_val() == 340282366920938463463374607431768211456 * 1000000000000000000,
        0,
    );
}

#[test]
fun test_pow() {
    assert!(pow(from(5), 4) == from(625), 0);
    assert!(pow(from(3), 0) == from(1), 0);
    assert!(pow(from(3), 1) == from(3), 0);
    assert!(pow(from(3), 7) == from(2187), 0);
    assert!(pow(from(3), 8) == from(6561), 0);
}
