# 8x8 Bitmap Font

See also this great project: https://github.com/dhepper/font8x8

    void render(char *bitmap) {
        int x,y;
        int set;
        for (x=0; x < 8; x++) {
            for (y=0; y < 8; y++) {
                set = bitmap[x] & 1 << y;
                printf("%c", set ? 'X' : ' ');
            }
            printf("\n");
        }
    }

    render(font8x8_basic['A']);
