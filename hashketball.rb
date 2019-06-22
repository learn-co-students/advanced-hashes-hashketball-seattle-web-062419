require "pry"

def game_hash
    stats = {
    home: {
        team_name: "Brooklyn Nets", 
        colors: ["Black","White"], 
        players: [
        {name:"Alan Anderson",number:0,shoe:16,points:22,rebounds:12,assists:12,steals:3,blocks:1,slam_dunks:1},
        {name:"Reggie Evans",number:30,shoe:14,points:12,rebounds:12,assists:12,steals:12,blocks:12,slam_dunks:7},
        {name:"Brook Lopez",number:11,shoe:17,points:17,rebounds:19,assists:10,steals:3,blocks:1,slam_dunks:15},
        {name:"Mason Plumlee",number:1,shoe:19,points:26,rebounds:11,assists:6,steals:3,blocks:8,slam_dunks:5},
        {name:"Jason Terry",number:31,shoe:15,points:19,rebounds:2,assists:2,steals:4,blocks:11,slam_dunks:1}
        ]
    },
    away: {
        team_name: "Charlotte Hornets", 
        colors: ["Turquoise", "Purple"], 
        players: [
        {name:"Jeff Adrien",number:4,shoe:18,points:10,rebounds:1,assists:1,steals:2,blocks:7,slam_dunks:2},
        {name:"Bismack Biyombo",number:0,shoe:16,points:12,rebounds:4,assists:7,steals:22,blocks:15,slam_dunks:10},
        {name:"DeSagna Diop",number:2,shoe:14,points:24,rebounds:12,assists:12,steals:4,blocks:5,slam_dunks:5},
        {name:"Ben Gordon",number:8,shoe:15,points:33,rebounds:3,assists:2,steals:1,blocks:1,slam_dunks:0},
        {name:"Kemba Walker",number:33,shoe:15,points:6,rebounds:12,assists:12,steals:7,blocks:5,slam_dunks:12}
        ]
        }
    }
end


def num_points_scored(name)
    game_hash[:away][:players].each do |player_hash|
        if player_hash.values.include?(name)
            return player_hash[:points]
        end
    end
    game_hash[:home][:players].each do |player_hash|
        if player_hash.values.include?(name)
            return player_hash[:points]
        end
    end
end

def shoe_size(name)
    game_hash[:away][:players].each do |player_hash|
        if player_hash.values.include?(name)
            return player_hash[:shoe]
        end
    end
    game_hash[:home][:players].each do |player_hash|
        if player_hash.values.include?(name)
            return player_hash[:shoe]
        end
    end
end

def team_colors(name)
    if game_hash[:away][:team_name] == name
        return game_hash[:away][:colors]
    end
    if game_hash[:home][:team_name] == name
        return game_hash[:home][:colors]
    end
end

def team_names
    [game_hash[:away][:team_name],game_hash[:home][:team_name]]
end

def player_numbers(team)
    numbers = []
    if game_hash[:away][:team_name] == team
        players = game_hash[:away][:players]
    else
        players = game_hash[:home][:players]
    end
    players.each do |player|
        numbers<<player[:number]
    end
    numbers
end

def player_stats(name)
    p_hash = {}
    game_hash[:away][:players].each do |player_hash|
        if player_hash.values.include?(name)
            p_hash = player_hash
        end
    end
    game_hash[:home][:players].each do |player_hash|
        if player_hash.values.include?(name)
            p_hash = player_hash
        end
    end
    new_p_hash = {}
    p_hash.each do |key, val|
        if key != :name
            new_p_hash[key] = val
        end
    end
    new_p_hash
end

def big_shoe_rebounds
    biggest_shoe = 0
    rebounds = 0
    game_hash[:home][:players].each do |player_hash|
        if player_hash[:shoe] > biggest_shoe
            biggest_shoe = player_hash[:shoe]
            rebounds = player_hash[:rebounds]
        end
    end
    game_hash[:away][:players].each do |player_hash|
        if player_hash[:shoe] > biggest_shoe
            biggest_shoe = player_hash[:shoe]
            rebounds = player_hash[:rebounds]
        end
    end
    rebounds
end

def most_points_scored
    points = 0
    name = ""
    game_hash[:home][:players].each do |player_hash|
        if player_hash[:points] > points
            points = player_hash[:points]
            name = player_hash[:name]
        end
    end
    game_hash[:away][:players].each do |player_hash|
        if player_hash[:points] > points
            points = player_hash[:points]
            name = player_hash[:name]
        end
    end
    name
end

def winning_team
    home = 0
    home_name = game_hash[:home][:team_name]
    away = 0
    away_name = game_hash[:home][:team_name]
    game_hash[:home][:players].each do |player_hash|
        home += player_hash[:points]
    end
    game_hash[:away][:players].each do |player_hash|
        away += player_hash[:points]
    end
    if home > away
        return home_name
    else
        return away_name
    end
end

def player_with_longest_name
    name = ""
    game_hash[:home][:players].each do |player_hash|
        if player_hash[:name].size > name.size
            name = player_hash[:name]
        end
    end
    game_hash[:away][:players].each do |player_hash|
        if player_hash[:name].size > name.size
            name = player_hash[:name]
        end
    end
    name
end

def most_steals
    steals = 0
    name = ""
    game_hash[:home][:players].each do |player_hash|
        if player_hash[:steals] > steals
            steals = player_hash[:steals]
            name = player_hash[:name]
        end
    end
    game_hash[:away][:players].each do |player_hash|
        if player_hash[:steals] > steals
            steals = player_hash[:steals]
            name = player_hash[:name]
        end
    end
    name
end

def long_name_steals_a_ton?
    most_steals == player_with_longest_name
end