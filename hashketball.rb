require "pry"

def game_hash
  
  hash = {
    
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: [ {"Alan Anderson": {
          number: "0",
          shoe: "16",
          points: "22",
          rebounds: "12",
          assists: "12",
          steals: "3",
          blocks: "1",
          slam_dunks: "1"
        
      }, # weird spacing helps separate levels
        "Reggie Evans": {
          number: "30",
          shoe: "14",
          points: "12",
          rebounds: "12",
          assists: "12",
          steals: "12",
          blocks: "12",
          slam_dunks: "7"
                          },
        "Brook Lopez": {
          number: "11",
          shoe: "17",
          points: "17",
          rebounds: "19",
          assists: "10",
          steals: "3",
          blocks: "1",
          slam_dunks: "15"
                          },
        "Mason Plumlee": {
          number: "1",
          shoe: "19",
          points: "26",
          rebounds: "11",
          assists: "6",
          steals: "3",
          blocks: "8",
          slam_dunks: "5"
                          },
        "Jason Terry": {
          number: "31",
          shoe: "15",
          points: "19",
          rebounds: "2",
          assists: "2",
          steals: "4",
          blocks: "11",
          slam_dunks: "1"
                          }                  
        
        }]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: [
        {"Jeff Adrien": {
          number: "4",
          shoe: "18",
          points: "10",
          rebounds: "1",
          assists: "1",
          steals: "2",
          blocks: "7",
          slam_dunks: "2"
                          },
        "Bismack Biyombo": {
          number: "0",
          shoe: "16",
          points: "12",
          rebounds: "4",
          assists: "7",
          steals: "22",
          blocks: "15",
          slam_dunks: "10"
                          },
        "DeSagna Diop": {
          number: "2",
          shoe: "14",
          points: "24",
          rebounds: "12",
          assists: "12",
          steals: "4",
          blocks: "5",
          slam_dunks: "5"
                          },
        "Ben Gordon": {
          number: "8",
          shoe: "15",
          points: "33",
          rebounds: "3",
          assists: "2",
          steals: "1",
          blocks: "1",
          slam_dunks: "0"
                          },
        "Kemba Walker": {
          number: "33",
          shoe: "15",
          points: "6",
          rebounds: "12",
          assists: "12",
          steals: "7",
          blocks: "5",
          slam_dunks: "12"
                          }                  
        
        }
        ]
    }
  }
  
end

def num_points_scored(name)
  returnvalue = 0
    game_hash.each do |homeaway,teamdeets|
      teamdeets.each do |deetkey,deetvalue|
            if deetkey == :players
                deetvalue.each do |x|
                  x.each do |namekey,stats|
                    if namekey == name.to_sym
                        stats.each do |statdesc,statval|
                            if statdesc == :points
                                returnvalue += statval.to_i
                            end
                        end
                    end
                  end
                end
            end
      end
    end
    returnvalue
end


def shoe_size(name)
    returnvalue = 0
        game_hash.each do |homeaway,teamdeets|
          teamdeets.each do |deetkey,deetvalue|
                if deetkey == :players
                    deetvalue.each do |x|
                        x.each do |namekey,stats|
                            if namekey == name.to_sym
                                stats.each do |statdesc,statval|
                                    if statdesc == :shoe
                                        returnvalue += statval.to_i
                                    end
                                end
                            end
                        end
                    end
                end
          end
        end
    returnvalue
end

def team_colors(tname)
returnvalue = []
        game_hash.each do |homeaway,teamdeets|
            teamdeets.each do |k2,v2|
                if game_hash[homeaway][k2] == tname
                    returnvalue << game_hash[homeaway][:colors]
                end
            end
        end
    p returnvalue[0]
end

def team_names
    returnvalue = []
        game_hash.each do |homeaway,teamdeets|
                teamdeets.each do |k2,v2|
                        until returnvalue.length == 1
                        returnvalue << v2
                        end
                end
                    if homeaway == :away
                        teamdeets.each do |k3,v3|
                                until returnvalue.length == 2
                                    returnvalue << v3
                                end
                        end
                    end
        end
p returnvalue
end

def player_numbers(name)
returnarray = []
    game_hash.each do |homeaway,teamdeets|
        if name == game_hash[homeaway][:team_name]
            teamdeets.each do |deetkey,deetvalue|
                if deetkey == :players
                    deetvalue.each do |x|
                        x.each do |namekey,stats|
                            stats.each do |statkey, statval|
                                if statkey == :number
                                    returnarray << statval.to_i
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    returnarray.sort!
end

def player_stats(name)
newhash = {}

  game_hash.each do |homeaway,teamdeets|
          teamdeets.each do |deetkey,deetvalue|
              if deetkey == :players
                  deetvalue.each do |x|
                      x.each do |namekey,stats|
                          if namekey == name.to_sym 
                                  vals = stats.collect {|statkey,statval| statval.to_i}
                                  newhash = Hash[stats.keys.zip(vals)]
                          end
                      end
                  end
              end
          end
  end
    newhash
end

def big_shoe_rebounds
max = 0
playerstats = {}

    # open the hash
    game_hash.each do |homeaway,teamdeets|
        # enter team details hash
        teamdeets.each do |deetkey,deetvalue|
            # when the property == :players
            if deetkey == :players
                # open the player array
                deetvalue.each do |x|
                    # check hash index
                    x.each do |namekey,stats|
                        # open the stat hash
                        stats.each do |statkey,statval|
                            # when :shoe symbol is reached
                            # add shoe value to shoe array
                            if statkey == :shoe && statval.to_i > max
                                max = statval.to_i
                                playerstats = stats
                            end
                        end
                    end
                end
                
            end   
        end
    end
    p playerstats[:rebounds].to_i
end

def most_points_scored

max = 0
playername = {}

# reuse code from big shoes rebounds
game_hash.each do |homeaway,teamdeets|
    teamdeets.each do |deetkey,deetvalue|
        if deetkey == :players
            deetvalue.each do |x|
                x.each do |namekey,stats|
                    stats.each do |statkey,statval|
                        if statkey == :points && statval.to_i > max
                            max = statval.to_i
                            playername = namekey.to_s
                        end
                    end
                end
            end
            
        end   
    end
end
p playername

end

def winning_team
points1 = [0,"Brooklyn Nets"]
points2 = [0,"Charlotte Hornets"]
    # open the hash
    game_hash.each {|homeaway,teamdeets|
    if homeaway == :home
        teamdeets.each {|deetkey,deetvalue|
        # iterate until players
        if deetkey == :players
            # open :players
            deetvalue.each {|x|
                # iterate the array
                x.each {|namekey,stats|
                    # iterate stats until reach points
                    stats.each {|statkey,statval|
                        if statkey == :points
                            points1[0] += statval.to_i
                        end
                    }
                }
            }
        end
        }
    else
        teamdeets.each {|deetkey,deetvalue|
        # iterate until players
        if deetkey == :players
            # open :players
            deetvalue.each {|x|
                # iterate the array
                x.each {|namekey,stats|
                    # iterate stats until reach points
                    stats.each {|statkey,statval|
                        if statkey == :points
                            points2[0] += statval.to_i
                        end
                    }
                }
            }
        end
        }
    end
    }
    if points1[0] > points2[0]
        p points1[1]
    else
        p points2[1]
    end
end

def player_with_longest_name
    max = [0,""]
    max2 = [0,""]

    # turn the players for one team into an array
    # iterate over the name array

    game_hash[:home][:players][0].keys.each do |x|
        if max[0] < x.length
            max[0] = x.length
            max[1] = x.to_s
        end
    end
    game_hash[:away][:players][0].keys.each do |x|
        if max2[0] < x.length
            max2[0] = x.length
            max2[1] = x.to_s
        end
    end
    if max[0] > max2[0]
        max[1]
    else
        max2[1]
    end
end

def long_name_steals_a_ton?
longnameplayer = player_with_longest_name
max = 0
playername = {}
  # reuse code from big shoes rebounds
game_hash.each do |homeaway,teamdeets|
    teamdeets.each do |deetkey,deetvalue|
        if deetkey == :players
            deetvalue.each do |x|
                x.each do |namekey,stats|
                    stats.each do |statkey,statval|
                        if statkey == :steals && statval.to_i > max
                            max = statval.to_i
                            playername = namekey.to_s
                        end
                    end
                end
            end
            
        end   
    end
end

#make comparison variable
stealingplayer = playername

#return the true or false
p stealingplayer == playername
  
end
