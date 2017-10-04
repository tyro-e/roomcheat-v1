package roomcheat

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PriceController {

    PriceService priceService

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond priceService.list(params), model:[priceCount: priceService.count()]
    }

    def show(Long id) {
        respond priceService.get(id)
    }

    def save(Price price) {
        if (price == null) {
            render status: NOT_FOUND
            return
        }

        try {
            priceService.save(price)
        } catch (ValidationException e) {
            respond price.errors, view:'create'
            return
        }

        respond price, [status: CREATED, view:"show"]
    }

    def update(Price price) {
        if (price == null) {
            render status: NOT_FOUND
            return
        }

        try {
            priceService.save(price)
        } catch (ValidationException e) {
            respond price.errors, view:'edit'
            return
        }

        respond price, [status: OK, view:"show"]
    }

    def delete(Long id) {
        if (id == null) {
            render status: NOT_FOUND
            return
        }

        priceService.delete(id)

        render status: NO_CONTENT
    }
}
