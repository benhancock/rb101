# mortgage calculator

def prompt(message)
  puts "=> #{message}"
end

prompt("Mortgage Calculator")

prompt("What is the loan amount (principal) in dollars?")
principal = ''
loop do
  principal = gets.chomp

  principal.gsub!(',', '')
  principal.gsub!('$', '')

  if principal.to_f > 0
    break
  else
    prompt("Please enter an integer greater than zero")
  end
end

prompt("What is the Annual Percentage Rate (APR) in %?")
apr_input = ''
loop do
  apr_input = gets.chomp

  apr_input.gsub!('%', '')

  if apr_input.to_f > 0
    break
  else
    prompt("Please submit a percentage greater than zero")
  end
end

prompt("What is the loan duration in years?")
years = ''
loop do
  years = gets.chomp

  if years.to_i > 0
    break
  else
    prompt("Please submit an integer greater than zero")
  end
end

principal = principal.to_f
months = years.to_i * 12
apr = apr_input.to_f * 0.01
monthly_interest = apr / 12
monthly_payment = principal * (monthlyInterest / (1 - (1 + monthlyInterest)**(-months)))

prompt("You will pay a monthly interest rate of #{(monthly_interest * 100).round(2)}% for #{months} months.")
prompt("Your monthly payment will be $#{monthly_payment.round(2)}")
