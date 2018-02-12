      program part_one

        integer i, numOfTenths, max_vol_index
        real area, pi, radii(100), height(100), areas(100), vols(100)

        pi = 3.14159
        max_vol_index = 0

        write(*, *) 'Square meters of sheet metal to work with: '
        read(*, *) area

c       Initialize the radii array
        do 10 i = 1, 100
          radii(i) = i * 0.1
10      continue

c       Calculate the height values by rearranging the area formula of a
c       cylinder
        do 20 i = 1, 100
          height(i) = (area / (2 * pi * radii(i))) - radii(i)
20      continue

c       Calculate the areas with the appropriate radii and height
        do 30 i = 1, 100
          areas(i) = 2 * pi * radii(i) * height(i) 
     +               + 2 * pi * radii(i)**2
30      continue

c       Calculate volumes
        do 40 i = 1, 100
          vols(i) = pi * radii(i)**2 * height(i)
40      continue

c       Print the report
1000    format(2X, F5.1, 3(2X, F7.2))
        write(*, *) '  radius  height    area  volume'
        write(*, *) '--------------------------------'
        do 50 i = 1, 100
          write(*, 1000) radii(i), height(i), areas(i), vols(i)
50      continue

c       Determine the maximum volumen and save it's index.
        do 60 i = 1, 100
          if (vols(i) > vols(max_vol_index)) then
            max_vol_index = i
          endif
60      continue

        write(*, 1100) 'The maximum volume is', vols(max_vol_index),
     +                 ' with a radius of ', radii(max_vol_index),
     +                 'and height of', height(max_vol_index)

1100    format(A, F10.2, A, F10.2, X, A, F7.2)

        stop
      end
