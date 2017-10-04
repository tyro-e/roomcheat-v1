package roomcheat

import grails.gorm.transactions.Transactional

import java.util.Random


@Transactional
class HotelNamesService {

    def serviceMethod( String location )
    {
        println("service_method called")
        def results = Hotel.findAll() {
            city == location
        }

        def randomGenerator = new Random()

        def avmap = [:]

        def citytot = 0.0
        def nums = 0.0
        results.each( ) {

            println "$it.name"
            println "$it.roomType.name"

            for (roomType in it.roomType ) {

                def avlist = []
                println roomType.name

                def hotelprice = 0.0
                def numhotels = 0.0
                for( price in roomType.price ) {
                    hotelprice += price.cost
                    numhotels++ ;
                }
                def avg = hotelprice / numhotels
                avlist << avg

                //get the price for the date (should be by the API call)
                float diff = randomGenerator.nextInt(30) //Should be price - average
                diff = (diff / (diff + avg )) * 100.0
                nums++
                citytot += diff
                avlist << diff
                avmap[it.name] = avlist
            }
        }
        citytot = citytot / nums

        def avlist = []
        avlist << citytot
        avmap["GEN"] = avlist
        println citytot
        println avmap

        File f = new File( "SeachOutputListing.txt")
        f.newWriter().withWriter { w ->
            w << avmap
        }
        avmap
    }


}
