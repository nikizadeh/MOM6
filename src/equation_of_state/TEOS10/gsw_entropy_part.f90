!==========================================================================
elemental function gsw_entropy_part (sa, t, p)
!==========================================================================
!
! entropy minus the terms that are a function of only SA
!
! sa     : Absolute Salinity                               [g/kg]
! t      : in-situ temperature                             [deg C]
! p      : sea pressure                                    [dbar]
! 
! gsw_entropy_part : entropy part
!--------------------------------------------------------------------------

use gsw_mod_teos10_constants, only : gsw_sfac

use gsw_mod_kinds

implicit none

real (r8), intent(in) :: sa, t, p

real (r8) :: gsw_entropy_part

real (r8) :: x2, x, y, z, g03, g08

x2 = gsw_sfac*sa
x = sqrt(x2)
y = t*0.025_r8
z = p*1e-4_r8

g03 = z*(-270.983805184062_r8 + &
    z*(776.153611613101_r8 + z*(-196.51255088122_r8 + (28.9796526294175_r8 - 2.13290083518327_r8*z)*z))) + &
    y*(-24715.571866078_r8 + z*(2910.0729080936_r8 + &
    z*(-1513.116771538718_r8 + z*(546.959324647056_r8 + z*(-111.1208127634436_r8 + 8.68841343834394_r8*z)))) + &
    y*(2210.2236124548363_r8 + z*(-2017.52334943521_r8 + &
    z*(1498.081172457456_r8 + z*(-718.6359919632359_r8 + (146.4037555781616_r8 - 4.9892131862671505_r8*z)*z))) + &
    y*(-592.743745734632_r8 + z*(1591.873781627888_r8 + &
    z*(-1207.261522487504_r8 + (608.785486935364_r8 - 105.4993508931208_r8*z)*z)) + &
    y*(290.12956292128547_r8 + z*(-973.091553087975_r8 + &
    z*(602.603274510125_r8 + z*(-276.361526170076_r8 + 32.40953340386105_r8*z))) + &
    y*(-113.90630790850321_r8 + y*(21.35571525415769_r8 - 67.41756835751434_r8*z) + &
    z*(381.06836198507096_r8 + z*(-133.7383902842754_r8 + 49.023632509086724_r8*z)))))))

g08 = x2*(z*(729.116529735046_r8 + &
    z*(-343.956902961561_r8 + z*(124.687671116248_r8 + z*(-31.656964386073_r8 + 7.04658803315449_r8*z)))) + &
    x*( x*(y*(-137.1145018408982_r8 + y*(148.10030845687618_r8 + y*(-68.5590309679152_r8 + 12.4848504784754_r8*y))) - &
    22.6683558512829_r8*z) + z*(-175.292041186547_r8 + (83.1923927801819_r8 - 29.483064349429_r8*z)*z) + &
    y*(-86.1329351956084_r8 + z*(766.116132004952_r8 + z*(-108.3834525034224_r8 + 51.2796974779828_r8*z)) + &
    y*(-30.0682112585625_r8 - 1380.9597954037708_r8*z + y*(3.50240264723578_r8 + 938.26075044542_r8*z)))) + &
    y*(1760.062705994408_r8 + y*(-675.802947790203_r8 + &
    y*(365.7041791005036_r8 + y*(-108.30162043765552_r8 + 12.78101825083098_r8*y) + &
    z*(-1190.914967948748_r8 + (298.904564555024_r8 - 145.9491676006352_r8*z)*z)) + &
    z*(2082.7344423998043_r8 + z*(-614.668925894709_r8 + (340.685093521782_r8 - 33.3848202979239_r8*z)*z))) + &
    z*(-1721.528607567954_r8 + z*(674.819060538734_r8 + &
    z*(-356.629112415276_r8 + (88.4080716616_r8 - 15.84003094423364_r8*z)*z)))))

gsw_entropy_part = -(g03 + g08)*0.025_r8

return
end function

!--------------------------------------------------------------------------
