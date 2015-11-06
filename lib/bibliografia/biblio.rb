class Biblio
    attr_reader :autores, :titulo, :serie, :editorial, :n_edicion, :fecha_publicacion, :isbn
    
    def initialize(autores, titulo, serie, editorial, n_edicion, fecha_publicacion, isbn)
        raise ArgumentError, "Autores debe ser un array" unless autores.is_a?(Array)
        raise ArgumentError, "Autores debe tener al menos 1 valor" unless autores.size >= 1
        raise ArgumentError, "El título debe se un string" unless titulo.is_a?(String)
        if !serie.nil?
            raise ArgumentError, "La serie debe se un string" unless serie.is_a?(String)
        end
        raise ArgumentError, "La editorial debe se un string" unless editorial.is_a?(String)
        raise ArgumentError, "El número de edicion debe se un numero" unless n_edicion.is_a?(Numeric)
        raise ArgumentError, "La fecha debe se un string" unless fecha_publicacion.is_a?(String)
        raise ArgumentError, "La isbn debe se un array" unless isbn.is_a?(Array)
        raise ArgumentError, "La isbn debe tener al menos 1 valor" unless isbn.size >= 1
        
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
        # imprime los autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."
        puts str_autores
        
        # imprime los titulo
        puts @titulo
        
        # imprime la serie
        if(serie != nil)
            puts "(#{@serie})"
        end
        
        # imprime editorial, edicion y fecha
        puts "#{@editorial}; #{@n_edicion} edición (#{@fecha_publicacion})"
        
        #imprime los isbn
        @isbn.each do |n_isbn|
            if n_isbn.length > 10
                puts "ISBN-13: #{n_isbn}"
            else
                puts "ISBN-10: #{n_isbn}"
            end
        end
        
    end
end