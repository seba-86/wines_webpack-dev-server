class Wine < ApplicationRecord
    has_many :assemblies
    has_many :strains, through: :assemblies, dependent: :destroy
    accepts_nested_attributes_for :assemblies, reject_if: :all_blank, allow_destroy: true

    def name_cepa
        self.strains.pluck(:name)
    end

    
end