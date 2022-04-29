import Math;

class Main {
	static function main() {
		var a = Sys.args()[0];
		var n = Std.parseInt(a) + 1;
		var tn:Int = 0;

		if (n >= 3)
			tn = trib(n);
		else
			tn = n;

		var ca = cat_log(tn - 1);
		var p = Math.floor(ca);
		Sys.println('Ohnyo: $p');
	}

	static function trib(n:Int):Int {
		var f0 = 0;
		var f1 = 1;
		var f2 = 2;
		var r = 0;

		for (i in 3...(n + 1)) {
			r = f0 + f1 + f2;
			if (i == n)
				break;
			if (i % 3 == 0)
				f0 = r;
			if (i % 3 == 1)
				f1 = r;
			if (i % 3 == 2)
				f2 = r;
		}

		return r;
	}

	static function cat_log(n:Int):Float {
		var c1:Float = 0;

		if (n == 0)
			return 1;

		for (i in 1...(n + 1)) {
			var aux = 2 * (2 * i + 1) / (i + 2);
			c1 = c1 + (Math.log(aux) / Math.log(2));
		}
		return c1;
	}
}
