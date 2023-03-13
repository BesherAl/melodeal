// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import BookingController from "./booking_controller"
application.register("booking", BookingController)

import BookingSubscriptionController from "./booking_subscription_controller"
application.register("booking-subscription", BookingSubscriptionController)

import FlashController from "./flash_controller"
application.register("flash", FlashController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import RemovalsController from "./removals_controller"
application.register("removals", RemovalsController)
