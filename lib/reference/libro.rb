class Libro < Biblio 
    
    attr_reader :pages
    def initialize(autores, titulo, serie, editorial, n_edicion, fecha_publicacion, isbn,pages)
        super(autores, titulo, serie, editorial, n_edicion, fecha_publicacion, isbn)
        @pages = pages
    end
    
    def to_s
        super
    end
end