module ApplicationHelper

  def max_at_bats
    twenty_sided = 1 + rand(20)

    at_bats = 600

    case twenty_sided
    when 1
      at_bats = 599
    when 2..3
      at_bats = 574
    when 4..6
      at_bats = 549
    when 7..8
      at_bats = 524
    when 9..10
      at_bats = 499
    when 11..13
      at_bats = 474
    when 14..15
      at_bats = 449
    when 16..18
      at_bats = 424
    when 19
      at_bats = 399
    when 20
      at_bats = 374
    end

    return at_bats
  end

  
  def players_to_rest
    six_sided = 1 + rand(6)
    positions = {"C" => "No Rest", "1B" => "No Rest", "2B" => "No Rest", "3B" => "No Rest", "SS" => "No Rest", "LF" => "No Rest", "CF" => "No Rest", "RF" => "No Rest", "DH" => "No Rest"}

    case six_sided
    when 1
      positions["CF"] = max_at_bats
      positions["3B"] = max_at_bats
      positions["DH"] = max_at_bats
    when 2
      positions["SS"] = max_at_bats
      positions["RF"] = max_at_bats
      positions["1B"] = max_at_bats
    when 3
      positions["2B"] = max_at_bats
      positions["C"] = max_at_bats
      positions["LF"] = max_at_bats
    when 4
      positions["SS"] = max_at_bats
      positions["LF"] = max_at_bats
      positions["1B"] = max_at_bats
    when 5
      positions["2B"] = max_at_bats
      positions["RF"] = max_at_bats
      positions["DH"] = max_at_bats
    when 6
      positions["CF"] = max_at_bats
      positions["C"] = max_at_bats
      positions["3B"] = max_at_bats
    end

    return positions


  end
end
