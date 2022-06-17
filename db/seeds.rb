# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

family = Project.create(title: 'Семья')
work = Project.create(title: 'Работа')
other = Project.create(title: 'Прочее')

Todo.create([{
    text: "Купить молоко",
    isCompleted: false,
    project_id: family.id
}, {
    text: "Заменить масло в двигателе до 23 апреля",
    isCompleted: false,
    project_id: family.id
},{
    text: "Отправить письмо бабушке",
    isCompleted: true,
    project_id: family.id
},
{
    text: "Заплатить за квартиру",
    isCompleted: false,
    project_id: family.id
},
{
    text: "Забрать обувь из ремонта",
    isCompleted: false,
    project_id: family.id
},
{
    text: "Позвонить заказчику",
    isCompleted: true,
    project_id: work.id
},
{
    text: "Отправить документы",
    isCompleted: true,
    project_id: work.id
},
{
    text: "Заполнить отчет",
    isCompleted: false,
    project_id: work.id
},
{
    text: "Позвонить другу",
    isCompleted: false,
    project_id: other.id
},
{
    text: "Подготовиться к поездке",
    isCompleted: false,
    project_id: other.id
}

])