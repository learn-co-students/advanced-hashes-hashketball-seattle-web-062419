require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals:22,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if player == name 
        return data[:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if player == name
        return data[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game = game_hash
  game.each do |location, attributes|
    if game[location].values.include?(team_name)
      attributes.each do |attribute, data|
        if attribute == :colors
          return data
        end
      end
    end
  end
end

def player_numbers(team_name)
  hash = game_hash
  hash.each do |location, attributes|
    if hash[location].values.include?(team_name)
      attributes.each do |attribute, info|
        if info.class == Hash
          info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :number
                array << int.to_i
              end
            end
          end
        end
      end
    end
  end
  return array
end

# def team_names
#   game_hash.each do |location, data|
#     if location ==
#     return location[:team_name]
#   end
# end

def team_names
  hash = game_hash
  array = []
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if attribute == :team_name
        array << info
      end
    end
  end
  return array
end

# def player_numbers(team_name)
#   game_hash.each do |location, team_data| 
#     team_data each do |attribute, data|
#     if attribute == number
#     puts name.values
#   end
# end
# end

# def player_stats(player_stats)
#   game_hash.each do |location, team_data|
#     if team_data == players
#       puts team_data
#     end
#   end
# end
# end

def player_stats(name)
  hash = game_hash
  hash.each do |location, attributes| 
    attributes.each do |attribute, info| 
      if info.include?(name) 
       return hash[location][attribute][name]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, data|
      if data.class == Hash
        data.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end


