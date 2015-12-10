class RList < List
    
    def initialize(valor)
        puts valor
        puts "Estamos en metodo apa" + valor.apa
        super(valor.apa)
    end
    
    def push(valor)
        super(valor.apa)
    end
    
    def insert(*valores)
        var = 0
        val = valores
        while val.length > var
            push(val[var].apa)
            var += 1
        end
    end

    def pop (valor)
        super(valor.apa)
    end
    
    def order
        #hay q retocar comparable para poder hacerlo ...
    end
    def to_s
        str = ""
        self.each do |reference|
           str += reference.to_apa
        end
        str
    end
        
    
end