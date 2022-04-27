package busqueda;

typedef Elemento = {
	var x:Int;
	var l:Array<Int>;
}

class LinkedList {
	var lista_enlazada:Array<Elemento> = new Array();

	public function new() {}

	public function agregar_nodo(nodo:Elemento):Bool {
		var aux = true;
		for (element in this.lista_enlazada) {
			if (element.x == nodo.x) {
				aux = false;
				break;
			}
		}

		if (aux) {
			this.lista_enlazada.push(nodo);
		}

		return aux;
	}

	/*public function eliminar_nodo(value:Int):Bool {
		var i = 0;
		while (i < this.lista_enlazada.length) {
			if (this.lista_enlazada[i].x == value) {
				this.lista_enlazada[i]
			}
		}

		if (aux) {
			this.lista_enlazada.push(nodo);
		}

		return true;
	}*/
	public function print_lista_enlazad():Void {
		Sys.println("GRAFO:");
		for (element in this.lista_enlazada) {
			Sys.print(element.x);
			Sys.print(" : ");
			Sys.println(element.l);
		}
	}

	public function get_lista_enlazada():Array<Elemento> {
		return this.lista_enlazada;
	}
}

abstract class Busqueda {
	abstract public function buscar(inicio:Int, llegada:Int):String;
}

class BFS extends Busqueda {
	var grafo:LinkedList = null;

	public function new(grafo:LinkedList) {
		this.grafo = grafo;
	}

	public function buscar(inicio:Int, llegada:Int):String {
		var visited:Array<Int> = [];
		var queue:Array<Int> = [];
		var camino:Array<Int> = [];

		var lista = this.grafo.get_lista_enlazada();
		var found = false;

		visited.push(inicio);
		queue.push(inicio);

		while (queue.length > 0) {
			var pos = queue.shift();

			camino.push(pos);

			if (pos == llegada) {
				found = true;
				break;
			}

			for (element in lista) {
				if (element.x == pos) {
					for (j in element.l) {
						if (!visited.contains(j)) {
							visited.push(j);
							queue.push(j);
						}
					}
				}
			}
		}

		if (found) {
			return camino.join("-");
		} else {
			return "-1";
		}
	}
}

class DFS extends Busqueda {
	var grafo:LinkedList = null;

	public function new(grafo:LinkedList) {
		this.grafo = grafo;
	}

	private function dfs() {}

	public function buscar(inicio:Int, llegada:Int):String {
		var visited:Array<Int> = [];
		var stack:Array<Int> = [];
		var camino:Array<Int> = [];

		var lista = this.grafo.get_lista_enlazada();
		var found = false;

		stack.push(inicio);

		while (stack.length > 0) {
			var pos = stack.pop();

			if (!visited.contains(pos)) {
				visited.push(pos);
				camino.push(pos);

				if (pos == llegada) {
					found = true;
					break;
				}

				for (element in lista) {
					if (element.x == pos) {
						for (j in element.l) {
							if (!visited.contains(j)) {
								stack.push(j);
							}
						}
					}
				}
			} else {
				continue;
			}
		}
		if (found) {
			return camino.join("-");
		} else {
			return "-1";
		}
	}
}
