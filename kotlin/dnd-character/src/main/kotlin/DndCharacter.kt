import kotlin.random.Random


class DndCharacter {

    val strength: Int = DndCharacter.ability()
    val dexterity: Int = DndCharacter.ability()
    val constitution: Int = DndCharacter.ability()
    val intelligence: Int = DndCharacter.ability()
    val wisdom: Int = DndCharacter.ability()
    val charisma: Int = DndCharacter.ability()
    val hitpoints: Int = 10 + DndCharacter.modifier(constitution)

    companion object {

        fun ability(): Int {
	    return List(4) { Random.nextInt(1, 7) }.sorted().drop(1).sum()
        }

        fun modifier(score: Int): Int {
            return score / 2 - 5
        }
    }

}
