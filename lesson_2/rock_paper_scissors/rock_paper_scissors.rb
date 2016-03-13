require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock).freeze
ABBREVATED_CHOICES = { rock: 'r', paper: 'p', scissors: 's', lizard: 'l', spock: 'sp' }.freeze

# methods

def display_blink_message(msg)
  5.times do
    print "\r#{msg}"
    sleep 0.5
    print "\r#{' ' * msg.size}"
    sleep 0.5
  end
end

def display_scoreboard(rounds, scores)
  puts("--------------------------------------")
  puts(format("%21s", "Scoreboard"))
  # puts('%21s' % "Scoreboard")
  puts(format('%20s', "Round: #{rounds.count}"))
  # puts('%20s' % "Round: #{rounds.count}")
  puts(format('%11s', "You: #{scores[:player1]}") + format('%21s', "Computer: #{scores[:player2]}"))
  # puts('%11s' % "You: #{scores[:player1]}" + '%21s' % "Computer: #{scores[:player2]}")
  puts("--------------------------------------")
end

def update_score(choice, computer_choice, scores)
  if win?(choice, computer_choice)
    scores[:player1] += 1
  elsif win?(computer_choice, choice)
    scores[:player2] += 1
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

def display_results(player, computer, rounds)
  if win?(player, computer)
    puts("Round #{rounds.count} goes to you. ")
  elsif win?(computer, player)
    puts("Round #{rounds.count} goes to your Computer.")
  else
    puts("Tie!")
  end
end

def update_round(rounds)
  rounds << 'x'
end

def prompt(message)
  puts "=> #{message}"
end

scores = { player1: 0, player2: 0 }
rounds = []

# welcome message displayed to user

puts("\nWelcome to Rock, Paper, Scissors, Lizard, Spock.")
puts("You vs. your computer for 5 rounds! Highest score after 5 rounds wins.")
puts("--------------------------------------")
sleep 1

# game logic

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Abbreviations work too. #{ABBREVATED_CHOICES.values.join(', ')}")
    choice = gets.chomp.downcase

    choice =
      ABBREVATED_CHOICES.key(choice).to_s if ABBREVATED_CHOICES.values.include?(choice)

    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  update_round(rounds)

  display_results(choice, computer_choice, rounds)

  update_score(choice, computer_choice, scores)

  puts
  puts(format('%20s', "You chose: #{choice}"))
  puts("Computer chose: #{computer_choice}")

  display_scoreboard(rounds, scores)

  if rounds.count == 5
    if scores[:player1] > scores[:player2]
      display_blink_message("YOU WIN!")
    elsif scores[:player1] < scores[:player2]
      display_blink_message("COMPUTER WON!")
    else
      display_blink_message("It's a TIE!")
    end
    system 'clear'
    prompt("Would you like to play again? ")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  else
    puts("Starting next round...")
    sleep 5
    system "clear"
  end
end

puts("Thank you for playing, good bye!")
