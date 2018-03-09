c     Demonstrate the staticness of local variables in Fortran.
c     Copyright (C) 2018  Austin D. Ray
c
c     This program is free software: you can redistribute it and/or modify
c     it under the terms of the GNU Affero General Public License as
c     published by the Free Software Foundation, either version 3 of the
c     License, or (at your option) any later version.
c
c     This program is distributed in the hope that it will be useful,
c     but WITHOUT ANY WARRANTY; without even the implied warranty of
c     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
c     GNU Affero General Public License for more details.
c
c     You should have received a copy of the GNU Affero General Public License
c     along with this program.  If not, see <https://www.gnu.org/licenses/>.
      program main
        integer i, pass_down/0/, show_staticness

        do 10 i = 1, 10
          pass_down = show_staticness(pass_down + 1)
10      continue

        stop  'End of program'
      end

      integer function show_staticness(pass_down)
        integer pass_down, count/0/
        write(*,*) "PARAMETER: ", pass_down, "LOCAL: ", count

        count           = count     + 1
        pass_down       = pass_down + 1
        show_staticness = pass_down

        return
      end
