package roomcheat

class Hotel {

    String name
    String address
    String city
    Float longitude
    Float latitude
    String attributes
    Integer starRating

	static hasMany = [ roomType : RoomType ]

    static constraints = {

    }
}