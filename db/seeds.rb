#USERS
User.create id: 1, name: 'Admin', active: :true, email: 'diego.6.souza@gmail.com', password: '87654321', admin: true

User.create id: 2, name: 'Julia', active: :true, email: 'julia@gmail.com', password: '12345678', admin: false

User.create id: 3, name: 'Pedro', active: :true, email: 'pedro@gmail.com', password: '12345678', admin: false

User.create id: 4, name: 'Joaquim', active: :true, email: 'joaquim@gmail.com', password: '12345678', admin: false

User.create id: 5, name: 'João', active: :true, email: 'joao@gmail.com', password: '12345678', admin: false

#User Type
UserType.create id: 1, title: 'Admin', short_description: 'Admin de Companhia'

UserType.create id: 2, title: 'Gerente', short_description: 'Gerente do Evento'

UserType.create id: 3, title: 'Segurança', short_description: 'Segurança do Evento'

UserType.create id: 4, title: 'Garçom/Garçonete', short_description: 'Garçom/Garçonete do Evento'

UserType.create id: 5, title: 'Recepcionista', short_description: 'Recepcionista do Eventos'

UserType.create id: 6, title: 'Palestrante', short_description: 'Palestrante do Evento'

UserType.create id: 7, title: 'DJ', short_description: 'DJ de Eventos'

UserType.create id: 8, title: 'Técnico de Som', short_description: 'Técnico de Som do Evento'

#Company
Company.create id: 1, title: 'IFSP', short_description: 'Eventos IFSP'

Company.create id: 2, title: 'Trovata', short_description: 'Eventos da Trovata'

#UserCompanyType
UserCompanyType.create id: 1, user_id: 2, company_id: 1, user_type_id: 5, active: true, admin:false

UserCompanyType.create id: 2, user_id: 2, company_id: 2, user_type_id: 5, active: true, admin:false

UserCompanyType.create id: 3, user_id: 3, company_id: 1, user_type_id: 2, active: true, admin:false

UserCompanyType.create id: 4, user_id: 3, company_id: 2, user_type_id: 3, active: true, admin:false

UserCompanyType.create id: 5, user_id: 4, company_id: 1, user_type_id: 3, active: true, admin:false

UserCompanyType.create id: 6, user_id: 4, company_id: 2, user_type_id: 4, active: true, admin:false

UserCompanyType.create id: 7, user_id: 5, company_id: 1, user_type_id: 4, active: true, admin:false

UserCompanyType.create id: 8, user_id: 5, company_id: 2, user_type_id: 4, active: true, admin:false

#EventType
EventType.create id: 1, title: 'Palestra', short_description: 'Palestra normal.'
EventType.create id: 2, title: 'Casamento', short_description: 'casamento matrimonial.'
EventType.create id: 3, title: 'Aniversário', short_description: 'Aniversário normal.'
EventType.create id: 4, title: 'Aniversário Infantil', short_description: 'Aniversário Infantil.'
EventType.create id: 5, title: 'Festa Particular', short_description: 'Festa Particular.'
EventType.create id: 6, title: 'Show', short_description: 'Show'
EventType.create id: 7, title: 'Apresentação', short_description: 'Apresentação'

#Event
Event.create id: 1, company_id: 1, event_type_id: 1, title: 'Palestra TI IFSP', short_description: 'Palestra no IFSP sobre TI.', address: 'Rua Pedro Cavalo', number: '142', district: 'Portal da Pérola', initial_date: Faker::Date.forward(23), end_date: Faker::Date.forward(25), initial_hour: Time.now.to_datetime, end_hour: Faker::Time.between(DateTime.now - 1, DateTime.now)

#Country
Country.create id: 1, name: 'Brasil', initials: 'BRA'

Country.create id: 2, name: 'Estados Unidos', initials: 'EUA'

Country.create id: 3, name: 'Argentina', initials: 'ARG'

Country.create id: 4, name: 'Chile', initials: 'CHI'

Country.create id: 5, name: 'Paraguay', initials: 'PAR'

#State
State.create id: 1, name: 'São Paulo', initials: 'SP', country_id: 1

#City
City.create id: 1, name: 'Birigui', state_id: 1