class Periodical < Biblio 
    
    attr_reader :ref
    def initialize(autores, titulo, serie, editorial, n_edicion, fecha_publicacion, *ref)
        @autores = autores
        @titulo = titulo
        @serie = serie
        @editorial = editorial
        @n_edicion = n_edicion
        @fecha_publicacion = fecha_publicacion
        @ref = ref
    end
    
    def to_apa
        salida=""
        # autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += "Autor, " + autor + "& "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."
        
        salida = "#{str_autores}\n(#{@fecha_publicacion.strftime("%d, %B %Y")})\n#{@titulo},#{@n_edicion}\n#{@editorial}\nDisponible en:#{@ref}"
        salida
    end
    
    def to_s
        salida=""
        # autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."
        
        if(serie != nil)
            salida = "#{str_autores}\n#{titulo}\n#{serie}\n#{@editorial}; #{@n_edicion} edición (#{@fecha_publicacion.strftime("%d, %B %Y")})\n#{@ref}"
        else
            salida = "#{str_autores}\n#{titulo}\n#{@editorial}; #{@n_edicion} edición (#{@fecha_publicacion.strftime("%d, %B %Y")})\n#{@ref}"
        end
        salida
    end
end