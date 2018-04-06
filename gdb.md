# gdb: No symbol “i” in current context

Make sure the program is compiled without optimization.

# .gdbrc

# history

    set history save on
    set history size unlimited
    set history remove-duplicates 0
    
# array

    p *array@len

e.g.

    (gdb) p ncnt
    $30 = (int *) 0x603460
    (gdb) p *ncnt
    $31 = 784
    (gdb) p *ncnt@L
    $32 = {784, 20, 20, 20, 20, 10}

