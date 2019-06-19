# Write your code here!


def game_hash
  hash = {}
  hash[:home] = {}
  hash[:away] = {}
  hash.each do |k, v|
    hash[k][:team_name] = ""
    hash[k][:colors] = []
    hash[k][:players] = {}
  end
  hash[:home] = {team_name: "Brooklyn Nets", colors: ['Black', 'White'], players: {
    "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
    "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
    "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
    "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
    "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
    }
  }
  
  hash[:away] = {team_name: "Charlotte Hornets", colors: ['Turquoise', 'Purple'], players: {
    "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
    "Bismack Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
    "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
    "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
    "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
    }
  }
  hash
end

  

def num_points_scored(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name][:points]
  elsif game_hash[:away][:players].keys.include?(name)
    game_hash[:away][:players][name][:points]
  end 
end

def shoe_size(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name][:shoe]
  elsif game_hash[:away][:players].keys.include?(name)
    game_hash[:away][:players][name][:shoe]
  end 
end

def team_colors(team)
  game_hash.each do |k,v|
    if game_hash[k][:team_name] == team 
      return game_hash[k][:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |k,v|
    
     names.push(game_hash[k][:team_name])
    
  end
  names
end

def player_numbers(team)
  num1 = []
  num2 = []
  game_hash[:home][:players].each do |player, num|
    num1.push(num[:number])
  end
  game_hash[:away][:players].each do |player, num|
    num2.push(num[:number])
  end
  
  if team == "Brooklyn Nets" 
      return num1.sort
  elsif team == "Charlotte Hornets"
      return num2.sort
    end
  
end

def player_stats(player)
  game_hash.each do |k, v|
    game_hash[k][:players].keys.each do |name|
      if name == player
        return game_hash[k][:players][name]
      end
    end
  end
end

def big_shoe_rebounds
  shoes = {}
  game_hash.each do |k, v|
    game_hash[k][:players].each do |player, num|
      shoes[player] = num[:shoe]
    end
  end
 player = shoes.key(shoes.values.max)
  game_hash.each do |k, v|
    game_hash[k][:players].keys.each do |name|
      if name == player
        return game_hash[k][:players][player][:rebounds]
      end
    end
  end
end
      
  