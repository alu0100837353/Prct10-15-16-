require 'date'

class Biblio
    attr_reader :autores, :titulo, :serie, :editorial, :n_edicion, :fecha_publicacion, :isbn
    
    def initialize(autores, titulo, serie, editorial, n_edicion, fecha_publicacion, isbn)
        raise ArgumentError, "Autores debe ser un array" unless autores.is_a?(Array)
        raise ArgumentError, "Autores debe tener al menos 1 valor" unless autores.size >= 1
        raise ArgumentError, "Título debe se un string" unless titulo.is_a?(String)
        if !serie.nil?
            raise ArgumentError, "La serie debe se un string" unless serie.is_a?(String)
        end
        raise ArgumentError, "Editorial debe se un string" unless editorial.is_a?(String)
        raise ArgumentError, "Número de edicion debe se un numero" unless n_edicion.is_a?(Numeric)
        raise ArgumentError, "Fecha debe se un string (dd-mm-yyyy)" unless fecha_publicacion.is_a?(String)
        raise ArgumentError, "ISBN debe se un array" unless isbn.is_a?(Array)
        raise ArgumentError, "ISBN debe tener al menos 1 valor" unless isbn.size >= 1
        
        @autores = autores
        @titulo = titulo
        @serie = serie
        @editorial = editorial
        @n_edicion = n_edicion
        @fecha_publicacion = Date.parse(fecha_publicacion)
        @isbn = isbn
    end
    
    def to_s
        salida=""
        # autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."

        # isbn
        str_isbn = ""
        @isbn.each do |n_isbn|
            if n_isbn.length > 10
                str_isbn += "ISBN-13: #{n_isbn}\n"
            else
                str_isbn += "ISBN-10: #{n_isbn}\n"
            end
        end
        
        if(serie != nil)
            salida = "#{str_autores}\n#{titulo}\n#{serie}\n#{@editorial}; #{@n_edicion} edición (#{@fecha_publicacion.strftime("%d, %B %Y")})\n#{str_isbn}"
        else
            salida = "#{str_autores}\n#{titulo}\n#{@editorial}; #{@n_edicion} edición (#{@fecha_publicacion.strftime("%d, %B %Y")})\n#{str_isbn}"
        end
        salida
    end
end
