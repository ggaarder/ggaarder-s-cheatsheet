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

Remember to add the star (*). For example, the following is wrong:

    (gdb) p (int*)rawntwk@5
    $61 = {0x7ffff7fe9000, 0x603420, 0x603460, 0x6034a0, 0x6034e0}

After adding the star:

```
(gdb) p *(int*)rawntwk@5
$62 = {6, 784, 20, 1053841751, 1040920018}
(gdb) p *(float*)rawntwk@100
$63 = {8.40779079e-45, 1.098618e-42, 2.80259693e-44, 0.406931609, 0.135916978, 
  0.90642029, 0.659960389, 0.353202343, 0.80183202, 0.335956067, 0.594108462, 
  0.579622328, 0.554166198, 0.74079293, 0.506428659, 0.29150486, 0.474454671, 
  0.344116122, 0.352740079, 0.146050766, 0.00411320152, 0.0466696993, 
  0.943998635, 0.786222458, 0.177267641, 0.494755447, 0.138713866, 0.634083152, 
  0.155154288, 0.223313257, 0.621491849, 0.392623812, 0.887796521, 0.742388844, 
  0.799555421, 0.0237134919, 0.648809135, 0.45951578, 0.376915812, 0.450641125, 
  0.795471847, 0.971024275, 0.0302634798, 0.349638045, 0.711817205, 
  0.536692142, 0.641142905, 0.186271891, 0.880808294, 0.993882954, 0.332322657, 
  0.884921491, 0.040552672, 0.276321292, 0.671143949, 0.217820302, 0.771076739, 
  0.809857786, 0.851903439, 0.926231027, 0.0331710503, 0.473395318, 
  0.318854839, 0.920967579, 0.215784177, 0.118410252, 0.944681048, 0.864593327, 
  0.57792604, 0.321596891, 0.315234452, 0.373397887, 0.292621166, 0.345497936, 
  0.723035932, 0.00443839701, 0.882190108, 0.364178836, 0.190710291, 
  0.762998343, 0.35806182, 0.523032963, 0.647919834, 0.398614496, 0.799354255, 
  0.319063783, 0.616434813, 0.570430994, 0.128921553, 0.468338251, 0.496662021, 
  0.162092611, 0.941733539, 0.815516829, 0.0830601752, 0.157517731, 
  0.933927119, 0.0277412329, 0.0221110452, 0.511853158}
```

Another:

```
(gdb) p *neurons[1]@10
$65 = {{a = 0, z = 0, theta = 0, arg = 0xc44, gradient = 0x6099c0}, {a = 0, 
    z = 0, theta = 0, arg = 0x1888, gradient = 0x60a610}, {a = 0, z = 0, 
    theta = 0, arg = 0x24cc, gradient = 0x60b260}, {a = 0, z = 0, theta = 0, 
    arg = 0x3110, gradient = 0x60beb0}, {a = 0, z = 0, theta = 0, arg = 0x3d54, 
    gradient = 0x60cb00}, {a = 0, z = 0, theta = 0, arg = 0x4998, 
    gradient = 0x60d750}, {a = 0, z = 0, theta = 0, arg = 0x55dc, 
    gradient = 0x60e3a0}, {a = 0, z = 0, theta = 0, arg = 0x6220, 
    gradient = 0x60eff0}, {a = 0, z = 0, theta = 0, arg = 0x6e64, 
    gradient = 0x60fc40}, {a = 0, z = 0, theta = 0, arg = 0x7aa8, 
    gradient = 0x610890}}
```

# Access mmap'd memory

We can't. 

> GDB will be using ptrace to poke around in your process's memory ... answered Mar 22 '09 at 15:58
by [Logan Capaldo](http://stackoverflow.com/users/61289/logan-capaldo) at [Examining mmaped addresses using GDB](http://stackoverflow.com/questions/654393/examining-mmaped-addresses-using-gdb)

> About why gdb cannot access the memory you want, I believe Linux does not make I/O memory accessible via ptrace().
> 
> According to cmemk.c (which I found in linuxutils_2_25.tar.gz), mmap() does indeed set the VM_IO flag on the memory in question.
>
> To access this memory from gdb, add a function to your program that reads this memory and have gdb call this function.
>
> edited Sep 3 '10 at 23:43
> 
> answered Sep 3 '10 at 23:22

by [sigjuice](http://stackoverflow.com/users/78720/sigjuice) at [GDB can't access mmap()'d kernel allocated memory?](http://stackoverflow.com/questions/3640095/gdb-cant-access-mmapd-kernel-allocated-memory)
