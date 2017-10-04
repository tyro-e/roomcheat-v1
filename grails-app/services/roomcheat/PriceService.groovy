package roomcheat

import grails.gorm.services.Service

@Service(Price)
interface PriceService {

    Price get(Serializable id)

    List<Price> list(Map args)

    Long count()

    void delete(Serializable id)

    Price save(Price price)

}