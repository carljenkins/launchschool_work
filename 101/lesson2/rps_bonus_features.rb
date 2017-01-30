
VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'spock' }
ROUNDS = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def update_score(scores, choice, computer_choice)
  if win?(choice, computer_choice)
    scores[:player] += 1
  elsif win?(computer_choice, choice)
    scores[:computer] += 1
  else
    scores[:ties] += 1
  end
end

def reset_scores(score_board)
  score_board[:computer] = 0
  score_board[:player] = 0
  score_board[:ties] = 0
end

def display_scoreboard(winner)
  if winner.first == :player
    prompt("You won #{winner.last} rounds")
  elsif winner.first == :computer
    prompt("Computer won #{winner.last} rounds")
  else
    prompt("#{winner.last} tie games? Wow!")
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

score_board = { player: 0, computer: 0, ties: 0 }
loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.values.join(', ')}")
    prompt("r = rock, p = paper, s = scissors, l = lizard, sp = spock")
    key = Kernel.gets().chomp()
    if VALID_CHOICES.keys.include?(key)
      choice = VALID_CHOICES[key]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.values.sample
  Kernel.puts("You chose: #{choice} Computer chose: #{computer_choice}")

  update_score(score_board, choice, computer_choice)
  display_results(choice, computer_choice)

  play_again = ''
  winner = score_board.rassoc(ROUNDS)

  if winner
    display_scoreboard(winner)
    sleep 2

    prompt("Do you want to play again? (y,n)")
    reset_scores(score_board)
    play_again = gets.chomp
  end

  break if play_again.downcase.start_with?('n')
end

prompt("Thanks for playing! ;)")
