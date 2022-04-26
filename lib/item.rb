class Item

attr_reader :name, :price
    def initialize(attributes)
        @name = attributes[:name]
        @price_string = attributes[:price]
    end

    def price
        @price_string.gsub("$", "").to_f
    end
end