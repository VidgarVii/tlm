#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

legal_form = LegalForm.create!([
                                   {title: 'Акционерное общество', less_title: 'АО'},
                                   {title: 'О́бщество с ограниченной ответственностью', less_title: 'ООО'}
                               ])

bank   = Bank.create!(name: 'КредитоП', correspondent_account: 30101810300000000609, phone: '(495)111-111-11' ,bik: 111111111, legal_form: legal_form.first, inn: 1111111111, kpp: 213001001, ogrn: 1111111111111)
trader = Trader.create!(name: 'ЗвездаХ', legal_form: legal_form.last, inn: 1111111112, phone: '(495)111-111-11' ,kpp: 213001002, ogrn: 1161691111111)

Address.create!([
                    {address: '428123, г. Простоквашиноб ул. Пирогова, 1', company: bank},
                    {address: '428123, г. Простоквашиноб ул. Пирогова, 6', company: trader}
                ])

BankAccount.create!(settlement_account: 11101111300000000111, bank: bank, client: trader)
