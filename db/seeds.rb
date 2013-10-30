# Users
user_john = User.create email: 'john.doe@example.com', password: '12345678', first_name: 'John', last_name: 'Doe', phone_number: '555-1037'
user_jane = User.create email: 'jane.doe@example.com', password: '12345678', first_name: 'Jane', last_name: 'Doe', phone_number: '555-1037'

user_peter = User.create email: 'peter.parker@example.com', password: '12345678', first_name: 'Peter', last_name: 'Parker', phone_number: '555-1037'
user_bruce = User.create email: 'bruce.wayne@example.com',  password: '12345678', first_name: 'Bruce', last_name: 'Wayne', phone_number: '555-1037'

# Pets
dog_pancho = user_john.pets.create name: 'Pancho', kind: Pet::DOG, photo: File.open(File.join(Rails.root, 'public/samples/dog1.jpg'))
dog_pat    = user_john.pets.create name: 'Pat',    kind: Pet::DOG, photo: File.open(File.join(Rails.root, 'public/samples/dog2.jpg'))

cat_agatha = user_jane.pets.create name: 'Agatha', kind: Pet::CAT, photo: File.open(File.join(Rails.root, 'public/samples/cat1.jpg'))
cat_minina = user_jane.pets.create name: 'Minina', kind: Pet::CAT, photo: File.open(File.join(Rails.root, 'public/samples/cat2.jpg'))

services_by_category = {
  'Veterinario' => [ 'Animal City', '+cotas Centro Veterinario' ],
  'Tienda'      => [ 'Don Perro', 'El Rincon de la Mascota', '+kotas los Naranjos', 'Mascotienda' ],
  'Pensión'     => [ 'Pensión Canina La Julia', 'Pets & Care' ],
}

services_by_category.each do |name, services|
  category = Category.create name: name

  services.each do |service|
    category.services.create name: service
  end
end

lost_pet_messages = {
  dog_pat.id    => 'Me perdí en Los Dos Caminos',
  cat_minina.id => 'Si me ves por la zona del cafetal, por favor llama a mi dueño'
}

lost_pet_messages.each do |pet_id, message|
  Post.create kind: Post::LOST, description: message, pet_id: pet_id
end

Post.create kind: Post::FOUND, description: 'Encontré este perrito en La Trinidad', name: 'Desconocido', user: user_peter
