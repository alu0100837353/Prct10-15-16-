require 'bibliografia'
require 'spec_helper'

describe Biblio do
    
    before :each do
        @b1 = Biblio.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"])
        @b2 = Biblio.new(["autor1"], "titulo", nil, "editorial", 1, "1-1-1991", ["isbn1"])
        @b3 = Biblio.new(["autor1","autor2"], "titulo", nil, "editorial", 1, "1-1-1991", ["isbn1", "isbn2"])
        @l1 = List.new("Root")
        @r1 = Biblio.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, "7-7-2013",["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
        @r2 = Biblio.new(["Scott Chacon"], "Pro Git 2009th Edition", "Pro", "Apress", 2009, "27-8-2009", ["ISBN-13: 978-1430218333", "ISBN-10: 1430218339"])
        @r3 = Biblio.new(["David Flanagan", "Yukihiro Matsumoto"],"The Ruby Programming Language", nil, "O’Reilly Media", 1, "4-2-2008", ["ISBN-10: 0596516177", "ISBN-13: 978-0596516178"])
        @r4 = Biblio.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends","The Facets of Ruby", "Pragmatic Bookshelf", 1, "25-12-2010", ["ISBN-10: 1934356379", "ISBN-13: 978-1934356371"])
        @r5 = Biblio.new(["Richard E"], "Silverman Git Pocket Guide", nil, "O’Reilly Media", 1, "2-8-2013", ["ISBN-10: 1449325866", "ISBN-13: 978-1449325862"])
        @l2 = Libro.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"],100)
        @l3 = Libro.new(["autor1"], "titulo", nil, "editorial", 1, "1-1-1991", ["isbn1"],100)
        @l4 = Libro.new(["autor1","autor2"], "titulo", nil, "editorial", 1, "1-1-1991", ["isbn1", "isbn2"],100)
        @p1 = Periodical.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1, "1-1-1991", ["ref1", "ref2"])
        @p2 = Periodical.new(["autor1"], "titulo", nil, "editorial", 1, "1-1-1991", ["ref1"])
        @p3 = Periodical.new(["autor1","autor2"], "titulo", nil, "editorial", 1, "1-1-1991", ["ref1", "ref2"])
    end
    
    describe "Comprobación de una correcta construcción" do
        it "Existe al menos un autor" do
            expect(@b1.autores).not_to eq(nil)
            expect(@b2.autores).not_to eq(nil)
            expect(@b3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@b1.titulo).not_to eq(nil)
            expect(@b2.titulo).not_to eq(nil)
            expect(@b3.titulo).not_to eq(nil)
        end
        it "Existe o no una serie" do
            expect(@b1.serie).not_to eq(nil)
            expect(@b2.serie).to eq(nil)
            expect(@b3.serie).to eq(nil)
        end
        it "Existe editorial" do
            expect(@b1.editorial).not_to eq(nil)
            expect(@b2.editorial).not_to eq(nil)
            expect(@b3.editorial).not_to eq(nil)
        end
        it "Existe edicion" do
            expect(@b1.n_edicion).not_to eq(nil)
            expect(@b2.n_edicion).not_to eq(nil)
            expect(@b3.n_edicion).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@b1.fecha_publicacion).not_to eq(nil)
            expect(@b2.fecha_publicacion).not_to eq(nil)
            expect(@b3.fecha_publicacion).not_to eq(nil)
        end
        it "Existe isbn" do
            expect(@b1.isbn).not_to eq(nil)
            expect(@b2.isbn).not_to eq(nil)
            expect(@b3.isbn).not_to eq(nil)
        end
    end
    
    describe "Comprobación de un correcto funcionamiento de los métodos" do
        it "Test método autor" do
            expect(@b1.autores).to eq(["autor1","autor2","autor3"])
            expect(@b2.autores).to eq(["autor1"])
            expect(@b3.autores).to eq(["autor1","autor2"])
        end
        it "Test método titulo" do
            expect(@b1.titulo).to eq("titulo")
            expect(@b2.titulo).to eq("titulo")
            expect(@b3.titulo).to eq("titulo")
        end
        it "Test método serie" do
            expect(@b1.serie).to eq("serie")
            expect(@b2.serie).to eq(nil)
            expect(@b3.serie).to eq(nil)
        end
        it "Test método editorial" do
            expect(@b1.editorial).to eq("editorial")
            expect(@b2.editorial).to eq("editorial")
            expect(@b3.editorial).to eq("editorial")
        end
        it "Test método edicion" do
            expect(@b1.n_edicion).to eq(1)
            expect(@b2.n_edicion).to eq(1)
            expect(@b3.n_edicion).to eq(1)
        end
        it "Test método fecha" do
            expect(@b1.fecha_publicacion.to_s).to eq("1991-01-01")
            expect(@b2.fecha_publicacion.to_s).to eq("1991-01-01")
            expect(@b3.fecha_publicacion.to_s).to eq("1991-01-01")
        end
        it "Test método isbn" do
            expect(@b1.isbn).to eq(["isbn1", "isbn2"])
            expect(@b2.isbn).to eq(["isbn1"])
            expect(@b3.isbn).to eq(["isbn1", "isbn2"])
        end
        it "Test método to_s (nos devuelve una referencia formateada)" do
            expect(@b1.to_s).to eq("autor1, autor2, autor3.\ntitulo\nserie\neditorial; 1 edición (01, January 1991)\nISBN-10: isbn1\nISBN-10: isbn2\n")
            expect(@b2.to_s).to eq("autor1.\ntitulo\neditorial; 1 edición (01, January 1991)\nISBN-10: isbn1\n")
            expect(@b3.to_s).to eq("autor1, autor2.\ntitulo\neditorial; 1 edición (01, January 1991)\nISBN-10: isbn1\nISBN-10: isbn2\n")
        end
    end
    
    describe "Lanzamiento de errores al construir" do
      it "Debe haber un autor" do
          expect { Biblio.new(nil, "titulo", "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber un titulo" do
          expect { Biblio.new(["autor1"] , nil, "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una editorial" do
          expect { Biblio.new(["autor1","autor2","autor3"], "titulo", "serie",nil , 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una edicion" do
          expect { Biblio.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial",nil , "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una fecha de publicacion" do
          expect { Biblio.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1,nil , ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
    end
    
    describe "Node" do 
        it "Debe existir un Nodo de la lista con sus datos y su siguiente" do 
            expect(@l1.root.value).not_to eq(nil)
            expect(@l1.root.next).to eq(nil)
        end
    end
    
    describe "LinkedList" do 
        it "Se puede insertar un elemento" do 
            @l1.push(8)
            expect(@l1.tail.value).to eq(8)
        end
        it "Se extrae el primer elemento de la lista" do 
            @l1.push(8)
            @l1.shift
            expect(@l1.root.value).to eq(8)
        end
        it "Se pueden insertar varios elementos" do 
            @l1.insert(3,4,5)
            expect(@l1.tail.value).to eq(5)
        end
        it "Debe existir una lista con su cabeza" do 
            expect(@l1.root.value).to eq("Root")
        end
        it "La lista está doblemente enlazada" do 
            @l1.insert(8, 7, 6)
            expect(@l1.tail.previous.previous.value).to eq(8) 
        end
        it "La lista está doblemente enlazada" do 
            @l1.insert(8, 7, 6)
            expect(@l1.tail.previous.value).to eq(7) 
        end
        it "La lista está doblemente enlazada" do 
            @l1.insert(8, 7, 6)
            expect(@l1.root.previous).to eq(nil) 
        end
        it "pop" do 
            @l1.pop(1)
            expect(@l1.root.value).to eq(1) 
        end
        it "pull" do 
            @l1.pop(1)
            @l1.pull
            expect(@l1.root.value).to eq(1) 
        end
        it "probando to_s" do
            @l1.push("Pregunta 1")
            expect(@l1.to_s).to eq("Root\nPregunta 1\n")
        end
        it "Invertir lista" do
            @l1.insert(1,2,3,4)
            expect(@l1.reverse.root.next.value).to eq(3)
        end
    end
    
    describe "Comprobación Referencias Reales" do
        it "Construcción correcta" do
            expect(@r1.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler.\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edición (07, July 2013)\nISBN-13: ISBN-13: 978-1937785499\nISBN-13: ISBN-10: 1937785491\n")
            expect(@r2.to_s).to eq("Scott Chacon.\nPro Git 2009th Edition\nPro\nApress; 2009 edición (27, August 2009)\nISBN-13: ISBN-13: 978-1430218333\nISBN-13: ISBN-10: 1430218339\n")
            expect(@r3.to_s).to eq("David Flanagan, Yukihiro Matsumoto.\nThe Ruby Programming Language\nO’Reilly Media; 1 edición (04, February 2008)\nISBN-13: ISBN-10: 0596516177\nISBN-13: ISBN-13: 978-0596516178\n")
            expect(@r4.to_s).to eq("David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy.\nThe RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends\nThe Facets of Ruby\nPragmatic Bookshelf; 1 edición (25, December 2010)\nISBN-13: ISBN-10: 1934356379\nISBN-13: ISBN-13: 978-1934356371\n")
            expect(@r5.to_s).to eq("Richard E.\nSilverman Git Pocket Guide\nO’Reilly Media; 1 edición (02, August 2013)\nISBN-13: ISBN-10: 1449325866\nISBN-13: ISBN-13: 978-1449325862\n")
        end
    end
    
    describe "Comprobacion de construcción correcta de Libro" do
        it "Existe al menos un autor" do
            expect(@l2.autores).not_to eq(nil)
            expect(@l3.autores).not_to eq(nil)
            expect(@l4.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@l2.titulo).not_to eq(nil)
            expect(@l3.titulo).not_to eq(nil)
            expect(@l4.titulo).not_to eq(nil)
        end
        it "Existe o no una serie" do
            expect(@l2.serie).not_to eq(nil)
            expect(@l3.serie).to eq(nil)
            expect(@l4.serie).to eq(nil)
        end
        it "Existe editorial" do
            expect(@l2.editorial).not_to eq(nil)
            expect(@l3.editorial).not_to eq(nil)
            expect(@l4.editorial).not_to eq(nil)
        end
        it "Existe edicion" do
            expect(@l2.n_edicion).not_to eq(nil)
            expect(@l3.n_edicion).not_to eq(nil)
            expect(@l4.n_edicion).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@l2.fecha_publicacion).not_to eq(nil)
            expect(@l3.fecha_publicacion).not_to eq(nil)
            expect(@l4.fecha_publicacion).not_to eq(nil)
        end
        it "Existe isbn" do
            expect(@l2.isbn).not_to eq(nil)
            expect(@l3.isbn).not_to eq(nil)
            expect(@l4.isbn).not_to eq(nil)
        end
    end
    
    describe "Comprobación de construcción correcta de Periodical" do
        it "Existe al menos un autor" do
            expect(@p1.autores).not_to eq(nil)
            expect(@p2.autores).not_to eq(nil)
            expect(@p3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@p1.titulo).not_to eq(nil)
            expect(@p2.titulo).not_to eq(nil)
            expect(@p3.titulo).not_to eq(nil)
        end
        it "Existe o no una serie" do
            expect(@p1.serie).not_to eq(nil)
            expect(@p2.serie).to eq(nil)
            expect(@p3.serie).to eq(nil)
        end
        it "Existe editorial" do
            expect(@p1.editorial).not_to eq(nil)
            expect(@p2.editorial).not_to eq(nil)
            expect(@p3.editorial).not_to eq(nil)
        end
        it "Existe edicion" do
            expect(@p1.n_edicion).not_to eq(nil)
            expect(@p2.n_edicion).not_to eq(nil)
            expect(@p3.n_edicion).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@p1.fecha_publicacion).not_to eq(nil)
            expect(@p2.fecha_publicacion).not_to eq(nil)
            expect(@p2.fecha_publicacion).not_to eq(nil)
        end
        it "Existe ref(url o ref. periodico o ref. revista)" do
            expect(@p1.ref).not_to eq(nil)
            expect(@p2.ref).not_to eq(nil)
            expect(@p3.ref).not_to eq(nil)
        end
    end
    
    describe "Comprobción de clases" do
        it "Existencia de clases y pertenencia a jerarquía" do
          expect(@l2.instance_of? Biblio).to eq(false)
          expect(@l2.kind_of? Biblio).to eq(true)
          expect(@l2.instance_of? Libro).to eq(true)
          
          expect(@l3.instance_of? Biblio).to eq(false)
          expect(@l3.kind_of? Biblio).to eq(true)
          expect(@l3.instance_of? Libro).to eq(true)
          
          expect(@l4.instance_of? Biblio).to eq(false)
          expect(@l4.kind_of? Biblio).to eq(true)
          expect(@l4.instance_of? Libro).to eq(true)
          
          expect(@p1.instance_of? Biblio).to eq(false)
          expect(@p1.kind_of? Biblio).to eq(true)
          expect(@p1.instance_of? Periodical).to eq(true)
          
          expect(@p2.instance_of? Biblio).to eq(false)
          expect(@p2.kind_of? Biblio).to eq(true)
          expect(@p2.instance_of? Periodical).to eq(true)
         
          expect(@p3.instance_of? Biblio).to eq(false)
          expect(@p3.kind_of? Biblio).to eq(true)
          expect(@p3.instance_of? Periodical).to eq(true)
        end
    end

    describe "Enumerable y Comparable" do
        it "Comprobacion Enumerable en linkedlist" do
            expect(@l1.max).to eq('Root')
            @l1.push("larguestever")
            expect(@l1.map { |i| i.reverse } ).to eq(["tooR", "revetseugral"])
        end
        it "Comprabacion Comparable en Referencias" do
            expect(@p1==@p2).to eq(false)
            expect(@p1==@p1).to eq(true)
            expect(@p2==@p3).to eq(false)
        end
    end
end
           

      
