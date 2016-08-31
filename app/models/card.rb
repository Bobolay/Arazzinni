class Card < ActiveRecord::Base
  attr_accessible *attribute_names

  boolean_scope :published

  def self.generate_cards(count = 1)
    categories = 10.times.map{|i| "category-#{i+1}" }
    last_card_id = last.try(:id) || 0
    self.bulk_insert do |worker|
      count.times do |i|
        worker.add(category: categories.sample, name: "name-#{last_card_id + i + 1}")
      end

      worker.save!
    end

  end
end
