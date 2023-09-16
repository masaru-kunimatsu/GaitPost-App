class PostNeuron < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :post
  belongs_to_active_hash :neuron

end
