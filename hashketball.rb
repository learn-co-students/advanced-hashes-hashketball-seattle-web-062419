require 'pry'

def game_hash
  {
    :home => { #loation
      :team_name => "Brooklyn Nets", #team_data
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => { #player_namepla
          :number => 0, #stats 
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        }, #stats
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      } #v 
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end


def num_points_scored(name)
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, data|
         if player_name == name #check the name to match
            return data[:points]
         end
      end
   end
end
 
def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, data|
      if player_name == name
        return data[:shoe]
      end
    end
  end
end
 

def team_colors(team_name)
team_colors_array = []
game_hash.each do |k,v|
  v.each do |attribute,data|
    if data == team_name
      team_colors_array << game_hash[k][:colors]
    end
  end
end
team_colors_array.flatten
end

def team_names
  team_names_array =[]
  game_hash.each do |k,v|
    v.each do |attribute, data|
      if attribute == :team_name
        team_names_array << data
      end
    end
  end
  team_names_array
end


def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, chars|
    if team_name == game_hash[team][:team_name]
      game_hash[team][:players].each do |name, stats|
        numbers.push(stats[:number])
      end
    end
  end
  return numbers.sort
end

def player_stats(name)
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, value|
         if player_name == name
            return value
         end
      end
   end
end

def big_shoe_rebounds
   shoe_size = 0
   rebound = 0
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, value|
         if value[:shoe] > shoe_size
            shoe_size = value[:shoe]
            rebound = value[:rebounds]
         end
      end
   end
   rebound
end

def most_points_scored
  most_points = 0
  most_points_scored = "player"
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] > most_points
            most_points = stats[:points]
            most_points_scored = player
          end
        end
      end
    end
  end
  most_points_scored
end

def winning_team
  home_team_points_total = 0
  away_team_points_total = 0
  game_hash.each do |location, team|
    if location == :home
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            home_team_points_total += stats[:points]
          end
        end
      end
    else
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            away_team_points_total += stats[:points]
          end
        end
      end
    end
  end
  if home_team_points_total > away_team_points_total
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

 def player_with_longest_name()
  longest_length = 0
  longest_player_name = nil
  
  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name.length > longest_length
        longest_length = player_name.length
        longest_player_name = player_name
      end
    end
  end
  
  longest_player_name
end

def long_name_steals_a_ton?
  name_with_steal = nil
  steal_number = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if value[:steals] > steal_number
        steal_number = value[:steals]
        name_with_steal = name
      end
    end
  end
  name_with_steal == player_with_longest_name
end