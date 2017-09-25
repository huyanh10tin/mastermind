require_relative 'color'
class Artificial
	include Color
	def initialize
	end
	def generate_turn
		arr = []
		0.upto(3) do |element|
			arr.push(Color::CON.sample)
		end
		arr
	end
	def get_result
		
	end
end