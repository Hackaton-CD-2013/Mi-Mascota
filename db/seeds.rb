user_john = User.create email: 'john.doe@example.com', password: '12345678'
user_jane = User.create email: 'jane.doe@example.com', password: '12345678'

user_john.pets.create name: 'Pancho', kind: Pet::DOG
user_john.pets.create name: 'Pat',    kind: Pet::DOG

user_jane.pets.create name: 'Agatha', kind: Pet::CAT
user_jane.pets.create name: 'Minina', kind: Pet::CAT

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
