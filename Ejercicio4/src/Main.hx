import resources.Class;

class Main {
	static function main() {
		var clases:Array<Class> = [];

		while (true) {
			Sys.print("<Class Simulator: Reborn> ");

			var console = Sys.stdin();
			var entrada:String = console.readLine();
			var tokens = entrada.split(" ");

			try {
				if (tokens[0] == "CLASS") {
					if (exist_class(clases, tokens[1])) {
						Sys.println("Error: Clase Ya definida");
					} else {
						if (tokens.contains(":")) {
							if (exist_class(clases, tokens[3])) {
								clases.push(new Class(tokens[1], tokens.slice(4), get_class(clases, tokens[3])));
							} else {
								Sys.println("Error: Herencia de Clase Inexistente");
							}
						} else {
							clases.push(new Class(tokens[1], tokens.slice(2), null));
						}
					}
				} else if (tokens[0] == "DESCRIBIR") {
					// trace("Entre a describir");
					if (!exist_class(clases, tokens[1])) {
						Sys.println("Error: Clase Inexistente");
					} else {
						var aux = get_class(clases, tokens[1]);

						for (m in aux.get_funciones()) {
							var nombre = m.name;
							var dueno = m.owner;
							Sys.println('$nombre -> $dueno :: $nombre');
						}
					}
				} else if (tokens[0] == "SALIR") {
					break;
				}
			} catch (e) {
				Sys.println("Error: Entrada no valida");
			}
		}
	}

	public static function exist_class(clases:Array<Class>, c:String):Bool {
		for (element in clases) {
			if (element.get_name() == c) {
				return true;
			}
		}

		return false;
	}

	public static function get_class(clases:Array<Class>, c:String):Class {
		for (element in clases) {
			if (element.get_name() == c) {
				return element;
			}
		}

		return null;
	}
}
