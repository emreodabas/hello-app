// src/main.rs
use actix_web::{App, HttpResponse, HttpServer, Responder, web, get};


#[get("/{name}")]
async fn hello(name: web::Path<String>) -> impl Responder {
    let mut owned_string: String = "Hello ".to_owned();
    owned_string.push_str(name.as_str());
    HttpResponse::Ok().body(owned_string)
}

#[actix_rt::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
    })
        .bind("0.0.0.0:8080")?
        .run()
        .await
}