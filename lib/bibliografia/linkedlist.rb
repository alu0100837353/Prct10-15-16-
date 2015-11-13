class List
    attr_accessor :root, :tail, :size

    def initialize(valor)
        @root = Node.new(valor, nil, nil)
        @tail = @root
    end
    
    #Métodos de insersión
    
    def push(valor)
        @tail.next = Node.new(valor, nil, @tail)
        @tail = @tail.next
    end
    
    def insert(*valores)
        var = 0
        val = valores
        while val.length > var 
            push(val[var])
            var += 1
        end
    end

    def pop (valor)
        @root.previous = Node.new(valor, @root, nil)
        @root = @root.previous
    end
    
    #Métodos de borrado
    
    def shift
        @root = @root.next
        @root.previous = nil
    end
    
    def pull
        @tail = @tail.previous
        @tail.next = nil
    end
    
    #Métodos complementarios
    
    def to_s 
        var = @root
        cadena = ""
        while var != nil do
            cadena = cadena + "#{var.value.to_s}\n"
            var = var.next
        end
        cadena
    end 
    
    def reverse
        var = @tail
        aux = List.new(var.value)
        var = var.previous
        while(var != nil)do
            aux.push(var.value)
            var = var.previous
        end
        aux 
    end
    
end