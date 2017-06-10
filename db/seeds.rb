# frozen_string_literal: true
License.create(
  [
    { name: 'Apache License 2.0', content: 'Apache License Version 2.0, January 2004 http://www.apache.org/licenses/ TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION 1. Definitions. "License" shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document. "Licensor" shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.' },
    { name: 'BSD 3-Clause "New" or "Revised" license', content: 'Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:' },
    { name: 'MIT license', content: 'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files...' }
  ]
)

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
