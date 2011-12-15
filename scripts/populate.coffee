#!/usr/bin/env coffee
# Populate database with faked data

DB_URL   = 'mongodb://localhost/coffee-box-db'

Post     = require('../app/models/post').Post
Faker    = require 'Faker'
mongoose = require 'mongoose'
markdown = require('../lib/markdown').Markdown

mongoose.connect DB_URL
console.log 'connected to db'


for i in [1..20]
  title       = Faker.Lorem.sentence()
  slug        = Faker.Lorem.words(3).join '-'
  raw_content = Faker.Lorem.paragraphs(4)
  content     = markdown raw_content
  (new Post
    title        : title
    raw_content  : raw_content
    content      : content
    slug         : slug
  ).save()

console.log 'done'
mongoose.disconnect()
console.log 'dis'
