use std::env;
use dotenv::dotenv;
fn main() {
    dotenv().ok(); // Load environment variables from .env file

    println!("Hello, world!");
    // print env data
  // Get the PORT environment variable
    match env::var("PORT") {
        Ok(port) => println!("PORT: {}", port),
        Err(e) => eprintln!("Couldn't read PORT: {}", e),
    }

    // Get the ENDPOINT environment variable
    match env::var("ENDPOINT") {
        Ok(endpoint) => println!("ENDPOINT: {}", endpoint),
        Err(e) => eprintln!("Couldn't read ENDPOINT: {}", e),
    }
}
