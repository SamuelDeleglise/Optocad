    Program PBS
!
!  Modelling polarizing beam splitters.
!
    use optocad
    use rsutil
    use rsplot

!
    call oc_init(unit='mm')            ! Initialize OptoCad
    call oc_frame(-200.,-60.,200.,150.,30.,25.,0.75)
    call oc_set(n=2, rix=(/1.658,1.486/),  &
                print='rs s2 act rd ang w0t z0t ipp med pw lb')
!

    call oc_input('',nib)              ! Read-in optical component data
    do i=1,nib
      call oc_trace(i)                 ! Trace all ray segments
      call oc_beam(3.0,fill=ps_color((/1.,.8,.8/)))        ! Plot outer part
      call oc_beam(2.0,fill=ps_color((/1.,.6,.6/)))        ! Plot middle part
      call oc_beam(1.0,fill=2)         ! Plot inner part of beam
      call oc_beam(0.0,1,5,.1,rns=2.)  ! Plot the beam axes in black
      call oc_reset
    end do
    call oc_surf(lw=.2,sns=2.,snc=6)   ! Plot all surfaces with numbers
!
    call oc_exit
    end                    
