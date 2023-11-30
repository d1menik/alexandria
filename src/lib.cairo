// declares the file as StarkNet contract
%lang starknet

from starkware.cairo.common.math import assert_nn
from starkware.cairo.common.cairo_builtins import HashBuiltin

// define a storage variable. We can use: balance.read() & balance.write() that are 
// available with the @storage_var decorator.
@storage_var
func balance() -> (res: felt) {
}

// external functions can be called by users of StarkNet and by other contracts
// func to increase the balance of a given account 
@external
func increase_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
  amount: felt
) {
  with_attr error_message("Amount must be positive. Got: {amount}.") {
      assert_nn(amount);
  }

  let (res) = balance.read();
  balance.write(res + amount);
  return ();
}

// view functions queries the state but can not modify. 
// reads the balance and returns the value  
@view
func get_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: 
felt) {
  let (res) = balance.read();
  return (res,);
}

// constructor is used to initialize the state 
// the constructor only runs once at contract deployment. It cannot be called again  
@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
  balance.write(0);
  return ();
};

