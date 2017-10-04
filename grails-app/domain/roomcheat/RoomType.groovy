package roomcheat

class RoomType {

    String name
    Integer numberOfBeds
    String attributes

    static hasMany = [ price : Price ]
    static constraints = {
    }
}
