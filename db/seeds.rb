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
