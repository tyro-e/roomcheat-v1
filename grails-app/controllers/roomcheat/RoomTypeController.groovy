package roomcheat

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class RoomTypeController {

    RoomTypeService roomTypeService

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond roomTypeService.list(params), model:[roomTypeCount: roomTypeService.count()]
    }

    def show(Long id) {
        respond roomTypeService.get(id)
    }

    def save(RoomType roomType) {
        if (roomType == null) {
            render status: NOT_FOUND
            return
        }

        try {
            roomTypeService.save(roomType)
        } catch (ValidationException e) {
            respond roomType.errors, view:'create'
            return
        }

        respond roomType, [status: CREATED, view:"show"]
    }

    def update(RoomType roomType) {
        if (roomType == null) {
            render status: NOT_FOUND
            return
        }

        try {
            roomTypeService.save(roomType)
        } catch (ValidationException e) {
            respond roomType.errors, view:'edit'
            return
        }

        respond roomType, [status: OK, view:"show"]
    }

    def delete(Long id) {
        if (id == null) {
            render status: NOT_FOUND
            return
        }

        roomTypeService.delete(id)

        render status: NO_CONTENT
    }
}
