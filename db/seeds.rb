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

#==== For test ====#
User.create(
  [
    { nickname: 'catapod' },
    { nickname: 'basavind' },
    { nickname: 'mixty' },
    { nickname: 'zverart' },
    { nickname: 'garold' }
  ]
)

Rightholder.create(
  [
    { caption_original: 'Massachusetts Institute of Technology', short_original: 'MIT' },
    { caption_original: 'University of Oxford', short_original: 'Oxford' }
  ]
)

License.create(
  [
    { name: 'Apache License 2.0', content: 'Apache License Version 2.0, January 2004 http://www.apache.org/licenses/ TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION 1. Definitions. "License" shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document. "Licensor" shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.' },
    { name: 'BSD 3-Clause "New" or "Revised" license', content: 'Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:' },
    { name: 'MIT license', content: 'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files...' }
  ]
)