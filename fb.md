# Framebuffer

See betteros.org/tut/graphics1.php

Thank you *prushik*!

    #include <linux/fb.h>
    #include <stdio.h>
    #include <stdint.h>
    #include <fcntl.h>
    #include <sys/mman.h>
    #include <sys/ioctl.h>

    int fb_fd;
    struct fb_fix_screeninfo finfo;
    struct fb_var_screeninfo vinfo;
    long screensize;
    uint8_t *fbp;

    static void init(void) {
        fb_fd = open("/dev/fb0",O_RDWR);
        //Get variable screen information                                             
        ioctl(fb_fd, FBIOGET_VSCREENINFO, &vinfo);
        vinfo.grayscale=0;
        vinfo.bits_per_pixel=32;
        ioctl(fb_fd, FBIOPUT_VSCREENINFO, &vinfo);
        ioctl(fb_fd, FBIOGET_VSCREENINFO, &vinfo);
        ioctl(fb_fd, FBIOGET_FSCREENINFO, &finfo);
        screensize = vinfo.yres_virtual * finfo.line_length;
        fbp = mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED, fb_fd, (off_t)0);
    }

    static inline int putpixel(int x, int y, uint8_t r, uint8_t g, uint8_t b) {
        if (x >= vinfo.xres || x < 0 || y >= vinfo.yres || y < 0) return -1;
        long location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) + (y+vinfo.yoffset) * finfo.line_length;
        uint32_t color = (r<<vinfo.red.offset) | (g<<vinfo.green.offset) | (b<<vinfo.blue.offset);
        *((uint32_t*)(fbp + location)) = color;
        return 0;
    }
