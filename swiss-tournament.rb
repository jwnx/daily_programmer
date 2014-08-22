class Player

	attr_accessor :name, :points

	@@against = Array.new

	def initialize(name)
		@name = name
	end

	def add(a)
		@@against << a
	end
end


def match(a, b)

	a.add(b) 
	b.add(a) 

	a_bonus = rand(-5..5)
	b_bonus = rand(-5..5)

	a_win = rand(0..100)
	b_win = rand(0..100)

	if a_win > b_win
		a.points = 15 + a_bonus
		b.points = 5 + b_bonus
	elsif a_win == b_win
		a.points = 10 + a_bonus
		b.points = 10 + b_bonus
	else 
		b.points = 15 + a_bonus
		a.points = 5 + b_bonus
	end 

	puts a.points+a_bonus, b.points+b_bonus

end

dict = { Player("Jane") => 0, Player("Doe") => 1, Player("Rita Baiana") => 2,
			Player("Firmo") => 3, Player("Henrique") => 4, Player("Miranda") => 5,
				Player("Estela") => 6, Player("Alexandre") => 7, Player("Bruxa") => 8,
					Player("Nenem") => 9)}


def partnership(dict)

	partners = []

	dict.each do |p|

		# Fazer um método que itere entre todos os players
		# e retorne os arrays das pessoas com quem já jogaram
		# Faz-se, então, uma comparação com o dict[player]
		# e retornam só os que não jogaram ainda com ele.

		(0..dict.length).each do |n|
			while 




