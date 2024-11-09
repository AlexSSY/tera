class Wallet < ApplicationRecord
  validates_uniqueness_of :seed_phrase

  normalizes :seed_phrase, with: ->(seed_phrase) { seed_phrase.strip.downcase }

  before_create :generate_seed_phrase

  private

  def generate_seed_phrase
    self.seed_phrase = `node lib/assets/mnemonic.js`
  end
end
