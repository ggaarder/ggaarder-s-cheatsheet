# Shell

- `openvt` to run a program on a new virtual console
- `bg` fg but in background
- `mount -o ro`
- `${i//xxx}` to remove from the tail. e.g.
  `for i in *.mp3; do ffmpeg -i $i ${i//.mp3}.ogg; done`
