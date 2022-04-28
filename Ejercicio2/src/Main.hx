import haxe.Exception;
import sys.thread.Lock;
import sys.thread.Mutex;
import sys.thread.Thread;
import sys.FileSystem;

class Main {
	static function main() {
		while (true) {
			try {
				Sys.print("Indique la opción a probar 1 o 2: ");
				var console = Sys.stdin();
				var entrada:String = console.readLine();
				var opcion = Std.parseInt(entrada);

				if (opcion == 1) {
					sumaMatrices();
				} else if (opcion == 2) {
					var directorios = sumaDirectorios(null);
					Sys.println('Cantidad de Archivos en el Rama : $directorios');
				} else {
					throw new Exception('Opción invalida');
				}

				break;
			} catch (e) {
				Sys.println("Error: Entrada Invalida");
			}
		}
	}

	public static function sumaMatrices() {
		var matriz1:Array<Array<Int>> = [];
		var matriz2:Array<Array<Int>> = [];
		var sumArray:Array<Array<Int>> = [];

		var console = Sys.stdin();
		var entrada:String = "";
		var ancho:Int = 0;
		var alto:Int = 0;

		while (true) {
			try {
				Sys.println("Indique el tamaño de las 2 matrices:");
				Sys.print("Ancho: ");
				entrada = console.readLine();
				ancho = Std.parseInt(entrada);
				Sys.print("Alto: ");

				entrada = console.readLine();
				alto = Std.parseInt(entrada);
				if (alto < 1 || ancho < 1) {
					throw new Exception('Numeros menos a 1');
				}

				break;
			} catch (e) {
				Sys.println("Error: Entrada Invalida");
			}
		}

		while (true) {
			try {
				matriz1 = [];
				var row:Array<Int> = [];
				var aux:Int;
				Sys.println("Matriz 1");
				for (i in 1...(alto + 1)) {
					row = [];
					for (j in 1...(ancho + 1)) {
						Sys.print('valor[$i][$j]: ');
						entrada = console.readLine();
						aux = Std.parseInt(entrada);
						row.push(aux);
					}
					matriz1.push(row);
				}

				break;
			} catch (e) {
				Sys.println("Error: Entrada Invalida");
			}
		}

		while (true) {
			try {
				matriz2 = [];
				var row:Array<Int> = [];
				var aux:Int;
				Sys.println("Matriz 2");
				for (i in 1...(alto + 1)) {
					row = [];
					for (j in 1...(ancho + 1)) {
						Sys.print('valor[$i][$j]: ');
						entrada = console.readLine();
						aux = Std.parseInt(entrada);
						row.push(aux);
					}
					matriz2.push(row);
				}

				break;
			} catch (e) {
				Sys.println("Error: Entrada Invalida");
			}
		}

		var prueba = new Mutex();
		var lock = new Lock();

		for (i in 0...alto) {
			sumArray.push([]);
		}

		for (i in 0...alto) {
			Thread.create(() -> {
				var indice = i;
				var aux:Array<Int> = [];
				for (j in 0...ancho) {
					var sum = 0;
					sum = matriz1[indice][j] + matriz2[indice][j];
					aux.push(sum);
				}

				while (true) {
					if (prueba.tryAcquire()) {
						sumArray[indice] = aux;
						break;
					}
				}

				lock.release();
				prueba.release();
			});
		}

		for (i in 0...alto) {
			lock.wait();
		}

		Sys.println("MATRIZ 1");
		for (i in matriz1) {
			for (j in i) {
				Sys.print('$j ');
			}
			Sys.println("");
		}

		Sys.println("");
		Sys.println("MATRIZ 2");
		for (i in matriz2) {
			for (j in i) {
				Sys.print('$j ');
			}
			Sys.println("");
		}

		Sys.println("");
		Sys.println("MATRIZ 1 + MATRIZ 2");
		for (i in sumArray) {
			for (j in i) {
				Sys.print('$j ');
			}
			Sys.println("");
		}
	}

	public static function sumaDirectorios(path:String):Int {
		var files:Array<String> = [];
		var counter:Int = 0;
		var archivos:Int = 0;
		var prueba = new Mutex();
		var lock = new Lock();

		if (path != null) {
			// trace("Entre al thread");
			files = FileSystem.readDirectory(path);
			// trace(files);
			if (files.length == 0) {
				return 0;
			} else {
				for (f in files) {
					// //trace(f);
					try {
						var new_dir = path + "/" + f;
						if (FileSystem.isDirectory(new_dir)) {
							Thread.create(() -> {
								// trace("Se creó thread");
								var path_thread = new_dir;
								var archivos_thread:Int = sumaDirectorios(path_thread);

								while (true) {
									// //trace(path_thread);
									if (prueba.tryAcquire()) {
										// trace("Adquiri el mutex");
										archivos = archivos + archivos_thread;
										break;
									}
								}

								// trace("libero");
								lock.release();
								prueba.release();
							});

							counter++;
						} else {
							archivos++;
						}
					} catch (e) {
						// trace("Lanzó excepcion");
					}
				}

				for (i in 0...counter) {
					// trace("espero");
					lock.wait();
				}

				// trace("Sali del Thread");
				return archivos;
			}
		} else {
			var entrada:String = "";
			while (true) {
				try {
					Sys.print("Indique la Dirección de Directorio: ");
					var console = Sys.stdin();
					entrada = console.readLine();

					if (FileSystem.exists(entrada)) {
						break;
					} else {
						Sys.println("Error: Dirección Inexistente.");
						throw new Exception('Opción invalida');
					}
				} catch (e) {
					Sys.println("Error: Entrada Invalida");
				}
			}

			files = FileSystem.readDirectory(entrada);
			// trace(files);
			if (files.length == 0) {
				return 0;
			} else {
				for (f in files) {
					// //trace(f);
					try {
						var new_dir = entrada + "/" + f;
						if (FileSystem.isDirectory(new_dir)) {
							Thread.create(() -> {
								// trace("Se creó thread");
								var path_thread = new_dir;
								var archivos_thread:Int = sumaDirectorios(path_thread);

								while (true) {
									// trace("Ciclo del Mutex");
									if (prueba.tryAcquire()) {
										// trace("Adquiri el mutex");
										archivos = archivos + archivos_thread;
										break;
									}
								}

								// trace("libero");
								prueba.release();
								lock.release();
							});

							counter++;
						} else {
							archivos++;
						}
					} catch (e) {
						// trace("Lanzó excepcion");
					}
				}

				for (i in 0...counter) {
					// trace("espero");
					lock.wait();
				}

				return archivos;
			}
		}
	}
}
