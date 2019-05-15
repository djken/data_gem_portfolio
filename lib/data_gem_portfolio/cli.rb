class DataGemPortfolio::CLI

  def call
    list_category
    menu
  end

  def list_category
    info_item
    puts "1. Batteries"
    puts "2. Inverters"
    puts "3. Solar System"

    @courses = DataGemPortfolio::Category.today
  end

  def info_item
    puts "Type 1, 2 or 3 to see items, list to see the list or exit."
  end

  def menu
    input = nil
    count_instance = DataGemPortfolio::Category.today.size

    while input != "exit"
      input = gets.strip.downcase

        if input.to_i > 0 && input.to_i <= count_instance
          the_category = @courses[input.to_i - 1]
          separator
          puts "* Item:"
          puts " - #{the_category.name}"

          puts "* Price:"
          puts " - #{the_category.price}"

          puts "* Availability:"
          puts " - #{the_category.availability}"

          puts "* Url:"
          puts " - #{the_category.url}"
          separator
          puts " "

          info_item
        elsif input == "list"
          list_category
        elsif input == "exit"
          thanking
        else
          puts "You type the wrong numberclear. Type 1, 2 or 3 to see items, list to see the list or exit."
        end
      end
    end

  def thanking
    puts "Thank you for visiting our site!!"
  end

  def separator 
    puts "*" * 110
  end
end
