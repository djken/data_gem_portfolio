class DataGemPortfolio::CLI

  def call
    list_category
    menu
  end

  def list_category
    info_item
    puts "1. Batteries"
    puts "2. Inverters"

    @courses = DataGemPortfolio::Category.today
  end

  def info_item
    puts "Type 1 or 2 to see items, list to see the list or exit."
  end

  def menu
    input = nil
    count_instance = DataGemPortfolio::Category.today.size

    while input != "exit"
      input = gets.strip.downcase
        if input.to_i > 0 && input.to_i <= count_instance
          the_category = @courses[input.to_i - 1]
          puts "- Item: #{the_category.name}"
          puts "- Price: #{the_category.price}"
          puts " "
          info_item
        elsif input == "list"
          list_category
        elsif input == "exit"
          thanking
        else
          puts "Not sure whay you want. Type 1 or 2 to see items, list to see the list or exit."
        end
      end
    end

  def thanking
    puts "Thank you for visiting our site!!"
  end
end
