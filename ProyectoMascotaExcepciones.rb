require "test/unit"
class Mascota
	attr_accessor :nom_mascota, :edad, :color, :nom_dueño, :ape_dueño, :dni
	def initialize(nom_mascota, edad, color, nom_dueño, ape_dueño, dni)
		@nom_mascota, @edad, @color, @nom_dueño, @ape_dueño, @dni = nom_mascota, edad, color, nom_dueño, ape_dueño, dni
	end
	def calcular_puntaje
		
	end
	def puntaje_extra_final
		if calcular_promedio > 7 
			calcular_puntaje + 2
		else
			calcular_puntaje
		end
	end
		
	def calcular_promedio
		calcular_puntaje/3
	end	
	def obtener_categoria		
	end


end

class Guardian < Mascota
	attr_accessor :puntaje_postura, :puntaje_raza, :puntaje_habilidad
	def initialize(nom_mascota, edad, color, nom_dueño, ape_dueño, dni, puntaje_postura, puntaje_raza, puntaje_habilidad)
		super(nom_mascota, edad, color, nom_dueño, ape_dueño, dni)
		@puntaje_postura, @puntaje_raza, @puntaje_habilidad = puntaje_postura, puntaje_raza, puntaje_habilidad
	end

	def calcular_puntaje
	(puntaje_postura + puntaje_raza + puntaje_habilidad)
	end
	def obtener_categoria
			"Guardian"
	end
end

class Compania < Mascota
	attr_accessor :puntaje_postura, :puntaje_raza, :puntaje_pelaje
	def initialize(nom_mascota, edad, color, nom_dueño, ape_dueño, dni, puntaje_postura, puntaje_raza, puntaje_pelaje)
		super(nom_mascota, edad, color, nom_dueño, ape_dueño, dni)
		@puntaje_postura, @puntaje_raza, @puntaje_pelaje = puntaje_postura, puntaje_raza, puntaje_pelaje
	end
	def calcular_puntaje
	(puntaje_postura + puntaje_raza + puntaje_pelaje)
	end
	def obtener_categoria
			"Compania"
	end
end


class Comun < Mascota
	attr_accessor :puntaje_postura, :puntaje_publico, :puntaje_disciplina
	def initialize(nom_mascota, edad, color, nom_dueño, ape_dueño, dni, puntaje_postura, puntaje_publico, puntaje_disciplina)
		super(nom_mascota, edad, color, nom_dueño, ape_dueño, dni)
		@puntaje_postura, @puntaje_publico, @puntaje_disciplina = puntaje_postura, puntaje_publico, puntaje_disciplina
		
	end
	def calcular_puntaje
	(puntaje_postura + puntaje_publico + puntaje_disciplina)
	end
	def obtener_categoria
			"Comun"
	end

end

class Asociacion 
	attr_accessor :arreglo_perro
	def initialize
		@arreglo_perro = []
	end
	def registrar(perros)
		if not validar_dni(perros.dni)
		arreglo_perro.push(perros)
		else
			puts "================================================================"
			puts "El DNI #{perros.dni} de #{perros.nom_dueño} #{perros.ape_dueño} ya se encuentra registrado"
			puts "================================================================"
		end
		begin
			validar_edad(perros.edad)
			arreglo_perro.push(perros)
			rescue Exception
			puts "El perro no cuenta con el requisito de edad para participar"

		end
	
	def obtener_participantes
		return arreglo_perro
	end
	def obtener_perro_categoria(categoria)
		dog = []
		for p in arreglo_perro
			if p.obtener_categoria==categoria
				dog.push(p)
			end
		end
		return dog
	end
	def validar_edad
		if edad > 12 
			raise "La mascota no cumple con el requisito de edad"
		end
	end
		
	end
	def mascota_ganador
		max = 0 
		obj = nil
		for p in arreglo_perro
			if p.puntaje_extra_final > max
				max = p.puntaje_extra_final
				obj = p
			end
		end
		return obj
	end
	def obtener_cantidad
		dog.size
	end
	def validar_dni(dni)
 		encuentra = false
		for p in arreglo_perro
			if p.dni == dni
				encuentra = true
				break
			end
		end
		return encuentra
	end

end

class Factory
	def self.crear_perro(categoria, *arg)
		case categoria
			when "Guardian"
				return Guardian.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8])
			when "Compania"
				return Compania.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8])
			when "Comun"
				return Comun.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8])
		end
	end

end

#class TestPerros < Test::Unit::TestCase
#	def test_perro		

p1 = Factory.crear_perro("Guardian", "Boby", "26 meses", "Blanco", "Angelo", "Carrasco", "71197137", 10, 10,10)
p2 = Factory.crear_perro("Guardian", "Roco", "30 meses", "Plomo", "Maria", "Gamboa", "09786587", 7, 7, 9)
p3 = Factory.crear_perro("Compania", "Manchas", "20 meses", "Marron", "Anderson", "Berrocal", "09876543", 10, 10, 8)
p4 = Factory.crear_perro("Compania", "Vladi", "40 meses", "Negro", "Fernando", "Cruz", "56382601", 6, 6, 7)
p5 = Factory.crear_perro("Comun", "Bambi", "34 meses", "Naranja", "Junior", "Ponce", "54831098", 8, 9, 9)
p6 = Factory.crear_perro("Comun", "Firulais", "29 meses", "Blanco", "Orlando", "Cevallos", "83120956", 7, 3, 10)
		#assert_equal 32, p1.puntaje_extra_final
		

can = Asociacion.new
can.registrar(p1)
can.registrar(p2)
can.registrar(p3)
can.registrar(p4)
can.registrar(p5)
can.registrar(p6)

listar = can.obtener_participantes
	puts "===================================================="
	puts "LISTA DE PARTICIPANTES"
	puts "===================================================="
	for p in listar
		puts "#{p.nom_mascota} y su dueño #{p.nom_dueño} #{p.ape_dueño}"	
	end
		#assert_not_nil listar
		#assert_equal 6, listar.size

canino = can.arreglo_perro
	puts "===================================================="
	puts "Puntaje de los perros"
	puts "===================================================="
	for p in canino	
		puts "#{p.nom_mascota} de #{p.edad} edad, es de color #{p.color} y su puntaje es:	#{p.puntaje_extra_final}"
	end



perros_categoria = can.obtener_perro_categoria("Guardian")
	puts "===================================================="
	puts "Participante de la categoria Guardian"
	puts "===================================================="
	for p in perros_categoria
		puts "#{p.nom_mascota}	#{p.edad}	#{p.color}	#{p.nom_dueño}	#{p.ape_dueño}	#{p.dni}	#{p.puntaje_extra_final}"
	end
		#assert_equal 2, perros_categoria.size

campeon = can.mascota_ganador
	puts "===================================================="
	puts "					CAMPEON                           "
	puts "===================================================="
	puts "El perro ganador es: #{campeon.nom_mascota} con un puntaje de:#{campeon.puntaje_extra_final} puntos"
		#assert_not_nil campeon
		#assert_equal "Boby", campeon.nom_mascota
		

cantidad = can.obtener_perro_categoria("Guardian")
	puts "===================================================="
	puts "Total de participantes: #{cantidad.size}"
		#assert_equal 2, cantidad.size
	#end
#end