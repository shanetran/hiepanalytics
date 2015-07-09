class Sale < ActiveRecord::Base
  def self.search_day_ranger(from_d, to_d)
    where(sale_day: DateTime.parse(from_d).. DateTime.parse(to_d))
  end
end
