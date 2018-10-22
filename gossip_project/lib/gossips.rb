class Gossip
    attr_accessor :author, :content, :id
    def initialize(author, content)
        @author = author
        @content = content
    end
    
    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end
    end

    def self.all
        all_gossips = []
        #@id = 0 #compteur de gossip pour retrouver le n° du gossip
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end
end