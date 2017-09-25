class MasterMind
	attr_accessor :name
	attr_accessor :color
	attr_accessor :code
	attr_reader :colors
	def initialize(name)
		@colors = ["red", "orange", "yellow", 
							"green", "blue", "white"]
		@name = name
		@color = []
		@code = []
	end
	def generateColor
		0.upto(3) do |each|
			@code.push(@colors.sample)
		end
		puts "Code generated is #{@code.to_s}"
	end
	def makeCodeManual
		puts "Please type code to set up codemaker:  "
		code = getInput
		@code = code
	end
	def AIPlay(a)
		View.intro
		i = 1
		win = false
		while (i <= 12)||(win)
			puts "The time #{i} guess : "
			play = a.generate_turn
			print play
			puts ""
			# print play
			win = process(play)
			if win
				puts "breaker is winner !"
				break
			end
			i += 1
		end
		puts "code marker is winner !" if i == 13
	end
	def playerPlay
		View.intro
		i = 1
		win = false
		while (i <= 12)||(win)
			puts "The time #{i} guess : "
			play = getInput
			# print play
			win = process(play)
			if win
				puts "breaker is winner !"
				break
			end
			i += 1
		end
		puts "code marker is winner !" if i == 13
	end
	def process(arr)
		i1 = 0
		position = []
		0.upto(3) do |each|
			if @code[each] == arr[each]
				i1 += 1
				position.push(each)
			end
		end
		# color left
		tempcode = []
		# left color
		leftcolor = []
		@code.each_with_index do |element, index|
			tempcode.push(element) unless position.include? index
		end
		arr.each_with_index do |element, index|
			leftcolor.push(element) unless position.include? index
		end
		return true if i1 == 4
		puts "color right position #{i1}"
		i3 = 0
		0.upto(leftcolor.length - 1) do |each|
			i3 += 1 unless tempcode.include? leftcolor[each]
		end
		puts "right color but wrong position #{4 - i1 - i3}"
		puts "wrong color #{i3}"
		# pass result to the ai
		# i1, i2, i3
		puts "================"
		false
	end
	def getInput
		check, arr = View.checkInput
		until (check && arr.length == 4)
			puts "please retype input: "
			check, arr = View.checkInput
		end
		arr
	end
end