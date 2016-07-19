class Account
  attr_accessor :name, :balance, :cleared_balance

  protected :cleared_balance

  def initialize(name, balance)
    @name = name
    @balance = balance
    @cleared_balance = balance
  end

  def to_s
    "Account #{@name}, Balance #{@balance} Cleared Balance #{@cleared_balance}"
  end

  def greater_balance_than?(other)
    @cleared_balance > other.cleared_balance
  end
end

class Transaction

  def initialize(account_a, account_b)
    @account_a = account_a
    @account_b = account_b
  end

  private

  def debit(account, amount)
    account.balance -= amount
  end
  
  def credit(account, amount)
    account.balance += amount
  end
  
  public
  
  def transfer(amount)
    debit(@account_a, amount)
    credit(@account_b, amount)
  end

end

savings = Account.new("savings", 100)

checking = Account.new("checking", 200)

puts savings
puts checking

trans = Transaction.new(checking, savings)

trans.transfer(50)

puts savings
puts checking

# This is allowed
savings.balance += 500
puts savings

# This isn't
# trans.credit(savings, 500)

puts savings.greater_balance_than?(checking)

puts savings.cleared_balance
