require 'bibliografia'
require 'spec_helper'

describe Biblio do
    
    before :each do
        @b1 = Biblio.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1, "fecha publicacion", ["isbn1", "isbn2"])
        @b2 = Biblio.new("autor1", "titulo", nil, "editorial", 1, "fecha publicacion", "isbn1")
        @b3 = Biblio.new(["autor1","autor2"], "titulo", nil, "editorial", 1, "fecha publicacion", ["isbn1", "isbn2"])
    end
    
    describe "Comprobación de una correcta construcción" do
        it "Existe al menos un autor" do
            expect(@b1.autor).not_to eq(nil)
            expect(@b2.autor).not_to eq(nil)
            expect(@b3.autor).not_to eq(nil)
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
            expect(@b1.edicion).not_to eq(nil)
            expect(@b2.edicion).not_to eq(nil)
            expect(@b3.edicion).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@b1.fecha).not_to eq(nil)
            expect(@b2.fecha).not_to eq(nil)
            expect(@b3.fecha).not_to eq(nil)
        end
        it "Existe isbn" do
            expect(@b1.isbn).not_to eq(nil)
            expect(@b2.isbn).not_to eq(nil)
            expect(@b3.isbn).not_to eq(nil)
        end
    end
    
    describe "Comprobación de un correcto funcionamiento de los métodos" do
        it "Test método autor" do
            expect(@b1.autor).to eq(["autor1","autor2","autor3"])
            expect(@b2.autor).to eq("autor1")
            expect(@b3.autor).to eq(["autor1","autor2"])
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
            expect(@b1.edicion).to eq(1)
            expect(@b2.edicion).to eq(1)
            expect(@b3.edicion).to eq(1)
        end
        it "Test método fecha" do
            expect(@b1.fecha).to eq("fecha publicacion")
            expect(@b2.fecha).to eq("fecha publicacion")
            expect(@b3.fecha).to eq("fecha publicacion")
        end
        it "Test método isbn" do
            expect(@b1.isbn).to eq(["isbn1", "isbn2"])
            expect(@b2.isbn).to eq("isbn1")
            expect(@b3.isbn).to eq(["isbn1", "isbn2"])
        end
        it "Test método to_s (nos devuelve una referencia formateada)" do
            #No esta completa del todo la expectativa ya que no sé como dejar la referencia formatea, lo dejo así de momento para
            #que tengas libertad para hacer el to_s como quieras.
            expect(@b1.to_s).to eq(@b1.to_s)
            expect(@b2.to_s).to eq(@b2.to_s)
            expect(@b3.to_s).to eq(@b3.to_s)
        end
    end
    
    describe "Lanzamiento de errores al construir" do
      it "Debe haber un autor" do
          expect(Biblio.new(nil, "titulo", "serie", "editorial", 1, "fecha publicacion", ["isbn1", "isbn2"])).to raise_error(ArgumentError)
      end
      it "Debe haber un titulo" do
          expect(Biblio.new("autor1" , nil, "serie", "editorial", 1, "fecha publicacion", ["isbn1", "isbn2"])).to raise_error(ArgumentError)
      end
      it "Debe haber una editorial" do
          expect(Biblio.new(["autor1","autor2","autor3"], "titulo", "serie",nil , 1, "fecha publicacion", ["isbn1", "isbn2"])).to raise_error(ArgumentError)
      end
      it "Debe haber una edicion" do
          expect(Biblio.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial",nil , "fecha publicacion", ["isbn1", "isbn2"])).to raise_error(ArgumentError)
      end
      it "Debe haber una fecha de publicacion" do
          expect(Biblio.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1,nil , ["isbn1", "isbn2"])).to raise_error(ArgumentError)
      end
    end
      
end