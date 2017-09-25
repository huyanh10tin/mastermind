class View
	def initialize
	end
	def self.checkInput
		colors = ["red", "orange", "yellow", 
							"green", "blue", "white"]
		arr = gets.chomp.split.to_a
		arr.each_with_index{|element,index| arr[index] = element.downcase}
		arr.each do |element|
			return false, [] unless colors.include? element
		end
		return true, arr
	end
	def self.intro
		puts "Please guess color 12 times until right"
	end
	def self.playerInput
		puts "Enter the color"
	end
end