@row1 = [-1, 0, 0]
@row2 = [-1, 0, 0]
@row3 = [-1, 0, 0]

@turn = 0

@board = [@row1, @row2, @row3]
@cpu_name = "CPU"

puts "Tic Tac Toe!"
puts "What's your name, Sir?"

@cpu = rand() > 0.5? 'X' : 'O'
@user = @cpu == 'X'? 'O' : 'X'

@trad = {0 => " ", 1 => @user, -1 => @cpu}
@dict = {:a => 0, :b => 1, :c => 2}

@user_name = gets.chomp

def draw_game

	puts ""
	puts "#{@cpu_name}: #{@cpu}"
	puts "#{@user_name}: #{@user}"
	puts ""
	puts " a b c"
	puts ""
	puts " 1 | #{@trad[@board[0][0]]} | #{@trad[@board[0][1]]} | #{@trad[@board[0][2]]} |"
	puts " 2 | #{@trad[@board[1][0]]} | #{@trad[@board[1][1]]} | #{@trad[@board[1][2]]} |"
	puts " 3 | #{@trad[@board[2][0]]} | #{@trad[@board[2][1]]} | #{@trad[@board[2][2]]} |"
end

def cpu_turn

	a = cpu_move
	
	while @board[a[0]][a[1]] != 0
		a = cpu_move
	end

	@board[a[0]][a[1]] = -1

	puts "#{@cpu_name} has made a move! #{a}"

	@turn += 1
end

def cpu_move

	move = [rand(3), rand(3)]

	mp = {:a => 0, :b => 0, :c => 0}

	for row in (0..2)
		mp[:a] += @board[row][0]
		mp[:b] += @board[row][1]
		mp[:c] += @board[row][2]
	end

	mp.each do |k| move[1] = @dict[k[0]] if k[1] < 0 end

	# Checando apenas colunas por enquanto!
	# Metodo de is_taken agora no cpu_turn

	return move
end

def winner

	k = 0
	for row in (0..2)
		for col in (0..2)
			k += @board[row][col]
			print k
		end
	end

	#Parei aqui!!

	#mp.each do |k| move[1] = @dict[k[0]] if k[1] < 0 end
end

def user_turn

	@turn += 1

	cord = { "a1" => [0,0], "a2" => [1,0], "a3" => [2,0],
				"b1" => [0,1], "b2" => [1,1], "b3" => [2,1],
					"c1" => [0,2], "c2" => [1,2], "c3" => [2,2] }


	puts ""
	print "Make a move: "
	
	input = gets.chomp.downcase

	if input.length == 2
		a = input.split("")
		if (['a', 'b', 'c'].include? a[0])
			if  (['1', '2', '3'].include? a[1])
				row = cord[input][0]
				col = cord[input][1]

				if @board[row][col] == 0
					@board[row][col] = 1

					puts "\n#{@user_name} has made a move! #{input.upcase}\n"
				
				else
					wrong_move(2)
				end
			else
				wrong_move(1)
			end
		else
			wrong_move(1)
		end
	else
		wrong_move(1) unless input == 'exit'
	end
end

def wrong_move(w)
	error = { 1 => "\nOh no! The format of the move is 'A1', 'B2', etc. Try Again", 
		2 => "\nThis slot is not available :( \nTry Again" }
	puts error[w]
	user_turn
end

def start_game

	if @turn == 0 or @turn % 2 == 0
		if @user == 'X'
			user_turn
		else
			cpu_turn
		end

		draw_game
	else
		cpu_turn
		draw_game
	end
end

winner
