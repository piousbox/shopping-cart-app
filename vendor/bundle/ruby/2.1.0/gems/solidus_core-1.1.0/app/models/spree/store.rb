module Spree
  class Store < Spree::Base
    has_many :store_payment_methods, inverse_of: :store
    has_many :payment_methods, through: :store_payment_methods

    validates :code, presence: true, uniqueness: { allow_blank: true }
    validates :name, presence: true
    validates :url, presence: true
    validates :mail_from_address, presence: true

    before_save :ensure_default_exists_and_is_unique
    before_destroy :validate_not_default

    scope :by_url, lambda { |url| where("url like ?", "%#{url}%") }

    def self.current(store_key = nil)
      current_store = Store.find_by(code: store_key) || Store.by_url(store_key).first
      current_store || Store.default
    end

    def self.default
      where(default: true).first || new
    end

    private

    def ensure_default_exists_and_is_unique
      if default
        Store.where.not(id: id).update_all(default: false)
      elsif Store.where(default: true).count == 0
        self.default = true
      end
    end

    def validate_not_default
      if default
        errors.add(:base, :cannot_destroy_default_store)
      end
    end
  end
end
