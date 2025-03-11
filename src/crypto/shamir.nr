pub fn combine_shares(shares: Vec<(Field, Field)>) -> Field {
    // Reconstruct secret from shares
    let k = shares.len();
    let mut result = 0;
    for i in 0..k {
        let xi = shares.get(i).0;
        let yi = shares.get(i).1;
        let mut numerator = 1;
        let mut denominator = 1;
        for j in 0..k {
            if i == j {} else {
                let xj = shares.get(j).0;
                numerator *= -xj;
                denominator *= xi - xj;
            }
        }
        result += yi * numerator / denominator;
    }
    result
}
