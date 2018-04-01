# Multi Desktop

You can switch to another virtual terminal and `statrx` to get more desktops.

## Mount DD

You can mount a dd'd file. Like:
  
  $ sudo dd if=/dev/sdd  > /mnt/sda6/01/ipod_180331.dd
  $ sudo umount /mnt/sdd
  $ sudo mkdir /mnt/sdd
  $ sudo mount -o ro ipod_180331.dd /mnt/sdd
  
## Compile with TCC

    $ ./configure CC=tcc

## Convert Medias with FFMPEG

    $ ffmpeg -i input.mp4 output.avi

## Grayscalize a PDF

Using GhostScript:

    $ gs -sOutputFile=output.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH input.pdf

or using imagemagick:

    $ convert -colorspace GRAY color.pdf gray.pdf
