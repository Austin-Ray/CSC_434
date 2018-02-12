          program main
              integer i, pass_down/0/

              do 10 i = 1, 10
                pass_down = show_staticness(pass_down + 1)
10            continue

              stop  'End of program'
          end

          real function show_staticness(pass_down)
              integer pass_down, count/0/
              write(*,*) "PARAMETER: ", pass_down, "LOCAL: ", count

              count           = count     + 1
              pass_down       = pass_down + 1
              show_staticness = pass_down 

              return 
          end
