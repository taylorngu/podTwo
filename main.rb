# defines dice roll
def roll()
  return [rand(1..7), rand(1..7)]
end

# calculates total damage for a single turn
def turn()
  die = roll()
  count = 0
  lim = 0
  lands = []
  total = 0 
  if die[0] == die[1] && lim < 3
    while die[0] == die[1] && lim < 3
      count += die.sum 
      die = roll()
      lim += 1
      lands << count
    end
  else
    if count != 20 
      lands << die.sum
    end 
  end 
  for n in lands 
    if n == 6 || n == 8
      total += 950
    elsif n == 9
      total += 1000
    end
  end
  return total 
end 

# runs n number of trials and averages damage
def doTrials(n)
  total = 0
  n.times do |i|
    total += turn()
  end
  return "Average damage: $%d" % [total / n]
end

doTrials(1000000)

# 10 Runs of 1000000 Trials
# $357, $356, $357, $357, $356, $357, $356, $357, $357, $357

# For my client, I would choose an insurance premium around $370. The reasoning behind overestimating is because the function finds the average damage of each turn, so despite the fact that the values from the trials totals closer to $360, my premium would fit in more of the upper range of values.