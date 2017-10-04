package roomcheat

import groovy.json.JsonSlurper
import java.util.Random
import roomcheat.User

class BootStrap {

    def init = { servletContext ->

        def user = User.findOrSaveWhere(fullName:"User", email:"user@hotmail.com", password:"root",role:"ROLE_USER")
        def admin = User.findOrSaveWhere(fullName:"Admin", email:"admin@hotmail.com", password:'root',role:"ROLE_ADMIN")

        def price1 = new Price( cost:'1.0' , day: new Date() , delta:'0.25').save()
        def price2 = new Price( cost:'2.0' , day: new Date() , delta:'0.25').save()


        def f = new File("tk.josn" )

        println f.getAbsolutePath()

        def slurper = new JsonSlurper()
        def jsonText = f.getText()
        def json = slurper.parseText( jsonText )


        println json.results.class

        def randomGenerator = new Random();

        for( hotel in json.results )
        {
            def name = hotel.name
            println hotel.name

            println hotel.geometry.location.lat
            println hotel.geometry.location.lng
            println hotel.rating
            println hotel.vicinity

            println hotel.types

            def mydate = Date.parse("yyyy-MM-dd hh:mm:ss", "2017-08-09 1:23:45")

            def roomType = new RoomType( name:'deluxe' , numberOfBeds:'2' ,
                    attributes:'{ cosy suite }')

            def stRoomPrice = 50 + randomGenerator.nextInt(70)
            30.times {
                int randomInt = randomGenerator.nextInt(30)
                int es = 60.0 + randomGenerator.nextInt(10)
                def cost = 60.0 + randomInt
                def diff = cost - 60.0
                diff =  (diff == 0 ) ?  0 : diff
                def delta = (diff / 60.0) * 100.0
                def price = new Price( cost : cost , day : mydate++ , delta : delta , estim : es ).save()
                roomType.addToPrice( price )
            }

            roomType.save()

            def hotel1 = new Hotel( name : hotel.name , longitude : hotel.geometry.location.lng ,
                    latitude : hotel.geometry.location.lat , address : hotel.vicinity,
                    city : 'London' , starRating : '1' , attributes : hotel.types ).
                    addToRoomType( roomType ).
                    save()


        }
        /*println( price1 )

        def roomType = new RoomType( name:'deluxe' , numberOfBeds:'2' , attributes:'{ cosy suite }').
                addToPrice( price1 ).
                addToPrice( price2 ).
                save()

        log.info( "After World")

        def hotel1 = new Hotel( name : 'firstHotel' , longitude : '1.0' , latitude : '1.0' , address : 'address',
                                city : 'London' , starRating : '1' , attributes : 'good').
            addToRoomType( roomType )

        hotel1.save(flush:true)

        if (!hotel1.save()) {
            hotel1.errors.allErrors.each {
                println it
            }
        }

        println( hotel1 )

        def hotel2 = new Hotel( name : 'secondHotel').save()
        */
        println( "Hello World" )
    }

    def destroy = {
    }
}
