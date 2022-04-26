class Event

attr_reader :name, :food_trucks
    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(truck)
        @food_trucks << truck
    end

    def food_truck_names
        @food_trucks.map { |truck| truck.name }
    end

    def food_trucks_that_sell(item)
        @food_trucks.find_all { |truck| truck.inventory.include?(item) }
    end

    def inventory_helper
        @food_trucks.flat_map { |truck| truck.inventory.keys }.uniq
    end
    
    def sorted_item_list
        inventory_helper.sort_by { |item| item.name }#.uniq
        # require 'pry'; binding.pry
    end

    def overstocked_items #hard stuck, moving onto total inventory and then coming back 
      @food_trucks.flat_map { |truck| truck.inventory.find_all { |item, quantity| return item if quantity >= 50 && food_trucks_that_sell(item).count > 1}}.flatten

        # require 'pry'; binding.pry
    end

    def total_inventory
        total = {}
        inventory_helper.each do |item|
            sum = food_trucks.sum do |truck|
                if truck.inventory.keys.include?(item)
                    truck.inventory[item]
                else
                    0
                end
            end
        total[item] = {quantity: sum, food_trucks: food_trucks_that_sell(item)}
        end
        total
        # require 'pry';binding.pry
    end
end