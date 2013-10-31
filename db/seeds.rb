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
  'Veterinario' => [
    { name: 'Animal City', address: 'Av. Humboldt, Edif. Las Mercedes, Local 1, San Bernardino, Caracas', latitude: 10.520303, longitude: -66.904142 },
    { name: '+cotas Centro Veterinario', address: 'Av. Miguel Angel con calle Don Bosco, nivel PB. Colinas de Bello Monte', latitude: 10.480132, longitude: -66.878242 },
  ],
  'Tienda' => [
    { name: 'Don Perro', description: 'Venta de Equipos, Artículos y Accesorios para Animales', address: 'Av. Santa Teresa de Jesús, Qta. Don Perro, Diagonal al C. C. San Ignacio, La Castellana, Caracas', latitude: 10.498256, longitude: -66.855127 },
    { name: 'El Rincon de la Mascota', address: 'C. C. Plaza Las Américas 1, PB, Local Nº. 2, El Cafetal, Caracas', latitude: 10.458525, longitude: -66.828954 },
    { name: '+kotas los Naranjos', address: 'C. C. Los Naranjos, Local Nº. 19, Los Naranjos-cafetal, Caracas', latitude: 10.444788, longitude: -66.83404 },
    { name: 'Mascotienda', address: 'Av. Cataluña, entre América y El Parque, Edif. Terepaima, Piso PB, Local Nº. 2, Las Acacias, Caracas', latitude: 10.483592, longitude: -66.887083 },
  ],
  'Pensión' => [
    { name: 'Pensión Canina La Julia', address: 'La Julia, Caracas', latitude: 10.507391, longitude: -66.811638 },
    { name: 'Pets & Care', address: 'A domicilio' }
  ],
}

services_by_category.each do |name, services|
  category = Category.create name: name

  services.each do |service|
    if service.class == Hash
      service_params = service
    else
      service_params = { name: service }
    end

    category.services.create service_params
  end
end

lost_pet_messages = {
  dog_pat.id    => 'Me perdí en Los Dos Caminos',
  cat_minina.id => 'Si me ves por la zona del cafetal, por favor llama a mi dueño'
}

lost_pet_messages.each do |pet_id, message|
  pet = Pet.find pet_id
  Post.create kind: Post::LOST, description: message, pet: pet, user: pet.user
end

Post.create kind: Post::FOUND, description: 'Encontré este perrito en La Trinidad', name: 'Desconocido', user: user_peter
