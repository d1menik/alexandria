struct Storage {

   name: felt,

   symbol: felt,

   decimals: u8,

   total_supply: u256,

   balances: LegacyMap::<felt, u256>,

   allowances: LegacyMap::<(felt, felt), u256>,

}

