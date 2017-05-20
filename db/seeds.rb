# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# States
State.create(
  [
    { name: 'import', display_name: 'Импорт' },
    { name: 'translate', display_name: 'Перевод' },
    { name: 'edit', display_name: 'Редактура' },
    { name: 'markup', display_name: 'Верстка' },
    { name: 'published', display_name: 'Публикация' }
  ]
)

ChunkType.create(
  [
    { name: 'text', display_name: 'Текст' },
    { name: 'image', display_name: 'Изображение' },
    { name: 'latex', display_name: 'LaTeX' },
    { name: 'audio', display_name: 'Аудиозапись' },
    { name: 'video', display_name: 'Видеозапись' }
  ]
)

User.create(
  [
    { nickname: 'catapod' },
    { nickname: 'basavind' },
    { nickname: 'mixty' },
    { nickname: 'zverart' },
    { nickname: 'garold' }
  ]
)