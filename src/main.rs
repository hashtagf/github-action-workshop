use dotenv::dotenv;
use std::env;
#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok(); // Load environment variables from .env file

    println!("Starting server...");
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(echo)
            .service(dev)
            .route("/hey", web::get().to(manual_hello))
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}

use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello world!")
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().body(req_body)
}

#[get("/dev")]
async fn dev() -> impl Responder {
    // create message for print endpoing + port
    let env: String = env::var("PRINT_ENV").ok().unwrap();
    let endpoint: String = env::var("ENDPOINT").ok().unwrap();
    let port: String = env::var("PORT").ok().unwrap();
    let _message: String = format!("PRINT_ENV {}:{}:{}", env, endpoint, port);
    HttpResponse::Ok().body(_message)
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().body("Hey there!")
}
