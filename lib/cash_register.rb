
class CashRegister
  attr_accessor :applying_discount, :discount, :items, :last_transactions
  attr_writer :total

  def initialize(val = 0)
    @discount = val
    @total = 0
    @items = []
    self.apply_discount
    @last_transactions = []
  end

  def total
    @total - @applying_discount
  end

  def add_item(item, val, qte = 1)
    qte.times do
      @items << item
      @total += val
      @last_transactions << val
    end
  end

  def apply_discount
    if(@discount == 0)
      "There is no discount to apply."
    else
      @applying_discount = @total*@discount/100
      puts @applying_discount
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    @total -= @last_transactions.last
    @last_transactions.pop
    @items.pop
  end

end
