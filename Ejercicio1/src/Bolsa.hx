class Bolsa implements Coleccion {
	var bolsita = new Array();

	public function new() {}

	public function agregar(element):Bool {
		this.bolsita.push(element);
		return true;
	}

	public function remover(element):Bool {
		var aux = false;

		if (this.bolsita.contains(element)) {
			while (this.bolsita.remove(element)) {
				continue;
			}
			aux = true;
		}

		return aux;
	}

	public function vacio():Void {
		if (0 == this.bolsita.length) {
			Sys.println("La bolsa de compras esta vacia");
		}
	}

	public function toString():String {
		return ("Bolsa: " + this.bolsita.join(","));
	}
}
