package roomcheat

class UrlMappings {

    static mappings = {
        delete "/$controller/$id(.$format)?"(action:"delete")
        get "/$controller(.$format)?"(action:"index")
        get "/$controller/$id(.$format)?"(action:"show")
        post "/$controller(.$format)?"(action:"save")
        put "/$controller/$id(.$format)?"(action:"update")
        patch "/$controller/$id(.$format)?"(action:"patch")

        "/"(controller:"main")
        "/hotel"(controller:"hotel")
        "/hotel/search"(controller:"hotel", action: "search", view: "/hotel/search")
        "/hotel/index"(view: "/hotel/index")
        "/hotel/getLongitudeAndLatitude"(controller:"hotel", action:"getLongitudeAndLatitude")
        //"/hotel/search"(controller:"hotel", action:"search")


        "/user/login"(view: "/user/login")
        "/user/create"(view: "/user/create")

        


        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
