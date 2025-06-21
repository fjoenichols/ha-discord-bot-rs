use std::env;
use serenity::{
    async_trait,
    model::{channel::Message, gateway::Ready},
    prelude::*,
};

struct Handler;

#[async_trait]
impl EventHandler for Handler {
    async fn ready(&self, _: Context, ready: Ready) {
        println!("{} has connected to Discord!", ready.user.name);
        println!("Bot is ready to receive messages from Home Assistant");
    }

    async fn message(&self, _ctx: Context, _msg: Message) {
        // We don't need to handle messages since Home Assistant
        // communicates directly with Discord's API
    }
}

#[tokio::main]
async fn main() {
    let token = env::var("DISCORD_TOKEN")
        .unwrap_or_else(|_| "YOUR_BOT_TOKEN_HERE".to_string());

    let intents = GatewayIntents::empty(); // Minimal intents for lowest resource usage

    let mut client = Client::builder(&token, intents)
        .event_handler(Handler)
        .await
        .expect("Error creating client");

    if let Err(why) = client.start().await {
        println!("Client error: {:?}", why);
    }
}