# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

DonationCategory.destroy_all
Category.destroy_all
Donation.destroy_all
User.destroy_all

category1 = Category.create!({
  name: "equipment"
})

category2 = Category.create!({
  name: "hygiene"
})

category3 = Category.create!({
  name: "clothing"
})

category4 = Category.create!({
  name: "first aid"
})

category5 = Category.create!({
  name: "food"
})

category6 = Category.create!({
  name: "consultation"
})

category7 = Category.create!({
  name: "shelter"
})

category8 = Category.create!({
  name: "other"
})

user1 = User.create!({
  user_name: "holly",
  email: "holly@gmail.com",
  password: "123456",
  private: true
})

donation1 = Donation.create!({
  name: "Sleeping bag",
  address: "Silbersteinstraße 98, Berlin",
  description: "Brand new winter sleeping bag",
  user: user1,
  timeframe: "3pm",
})

file1 = URI.open('https://images.unsplash.com/photo-1518388389348-b60e09ab7627?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
donation1.photos.attach(io: file1, filename: 'sleepingbag.jpg', content_type: 'image/jpg')
donation1.save!

user2 = User.create({
  user_name:"ann",
  email: "ann@gmail.com",
  password: "123456",
  private: true
})

donation2 = Donation.create!({
  name: "Women's hygiene items",
  address: "Leinestraße 2, Berlin",
  description: "Tampons and Sanitary Pads, in sealed packaging",
  user: user2,
  timeframe: "10am",
})

file2 = URI.open('https://images.unsplash.com/photo-1580828476460-d1c11a6704bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80')
donation2.photos.attach(io: file2, filename: 'tampons.jpg', content_type: 'image/jpg')
donation2.save!

user3 = User.create({
  user_name: "alex",
  email: "alex@gmail.com",
  password: "123456",
  private: true
})

donation3 = Donation.create!({
  name: "Men's winter jacket",
  address: "Urbanstrasse 116, Berlin",
  description: "Size L and very warm",
  user: user3,
  timeframe: "4pm",
})

file3 = URI.open('https://images.unsplash.com/photo-1557771884-709f5996687d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80')
donation3.photos.attach(io: file3, filename: 'jacket.jpg', content_type: 'image/jpg')
donation3.save!

user4 = User.create({
  user_name: "james",
  email: "james@gmail.com",
  password: "123456",
  private: true
})

donation4 = Donation.create!({
  name: "Size 44 mens' trainers",
  address: "Hermannstraße 110, Berlin",
  description: "Men's trainers in size eu44. Used but in good condition",
  user: user4,
  timeframe: "11am",
})

file4 = URI.open('https://images.unsplash.com/photo-1511105612320-2e62a04dd044?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=802&q=80')
donation4.photos.attach(io: file4, filename: 'trainers.jpg', content_type: 'image/jpg')
donation4.save!

user5 = User.create({
  user_name: "laura",
  email: "laura@gmail.com",
  password: "123456",
  private: true
})

donation5 = Donation.create!({
  name: "Selection of first aid products",
  address: "Flughafenstraße 82, Berlin",
  description: "Plasters, antiseptic spray and disinfectant wipes. All brand new in sealed packaging.",
  user: user5,
  timeframe: "3pm",
})

file5 = URI.open('https://images.unsplash.com/photo-1585828292920-638a2a78cb38?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1069&q=80')
donation5.photos.attach(io: file5, filename: 'firstaidkit.jpg', content_type: 'image/jpg')
donation5.save!

organisation1 = User.create({
  user_name: "City-Station",
  email: "city-station@berliner-stadtmission.de",
  password: "123456",
  private: false,
  organization_address: "Joachim-Friedrich-Str. 46, Berlin"
})

donation6 = Donation.create!({
  name: "Alcohol-free restaurant very close to the Ku'damm",
  address: "Joachim-Friedrich-Str. 46, Berlin",
  description: "People with and without an apartment can get social counseling, pastoral care and good food. You can rest, eat, talk, play or read. There is also a clothing offer, a small washing center and the opportunity to take a shower.",
  user: organisation1,
  timeframe: "Tuesday - Saturday 4pm - 8.30pm",
})

file6 = URI.open('https://www.berliner-stadtmission.de/uploads/tx_templavoila/Standort_III.jpg')
donation6.photos.attach(io: file6, filename: 'restaurant.jpg', content_type: 'image/jpg')
donation6.save!

organisation2 = User.create({
  user_name: "Mobile Einzelfallhilfe",
  email: "mobile-einzelfallhilfe@berliner-stadtmission.de",
  password: "123456",
  private: false,
  organization_address: "Lehrter Str. 68, Berlin"
})

donation7 = Donation.create!({
  name: "Individual help for clients who are unable to access aid.",
  address: "Lehrter Str. 68, Berlin",
  description: "The team of the Mobile Individual Case Aid travels across Berlin and seeks out people who are no longer able to use the Berlin aid and care system on their own. Target clients are homeless and homeless people who are in particularly poor physical and mental health.",
  user: organisation2,
})

file7 = URI.open('https://www.berliner-stadtmission.de/fileadmin/_processed_/csm_Neues_Leben_482787a-1024x576_68c6e2b6d6.jpg')
donation7.photos.attach(io: file7, filename: 'nes.jpg', content_type: 'image/jpg')
donation7.save!

organisation3 = User.create({
  user_name: "Zentrale Beratungsstelle für Menschen in Wohnungsnot",
  email: "info@wohnungslos-berlin.de",
  password: "123456",
  private: false,
  organization_address: "Levetzowstraße 12a, Berlin"
})

donation8 = Donation.create!({
  name: "Advice for those who are homeless or at risk of homelessness",
  address: "Levetzowstraße 12a, Berlin",
  description: "The team consists of social workers, administrative staff and volunteers. We also offer advice in English and French.",
  user: organisation3,
  timeframe: "Monday, Tuesday, Thursday, Friday: 9:00 - 12:00. Wednesday 3:00 p.m. - 6:00 p.m."
})

file8 = URI.open('http://www.obdachlosenfest.de/wp-content/uploads/2015/01/Levetzowstr_002.jpg')
donation8.photos.attach(io: file8, filename: 'nes.jpg', content_type: 'image/jpg')
donation8.save!

organisation4 = User.create({
  user_name: "Notübernachtung Franklinstr.",
  email: "info2@berliner-stadtmission.de",
  password: "123456",
  private: false,
  organization_address: "Franklinstraße 27a, Berlin"
})

donation9 = Donation.create!({
  name: "Emergency overnight shelter",
  address: "Franklinstraße 27a, Berlin",
  description: "The home offers homeless people help without bureaucracy. The only prerequisites for admission are homelessness and relative destitution.",
  user: organisation4,
  timeframe: "Intake is between 6 p.m. and 9.30 p.m"
})

file9 = URI.open('https://res.cloudinary.com/vivini/image/upload/v1591287451/Haus_3_r6nxb6.jpg')
donation9.photos.attach(io: file9, filename: 'notuebernachtung.jpg', content_type: 'image/jpg')
donation9.save!

organisation5 = User.create!({
  user_name: "Caritas-Ambulanz für Wohnungslose",
  email: "info@berliner-stadtmission.de",
  password: "123456",
  private: false,
  organization_address: "Jebensstraße 3, Berlin"
})

donation10 = Donation.create!({
  name: "Medical primary and primary care",
  address: "Jebensstraße 3, Berlin",
  description: "The Caritas outpatient clinic offers free, unbureaucratic and, if desired, anonymous medical and nursing help.",
  user: organisation5,
  timeframe: "Intake is between 6 p.m. and 9.30 p.m"
})

file10 = URI.open('https://cdn3.carinet.de/cms/contents/caritas-berlin.de/bilder-pdf-medien/bilder/beratung-und-hilfe/wohnungsnot/caritas-krankenwohnu1/arztmobil-1010025.jpg?w=400&h=400&s=Fit&e=y&k=y&c=-1')
donation10.photos.attach(io: file10, filename: 'firstaid.jpg', content_type: 'image/jpg')
donation10.save!

donation_category1 = DonationCategory.create!({
  donation: donation1,
  category: category1
})

donation_category2 = DonationCategory.create!({
  donation: donation2,
  category: category2
})

donation_category3 = DonationCategory.create!({
  donation: donation3,
  category: category3
})

donation_category4 = DonationCategory.create!({
  donation: donation4,
  category: category3
})

donation_category5 = DonationCategory.create!({
  donation: donation5,
  category: category4
})

donation_category6 = DonationCategory.create!({
  donation: donation6,
  category: category5
})

donation_category7 = DonationCategory.create!({
  donation: donation1,
  category: category1
})

donation_category8 = DonationCategory.create!({
  donation: donation8,
  category: category6
})

donation_category9 = DonationCategory.create!({
  donation: donation9,
  category: category7
})

donation_category10 = DonationCategory.create!({
  donation: donation10,
  category: category4
})
