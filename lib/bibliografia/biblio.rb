class Biblio
    attr_reader :autores, :titulo, :serie, :editorial, :n_edicion, :fecha_publicacion, :isbn
    
    def initialize(autores, titulo, serie, editorial, n_edicion, fecha_publicacion, isbn)
        @autores = autores
        @titulo = titulo
        @serie = serie
        @editorial = editorial
        @n_edicion = n_edicion
        @fecha_publicacion = fecha_publicacion
        @isbn = isbn
    end
    
    def get_autores
        return @autores
    end
    
    def get_titulo
        return @titulo
    end
    
    def get_serie
        return @serie
    end
    
    def get_editorial
        return @editorial
    end
    
    def get_n_edicion
        return @n_edicion
    end
    
    def get_fecha_publicacion
        return @fecha_publicacion
    end
    
    def get_isbn
        return @isbn
    end
    
    def to_s
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."
        puts str_autores
    end
end
