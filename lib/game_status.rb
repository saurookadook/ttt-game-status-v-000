require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[2]] == board[win_combo[1]]
    postion_taken?(board, win_combo[0])
    # (board[win_combo[0]] == board[win_combo[1]] == board[win_combo[2]] == "X") || (board[win_combo[0]] == board[win_combo[1]] == board[win_combo[2]] == "O")
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && won?(board) == (false || nil)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  binding.pry
  if won?(board) == ["X", "X", "X"]
    puts "X"
  elsif won?(board) == ["O", "O", "O"]
    puts "O"
  end
end
