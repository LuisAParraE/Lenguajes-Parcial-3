import busqueda.LinkedList;
import Conjunto;
import Bolsa;

class Main {
	static function main() {
		Sys.print("Probar parte 1 o 2: ");
		var console = Sys.stdin();
		var input = console.readLine();
		var compra1 = new Bolsa();
		var compra2 = new Conjunto();

		if (input == "1") {
			var x = "manzana";
			compra1.agregar(x);
			compra2.agregar(x);

			if (!compra1.agregar(x)) {}
			if (!compra2.agregar(x)) {
				Sys.println('No se pueden agregar items repetidos: $x');
			}

			// trace(compra1.toString());
			// trace(compra2.toString());

			x = "cocacola";
			if (!compra1.agregar(x)) {}
			if (!compra2.agregar(x)) {
				Sys.println('No se pueden agregar items repetidos: $x');
			}

			x = "sprite";
			if (!compra1.agregar(x)) {}
			if (!compra2.agregar(x)) {
				Sys.println('No se pueden agregar items repetidos: $x');
			}

			x = "7up";
			if (!compra1.agregar(x)) {}
			if (!compra2.agregar(x)) {
				Sys.println('No se pueden agregar items repetidos: $x');
			}

			x = "caraotas";
			if (!compra1.agregar(x)) {}
			if (!compra2.agregar(x)) {
				Sys.println('No se pueden agregar items repetidos: $x');
			}

			if (!compra1.agregar(x)) {}
			if (!compra2.agregar(x)) {
				Sys.println('No se pueden agregar items repetidos: $x');
			}

			Sys.println("");
			Sys.println("LOS PRODUCTOS QUE LLEVAMOS SON:");
			Sys.println("");
			Sys.println(compra1.toString());
			Sys.println(compra2.toString());

			x = "manzana";
			if (compra1.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento: $x');
			}

			if (compra2.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento:: $x');
			}

			if (compra1.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento: $x');
			}

			if (compra2.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento:: $x');
			}

			x = "7up";
			if (compra1.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento: $x');
			}

			if (compra2.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento:: $x');
			}

			x = "caraotas";
			if (compra1.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento: $x');
			}

			if (compra2.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento:: $x');
			}

			x = "sprite";
			if (compra1.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento: $x');
			}

			if (compra2.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento:: $x');
			}

			x = "cocacola";
			if (compra1.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento: $x');
			}

			if (compra2.remover(x)) {
				Sys.println('Se elimino el producto: $x');
			} else {
				Sys.println('No existe el elemento:: $x');
			}

			compra1.vacio();
			compra2.vacio();
		} else {
			var grafo = new LinkedList();
			var x:Elemento = {
				"x": 1,
				"l": [2, 3, 7]
			}

			grafo.agregar_nodo(x);

			var x:Elemento = {
				"x": 2,
				"l": [1, 5]
			}

			grafo.agregar_nodo(x);

			var x:Elemento = {
				"x": 7,
				"l": [1, 3]
			}

			grafo.agregar_nodo(x);

			var x:Elemento = {
				"x": 3,
				"l": [1, 7, 5, 4]
			}

			grafo.agregar_nodo(x);

			var x:Elemento = {
				"x": 5,
				"l": [2, 3, 6]
			}

			grafo.agregar_nodo(x);

			var x:Elemento = {
				"x": 6,
				"l": [5, 4]
			}

			grafo.agregar_nodo(x);

			var x:Elemento = {
				"x": 4,
				"l": [3, 6]
			}

			grafo.agregar_nodo(x);

			var busqueda1 = new DFS(grafo);
			var busqueda2 = new BFS(grafo);

			grafo.print_lista_enlazad();

			Sys.println("DFS: " + busqueda1.buscar(6, 3));
			Sys.println("BFS: " + busqueda2.buscar(6, 3));
		}
	}
}
