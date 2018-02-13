      program part_one

        integer i, numOfTenths, max_vol_index
        real area, pi, radii(100), height(100), areas(100), vols(100)

        pi            = 3.14159
        max_vol_index = 0

        write(*, *) 'Square meters of sheet metal to work with: '
        read(*, *)  area

        do 10 i = 1, 100
          radii(i)  = i * 0.1
          height(i) = calc_height(area, pi, radii(i))
          areas(i)  = calc_area(pi, radii(i), height(i))
          vols(i)   = calc_vol(pi, radii(i), height(i))
10      continue

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

c     Calculate the surface area of a cylinder using the standard
c     formula
      real function calc_area(pi, radius, height)
        calc_area =  2 * pi * radius * height
     +             + 2 * pi * radius**2

      end

c     Calculate the volume of a cylinder using the standard formula
      real function calc_vol(pi, radius, height)
        calc_vol = pi * radius**2 * height
      end

c     Calculate the height based on a rearranged version of the
c     cylindrical surface area forula.
      real function calc_height(area, pi, radius)
          calc_height = area / (2 * pi * radius) - radius
      end
