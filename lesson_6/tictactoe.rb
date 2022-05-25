BLANK_MARKER = ' '
USER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WIN_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]

def prompt(str)
  puts "=> #{str} \n\n"
  pause
end

def initialize_board
  board = {}
  (1..9).each { |num| board[num] = BLANK_MARKER }
  board
end

def display_board(board)
  system 'clear'
  puts
  puts("  #{board[1]}|#{board[2]}|#{board[3]}")
  puts("  -+-+-")
  puts("  #{board[4]}|#{board[5]}|#{board[6]}")
  puts("  -+-+-")
  puts("  #{board[7]}|#{board[8]}|#{board[9]}")
  puts
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[0..-2].join(delimiter) + " #{word} #{arr.last}"
  end
end

def user_turn!(viable_moves, board)
  prompt "Please choose a square (#{joinor(viable_moves)})"
  user_move = gets.to_i
  loop do
    if viable_moves.include?(user_move)
      board[user_move] = USER_MARKER
      break
    else
      prompt "Invalid move. Please select an empty square."
      user_move = gets.to_i
    end
  end
end

def computer_turn!(board)
  square = nil
  WIN_CONDITIONS.each do |wincond|
    square = find_at_risk_square(wincond, board, COMPUTER_MARKER)
    break if square
  end

  if !square
    WIN_CONDITIONS.each do |wincond|
      square = find_at_risk_square(wincond, board, USER_MARKER)
      break if square
    end
  end

  square = no_at_risk_squares(board) if !square

  board[square] = COMPUTER_MARKER
end

def no_at_risk_squares(board)
  if board[5] == BLANK_MARKER
    5
  else
    empty_squares(board).sample
  end
end

def find_at_risk_square(wincond, board, marker)
  if board.values_at(*wincond).count(marker) == 2
    board.select { |k, v| wincond.include?(k) && v == BLANK_MARKER }.keys.first
  end
end

def empty_squares(board)
  board.keys.select { |val| board[val] == BLANK_MARKER }
end

def user_moves(board)
  board.keys.select { |val| board[val] == USER_MARKER }
end

def computer_moves(board)
  board.keys.select { |val| board[val] == COMPUTER_MARKER }
end

def winner?(board)
  win_state = nil
  WIN_CONDITIONS.each do |win_cond|
    test_line = [board[win_cond[0]], board[win_cond[1]], board[win_cond[2]]]
    if test_line == [USER_MARKER, USER_MARKER, USER_MARKER]
      win_state = 1
      break
    elsif test_line == [COMPUTER_MARKER, COMPUTER_MARKER, COMPUTER_MARKER]
      win_state = -1
      break
    end
  end
  win_state
end

def place_piece!(board, current_player)
  if current_player == 'user'
    user_turn!(empty_squares(board), board)
  elsif current_player == 'computer'
    computer_turn!(board)
    pause
  end
end

def alternate_player(current_player)
  if current_player == 'computer'
    'user'
  else
    'computer'
  end
end

def pause
  sleep 0.5
end

def greeting
  system 'clear'
  prompt "Welcome to Tic-Tac-Toe"
  prompt "First to win 5 rounds wins!"
  prompt "Would you like to go first? (y/n)"
end

def display_score(user_wins, computer_wins)
  puts
  prompt "The score is #{user_wins} to #{computer_wins}. "
  if user_wins > computer_wins
    prompt "You won the game!"
  elsif computer_wins > user_wins
    prompt "You lost the game!"
  end
end

def display_winner(win_state, board, computer_wins, user_wins)
  if win_state == -1
    computer_wins += 1
    prompt "You lose this round!"
  elsif win_state == 1
    user_wins += 1
    prompt "You win this round!"
  elsif empty_squares(board).empty?
    prompt "This round is a tie!"
  end
  [computer_wins, user_wins]
end

def gameplay_loop(board, current_player)
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if winner?(board) || empty_squares(board).empty?
  end
end

loop do
  computer_wins = 0
  user_wins = 0

  greeting
  first = gets.chomp
  current_player = if first.downcase == 'y' || first.downcase == 'yes'
                     'user'
                   else
                     'computer'
                   end

  loop do
    board = initialize_board
    display_board(board)

    gameplay_loop(board, current_player)

    display_board(board)
    computer_wins, user_wins = display_winner(winner?(board),
                                              board,
                                              computer_wins,
                                              user_wins)
    pause

    break if user_wins == 5 || computer_wins == 5
    prompt "Play the next round? (y/n)"
    next_round = gets.chomp
    break unless next_round.downcase == 'y' || next_round.downcase == 'yes'
  end

  display_score(user_wins, computer_wins)
  prompt "Play another game? y/n"
  another_game = gets.chomp
  break unless another_game.downcase == 'y' || another_game.downcase == 'yes'
end

system 'clear'
