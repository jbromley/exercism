import kotlin.math.pow


object ResistorColorTrio {

    val powers : Map<Int, String> = mapOf(0 to "ohms",
					  1 to "kiloohms",
					  2 to "megaohms",
					  3 to "gigaohms",
					  4 to "teraohms",
					  5 to "petaohms",
					  6 to "exaohms")

    fun text(vararg input: Color): String {
	var r: Int = 10 * input[0].ordinal + input[1].ordinal
	var zeros: Int = input[2].ordinal

	if (r % 10 == 0) {
	    r /= 10
	    zeros++
	}
	r = (r * (10.0).pow(zeros % 3)).toInt()
	val units: String? = powers[zeros / 3]

	return "$r $units"
    }
}
