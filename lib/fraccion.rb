require "./lib/gcd.rb"

class Fraccion 
  
    attr_reader :numer, :denomin
  
   def initialize(n,d) 
    @numer, @denomin = n, d
   end
  
   
    def num()
      return @numer 											#Getter del num
    end

    def denom()
      return @denomin											#Getter del denom
    end
  
    def simplificar
      aux = gcd(self.numer, self.denomin)                                                        #MCD entre num y denom
      Fraccion.new(self.numer/aux, self.denomin/aux) 
												  #Simplificamos la fraccion que le pasemos
    end 
   
    def to_s
      "#{@numer}/#{@denomin}"										#Mostramos los atributos en un string
    end
   
    def to_f
      @numer/@denomin											#Mostramos los atributos en float
    end
   
    #############################################################
    
   def ==(other)										#Comparamos la fraccion implicita, con la que le pasamos como parametro   
    other.simplificar
    self.simplificar
      if ((@numer == other.numer) and (@denomin == other.denomin))					#Si el numerador y el denominador de la implicita coinciden con los 
	  true
		#puts "Las fracciones #{self.to_s} y #{other.to_s} son iguales"				#de la pasada por parametro, entonces las fracciones son iguales
      else 											#Si no, son distintas.
	    false
		#puts "Las fracciones #{self.to_s} y #{other.to_s} son distintas"
      end  
    end
  
  
  def absoluto											#Sobrecargamos la funcion Abs para que pueda comparar fracciones
    @numer = @numer.abs
    @denomin = @denomin.abs
   # Fraccion.new(n,d)
  end
  
  
  def reciprocal										#Obtiene la fraccion reciproca a la implicita
    aux = self.num()
    numer = self.denom()
    denomin = aux
  end
  
  
  def opuesto
    @numer = -@numer
  end
  
  ################################################################################
  
  def mcm(n, m)                                                                              	#Necesitamos hallar el mcm para la suma y la resta
    aux=gcd(n,m)
    (n/aux)*m 
  end

  def /(other) 				                                                       #Realizamos la division de la fraccion implicita con recibida como parametro                                                                                
    temp = Fraccion.new(@numer*other.denomin, @denomin*other.numer)
    temp.simplificar
  end
  
  def +(other)                                                                     		#Realizamos la suma de la fraccion implicita con recibida como parametro          
    aux = mcm(@denomin, other.denomin)                                                    
    temp = Fraccion.new(((aux/@denomin)*@numer)+((aux/other.denomin)*other.numer),aux)               
    temp.simplificar
  end
        
  def -(other)                                                                        	#Realizamos la resta de la fraccion implicita con recibida como parametro                                                                       
    aux = mcm(@denomin, other.denomin)
    temp = Fraccion.new(((aux/@denomin)*@numer)-((aux/other.denomin)*other.numer),aux)
    temp.simplificar                                 
  end
   
  def *(other)                                                                     		#Realizamos la multiplicacion de la fraccion implicita con recibida como parametro                                                                                
   temp=Fraccion.new(@numer*other.numer, @denomin*other.denomin) 
   temp.simplificar                                                
  end 
               
  
   
  
  ##########################################################
  
   def %(other)											#Obtenemos el resto de la division de dos fracciones								
      aux1 = self.numer * other.denomin								#Multiplicamos el numerador de la primera entre el denominador de la segunda
      aux2 = self.denomin * other.numer								#Multiplicamos el denominador de la primera entre el numerador de la segunda
      resto = aux1%aux2										#Obtenemos el Resto de la fraccion resultante
   end  
  
   def <(other)											#Comprobamos que la matriz implicita es menor que la recibida.
      if (self.numer/self.denomin) < (other.numer/other.denomin) 
	true  
      else
	false				
      end
   end
    
   def >(other)
    if((self.numer/self.denomin)<(other.numer/other.denomin))						#Comprobamos que la matriz implicita es mayor que la recibida.
      false				
    else
      true				
    end
   end
 
   def <=(other)											#Comprobamos que la matriz implicita es menor o igual que la recibida.
      if((self.numer/self.denomin)<=(other.numer/other.denomin))
	true				
      else  
	false
      end
    end
 
    def >=(other)											#Comprobamos que la matriz implicita es mayor o igual que la recibida.
	if((self.numer/self.denomin)>=(other.numer/other.denomin))
	  true
	else 
	  false
	end
    end
end
