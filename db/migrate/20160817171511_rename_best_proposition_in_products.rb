class RenameBestPropositionInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :best_proposition, :best_offer
  end
end
