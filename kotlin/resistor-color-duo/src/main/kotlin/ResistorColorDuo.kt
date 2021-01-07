object ResistorColorDuo {

    fun value(vararg colors: Color): Int {
	return 10 * Color.values().indexOf(colors[0]) + Color.values().indexOf(colors[1])
    }
}
