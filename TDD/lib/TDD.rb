# require 'byebug'
class Array
  def my_uniq
    uniqs = []
    self.each do |el|
      uniqs << el unless uniqs.include?(el)
    end
    uniqs
  end

  def two_sum
    arr = []
    (self.length - 1).times do |i1|
      i2 = i1 + 1
      while i2 < self.length
        arr << [i1, i2] if self[i1] + self[i2] == 0
        i2 += 1
      end
    end
    arr
  end

  def my_transpose

    dup = []
    self.each do |row|
      dup << row.dup
    end

    transposed = Array.new(dup.count) { [] }

    self.each.with_index do |row, row_idx|
      row.each_index do |col_idx|
        transposed[row_idx][col_idx] = self[col_idx][row_idx]
      end
    end

    transposed
  end
end


def stock_picker(prices)
  best_profit = 0
  best_days = nil
  (prices.length - 1).times do |day|
    idx2 = day + 1
    while idx2 < prices.length
      profit = (prices[idx2] - prices[day])
      if profit > best_profit
        best_profit = profit
        best_days = [day, idx2]
      end
      idx2 += 1
    end
  end
  best_days
end
