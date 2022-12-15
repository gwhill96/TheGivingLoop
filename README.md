# The Giving Loop

Live website: www.the-giving-loop.com

## About the project
The Giving Loop is a website designed for a homeless charity, with the aim to close the feedback loop on charitable donations. A user can make a donation for a tangible product - a bed for a night, a meal, etc. - and once that donation has been redeemed will receive a notification to let them know when and where their money is going. It was created in the hope that knowing when your donations are redeemed, will encourage more people to donate or encourage recurring donations. The idea could be transferred across to a range of other charities as well.

## How to use
1) On the homepage, select which donations you'd like to add to your basket. Click on basket once complete
2) Once through to your basket you can create an account, continue as guest or log in. 
3) Click on donate and enter details through stripe (this is in test phase so you won't be charged, you can enter fake details also)
4) Wait for your donation to be redeemed to receive your notification!

## Tech Stack
Frameworks & libraries used to make The Giving Loop

Ruby on Rails
JavaScript
CSS & SASS
Bootstrap
Stimulus
Money Rails
Redis
Stripe
Stripe Event
Pundit
Postmark

Version control & deployment: 
[GitHub](https://github.com/gwhill96/TheGivingLoop)
[Heroku](https://www.the-giving-loop.com/)

## Installation
In order to run our app locally, you will need to have already installed Yarn and Rails. Check them with:

```
$ yarn -v
$ rails --version
```

We used Rails **v7.0.4** and Ruby **v3.1.2**.

If no version number is returned, please install Yarn and/or Rails before continuing.

```
git clone git@github.com:gwhill96/TheGivingLoop.git
cd petsy
bundle
yarn
bin/rails db:setup
bin/dev
```

Our API keys are hidden. You will need to touch a .env file and add your own Stripe and Postmark API keys.

## Features
