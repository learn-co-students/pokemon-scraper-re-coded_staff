class Pokemon
    attr_accessor :name, :type, :id, :db;

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon
            (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM ?", self.db)[0][0]
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
        SQL
        pokemon = db.execute(sql, id).flatten
        new_pokemon = Pokemon.new(id: pokemon[0], name: pokemon[1],type: pokemon[2], db: db)
        new_pokemon
       
    end
end
