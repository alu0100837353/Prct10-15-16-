Node = Struct.new(:value, :next, :previous) do
    include Comparable
    
    def <=> (another)
        self.value <=> another.value
    end
    
end