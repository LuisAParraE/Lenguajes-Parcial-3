package resources;

// Struct que almacena los metodos
typedef Method = {
	var name:String;
	var owner:String;
}

// Clase que modela las clases
// Posee un nombre: name
// Posee un arreglo de Struct Method: funciones
class Class {
	var name:String = null;
	var funciones:Array<Method> = [];

	// Constructor
	public function new(name:String, methods:Array<String>, herencia:Class) {
		this.name = name;

		// Si no posee herencia
		if (herencia == null) {
			for (s in methods) {
				var x:Method = {
					"name": s,
					"owner": name,
				}

				this.funciones.push(x);
			}
		} else {
			// Si posee herencia
			for (i in herencia.get_funciones()) {
				if (methods.contains(i.name)) {
					var x:Method = {
						"name": i.name,
						"owner": name,
					}
					this.funciones.push(x);
				} else {
					this.funciones.push(i);
				}
			}

			for (m in methods) {
				var is_in = false;
				for (f in this.funciones) {
					if (f.name == m) {
						is_in = true;
						break;
					}
				}

				if (!is_in) {
					var x:Method = {
						"name": m,
						"owner": name,
					}

					this.funciones.push(x);
				}
			}
		}
	}

	public function get_funciones():Array<Method> {
		return this.funciones;
	}

	public function get_name():String {
		return this.name;
	}
}
