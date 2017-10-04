package roomcheat

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import groovy.json.JsonOutput

class HotelController {

    HotelService hotelService

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", getLongitudeAndLatitude: "GET"]

    def HotelNamesService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def vals = HotelNamesService.serviceMethod( "London")
        print vals
        //respond hotelService.list(params), model:[hotelCount: hotelService.count()]
        def json = new groovy.json.JsonBuilder()
        json rootKey: vals
        println "HEllo World"
        println JsonOutput.toJson( json )
        //respond JsonOutput.toJson( json )
        respond hotelService.list(params), model:[hotelCount: hotelService.count()]
    }

    def show(Long id) {
        respond hotelService.get(id)
    }

    def save(Hotel hotel) {
        if (hotel == null) {
            render status: NOT_FOUND
            return
        }

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            respond hotel.errors, view:'create'
            return
        }

        respond hotel, [status: CREATED, view:"show"]
    }

    def update(Hotel hotel) {
        if (hotel == null) {
            render status: NOT_FOUND
            return
        }

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            respond hotel.errors, view:'edit'
            return
        }

        respond hotel, [status: OK, view:"show"]
    }

    def delete(Long id) {
        if (id == null) {
            render status: NOT_FOUND
            return
        }

        hotelService.delete(id)

        render status: NO_CONTENT
    }

    def search(){
        def hotels = Hotel.createCriteria().list
        {
            def query = params.query
            eq("city", query, [ignoreCase: true])
        }
        
       //respond hotels
        render(view: "search")
    }

    // currently returning all data - needs to be returning just the data for the searched for city
    def getLongitudeAndLatitude() {

        def hotelLongAndLats = Hotel.createCriteria().list
        {
            projections
            {
                property("name")
                property("name")
                property("name")
                property("starRating")
                property("latitude")
                property("longitude")
            }
        }

        render hotelLongAndLats
    }
}