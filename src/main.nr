use std::hash::poseidon2::Poseidon2Hasher;
use std::collections::map::HashMap;
use std::hash::BuildHasherDefault;
pub mod crypto;

use crate::crypto::shamir::combine_shares;

global SIZE: u32 = 3;
global SAMPLE_SIZE: u32 = 5;

fn unmask(nid: Field, shares: Vec<(Field, Field)>, active_nids: [Field; SIZE], collected_shares: [(Field, Field); SAMPLE_SIZE]) {
    let mut collected_shares_map: HashMap<Field, Field, 12, BuildHasherDefault<Poseidon2Hasher>> = HashMap::default();
    collected_shares.map(|(nid, share)| {
        collected_shares_map.insert(nid, share);
    });
    combine_shares(shares);

}

fn main(x: Field, y: pub Field, z: [Field; SIZE], collected_shares: [(Field, Field); SAMPLE_SIZE]) {
    assert(x != y);
}

#[test]
fn test_main() {
    main(1, 2, [1, 2, 3], [(1, 2), (2, 3), (3, 4), (4, 5), (5, 6)]);

    // Uncomment to make test fail
    // main(1, 1);
}
