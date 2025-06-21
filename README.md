# Home Assistant Discord Bot RS

This is a rewrite of my python Home Assistant Discord Bot to see how much smaller the memory footprint is with a rust container.

Home Assistant's Discord Integration requires a bot user to send notifications to discord. I was unable to find one that was easily available to use, so I built one. It's stupid simple. It can be ran as a docker image or directly from rust.

For all other setup steps for the Discord Integration with Home Assistant view the [Discord Integration Page](https://www.home-assistant.io/integrations/discord).