# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


User.create(
  name:       'Paul Vixie', 
  bio:        'Paul Vixie is an American Internet pioneer, the author of several RFCs and well-known Unix software author.',
  image_url: 'http://upload.wikimedia.org/wikipedia/commons/7/70/Vixie.jpg',
  role: :expert,
  phone: '555-22323-232',
  password: 'expert@expert.com',
  password_confirmation:  'expert@expert.com',
  email: 'expert@expert.com'
)

User.create(
  'name'  => 'Jon Postel', 
  'bio'   => 'Jon Postel was editor of all early Internet standards specifications, such as the Request for Comments (RFC) series. His beard and sandals made him "the most recognizable archetype of an Internet pioneer"',
  'image_url' => 'http://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Jon_Postel.jpg/150px-Jon_Postel.jpg', 
  'role' => :expert,
  phone: '555-22323-232',
  password: 'lkjljklj',
  password_confirmation:  'lkjljklj',
  email: 'experakjt@expert.com'
)

User.create(
  'name'  => 'Richard Stallman', 
  'bio'   => 'Stallman launched the GNU Project in September 1983 to create a Unix-like computer operating system composed entirely of free software. In October 1985 he founded the Free Software Foundation.',
  'image_url' => 'http://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/NicoBZH_-_Richard_Stallman_%28by-sa%29_%285%29.jpg/240px-NicoBZH_-_Richard_Stallman_%28by-sa%29_%285%29.jpg', 
  'role' => :expert,
  phone: '555-22323-232',
  password: 'lkjljklj',
  password_confirmation:  'lkjljklj',
  email: 'expersdft@expert.com'
)

User.create(
  'name'  => 'Martin Stabenfeldt', 
  'bio'   => 'Software Craftsman',
  'image_url' => 'http://farm1.staticflickr.com/18/24092201_c6567c660a_m.jpg', 
  'role' => :expert,
  phone: '555-22323-232',
  password: 'martin@stabenfeldt.net',
  password_confirmation:  'martin@stabenfeldt.net',
  email: 'martin@stabenfeldt.net'
)

RequestGroup.create(title: 'iOS')
RequestGroup.create(title: 'Java')
RequestGroup.create(title: 'Ruby')
