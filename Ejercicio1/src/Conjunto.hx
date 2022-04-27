class Conjunto implements Coleccion {
	var conjuntito = new Array();

	public function new() {}

	public function agregar(element):Bool {
		var aux = false;

		if (!this.conjuntito.contains(element)) {
			this.conjuntito.push(element);
			aux = true;
		}

		return aux;
	}

	public function remover(element):Bool {
		var aux = false;

		if (this.conjuntito.contains(element)) {
			while (this.conjuntito.remove(element)) {
				continue;
			}
			aux = true;
		}

		return aux;
	}

	public function vacio():Void {
		if (0 == this.conjuntito.length) {
			Sys.println("El conjuto de compras esta vacia");
		}
	}

	public function toString():String {
		return ("Conjunto: " + this.conjuntito.join(","));
	}
}
