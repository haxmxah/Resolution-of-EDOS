
c       MARTA XIULAN ARIBÓ HERRERA
C       En aquesta pràctica tractarem el tema de les equacions diferencials
c       en concret els mètodes d'Euler i Euler millorat
        PROGRAM PRE
c-----------------------------PROGRAMA PRINCIPAL-------------------------
        implicit none
c-------------------------- DECLARACIÓ DE VARIABLES --------------------
        double precision g,l,m,Wn,Tn,pi
        parameter (pi = 4.d0*atan(1.d0), g=8.87d0, l=0.45d0, m=0.51d0,
     * Wn = sqrt(g/l), Tn = 2.d0*pi/Wn )

        double precision yin(2),dyout(2),yout1(2),yout2(2),pas
        integer pasos, i,c,pasos_e(4),neq
        double precision Epoten, Ecine
        double precision condicions(2)
        neq = 2
        open(1,file = "p7.dat")
c------------------------ COS PRINCIPAL DEL PRGRAMA --------------------

c------------------------APARTAT A) OSCIL·LACIONS GRANS ----------------
        write (1,*) "#APARTAT A: OSCIL·LACIONS GRANS"
********************** EULER SIMPLE
        write (1,*) "#REULTATS PER EULER SIMPLE"
        write (1,200) "Temps", "Valor de phi", "Valor de w"
        !condicions inicials
        yin(1) = pi - 0.02d0   !phi_0 (rad)
        yin(2) = 0.d0 !w_0(rad/2)
        pasos = 1800
        pas = (5.d0*Tn)/dble(pasos)
        print*,5.d0*tn, pas
        do i = 1,pasos
            call Euler_S (pas,yin,yout1,neq)
            yin(1) = yout1(1) !angle phi
            yin(2) = yout1(2) !velocitat angular
            write(1,*) i*pas, yout1(1),yout1(2)
        enddo
        write (1,"(a1)")
        write (1,"(a1)")
********************** EULER MILLORAT
        write (1,*) "#REULTATS PER EULER MILLORAT"
        write (1,200) "Temps", "Valor de phi", "Valor de w"
        yin(1) = pi - 0.02d0   !phi_0 (rad).  !machacar variables!
        yin(2) = 0.d0 !w_0(rad/2)
        call Euler_S(pas,yin,yout1,neq) !inicialitzem amb euler simple
        do i = 1, pasos
            call Euler_M (pas,yin,yout1,yout2,neq)
            yin = yout1
            yout1 = yout2
c            yin(1) = yout1(1) !phi_0 = phi_1
c            yin(2) = yout1(2) !w_0 = w_1
c            yout1(1) = yout2(1) !phi_1 = phi_2
c            yout1(2) = yout2(2) !w_1 = w_2
            write(1,*) i*pas, yout2(1),yout2(2)
        enddo
        write (1,"(a1)")
        write (1,"(a1)")

        call system ("gnuplot -p plot1.gnu") !gràfica que compara els dos mètodes
        call system ("gnuplot -p plot2.gnu") !gràfia que compara a l'espai de fases
c---------------------- APARTAT B) OSCIL·LACIONS PETITES ---------------

        write (1,*) "APARTAT B: OSCIL·LACIONS PETITES"
        write (1,*) "#REULTATS PER EULER SIMPLE"
        write (1,200) "Temps", "Valor de phi", "Valor de w"

********************** EULER SIMPLE
        !condicions inicials
        yin(1) = 0.04d0   !phi_0 (rad)
        yin(2) = 0.d0 !w_0(rad/2)
        pasos = 1300
        pas = (5.d0*Tn)/dble(pasos)
        print*,5.d0*tn, pas
        do i = 1,pasos
            call Euler_S (pas,yin,yout1,neq)
            yin = yout1
            write(1,*) i*pas, yout1(1),yout1(2)
        enddo
        write (1,"(a1)")
        write (1,"(a1)")
********************** EULER MILLORAT
        !Euler millorat
        write (1,*) "#REULTATS PER EULER MILLORAT"
        write (1,200) "Temps", "Valor de phi", "Valor de w"
        yin(1) = 0.04d0 !phi_0 (rad).  !machacar variables!
        yin(2) = 0.d0 !w_0(rad/2)
        call Euler_S(pas,yin,yout1,neq) !inicialitzem amb euler simple
        do i = 1, pasos
            call Euler_M (pas,yin,yout1,yout2,neq)
            yin = yout1
            yout1 = yout2
            write(1,*) i*pas, yout2(1),yout2(2)
        enddo
        write (1,"(a1)")
        write (1,"(a1)")

        call system ("gnuplot -p plot3.gnu")
c---------------------- APARTAT C) ENERGIA -----------------------------
        
        write (1,*) "APARTAT C: ENERGIA"

********************** EULER SIMPLE
        !condicions inicials
        condicions(1) = 1.d0
        condicions(2) = pi - 0.02d0
        do c= 1,2 !bucle per estalviar espai
        write (1,*) "#REULTATS PER EULER SIMPLE C.C",condicions(c)
        write (1,200) "Temps", "Ecinetica", "Epotencial", "Etotal"
            yin(1) = condicions(c)   !phi_0 (rad)
            yin(2) = 0.d0 !w_0(rad/2)
            pasos = 2500
            pas = (5.d0*Tn)/dble(pasos)
            print*,5.d0*tn, pas
            do i = 1,pasos
                call Euler_S (pas,yin,yout1,neq)
                yin = yout1
                write(1,*) i*pas, Ecine(yout1(2)),Epoten(yout1(1)),
     *  Ecine(yout1(2))+Epoten(yout1(1))
            enddo
            write (1,"(a1)")
            write (1,"(a1)")
********************** EULER MILLORAT
            write (1,*) "#REULTATS PER EULER MILLORAT",condicions(c)
            write (1,200) "Temps", "Ecinetica", "Epotencial", "Etotal"

            yin(1) = condicions(c) !phi_0 (rad).  !machacar variables!
            yin(2) = 0.d0 !w_0(rad/2)
            call Euler_S(pas,yin,yout1,neq) !inicialitzem amb euler simple
            do i = 1, pasos
                call Euler_M (pas,yin,yout1,yout2,neq)
                yin = yout1
                yout1 = yout2
                write(1,*) i*pas, Ecine(yout2(2)),Epoten(yout2(1)),
     *  Ecine(yout2(2))+Epoten(yout2(1))
            enddo
            write (1,"(a1)")
            write (1,"(a1)")
        enddo

        call system ("gnuplot -p plot4.gnu")

c---------------------- APARTAT D) TRANSICIÓ -----------------------------
        !A partir d'ara utilitzem Euler millorat
        write (1,*) "#APARTAT C: TRANSICIÓ"
        !condicions inicials
        yin(1) = 0.d0   !phi_0 (rad)
        condicions(1)=2.d0*sqrt(g/l)+0.03d0 !w_0(rad/2)
        condicions(2)=2.d0*sqrt(g/l)-0.03d0
        pasos = 2100
        pas = (11.d0*Tn)/dble(pasos)
        print*,5.d0*tn, pas
        do c = 1,2
            write (1,*) "#REULTATS PER EULER MILLORAT",condicions(c)
            write (1,200) "Temps", "Valor de phi", "Valor de w"
            yin(1)=0.d0
            yin(2)=condicions(c)
            call Euler_S(pas,yin,yout1,neq)
            do i = 1, pasos
                call Euler_M (pas,yin,yout1,yout2,neq)
                yin = yout1
                yout1 = yout2
                write(1,*) i*pas, yout2
            enddo
            write (1,"(a1)")
            write (1,"(a1)")
        enddo
        call system ("gnuplot -p plot5.gnu")

        pasos = 1800
c------------------ APARTAT E) CONVERGÈNCIA DEL MÈTODE -----------------------------
        !A partir d'ara utilitzem Euler millorat
        write (1,*) "#APARTAT E: CONVERGÈNCIA DEL MÈTODE"
        !condicions inicials
        pasos_e(1) = 600 !per compactar més el codi creem un vector amb els passos demanats pel guió
        pasos_e(2) = 1300
        pasos_e(3) = 2600
        pasos_e(4) = 15000
        open(2,file="check.dat")
        do c = 1,4
            yin(1) = 2.8d0  !phi_0 (rad)
            yin(2) = 0.d0 !w_0 (rad/s)
            pasos = pasos_e(c)
            pas = (12.d0*Tn)/dble(pasos)
            print*,12.d0*tn, pas

            write (1,*) "#REULTATS PER EULER MILLORAT AMB PAS:",
     * pasos_e(c)
            write (1,200) "Temps", "Valor de phi", "Valor de w"
            write (2,*) "#REULTATS PER EULER MILLORAT AMB PAS:",
     * pasos_e(c)
            write (2,200) "Temps", "Valor de phi", "Valor de w"
            call Euler_S(pas,yin,yout1,neq)
            do i = 1, pasos
                    call Euler_M (pas,yin,yout1,yout2,neq)
                    yin = yout1
                    yout1 = yout2
                    write(1,*)i*pas, Ecine(yout2(2)),Epoten(yout2(1)),
     *  Ecine(yout2(2))+Epoten(yout2(1))
                    write(2,*)i,yout2(2),i*pas, Ecine(yout2(2)),
     *   Epoten(yout2(1)),Ecine(yout2(2))+Epoten(yout2(1))
            enddo
            write (1,"(a1)")
            write (1,"(a1)")
            write (2,"(a1)")
            write (2,"(a1)")
        enddo

        call system ("gnuplot -p plot6.gnu")



c--------------------------------FORMATS--------------------------------

200     format(a7,10x,a20,10x,a20,10x,a20)
300     format(f20.12,10x,f20.12,10x,f20.12)
400     format(f20.12,10x,f20.12,10x,f20.12,10x,f20.12)

c-----------------------------------------------------------------------          
        END PROGRAM
c-------------------------- FUNCIONS I SUBRUTINES ----------------------

c---------------------------SUBRUTINA DERIVADA--------------------------
c       !Aquesta subrutina és molt important!
c       Té per entrades yin on |yin(1) = angle 
c                              |yin(2) = derivada de l'angle 
c       Té per surtida yout on |yout(1) = derivda de l'angle = yin(2)
c                              |yout(2) = derivada de yin(2) = derivada
c                                                           segona de l'angle
c       En el nostre cas el nostre vector funció té dimensió 2
c       SUBRUTINA FETA A PARTIR DE LA IDEA DE BRUNO JULIÀ A LES CLASSES
C-----------------------------------------------------------------------
        subroutine derivada (pas,yin,dyout,neq) !añador neq
        implicit none
        integer neq
        double precision t, yin(neq), dyout(neq)
        double precision g,l,pas
        parameter (g=8.87d0, l=0.45d0)

            dyout(1) = yin(2)
            dyout(2) = -g*sin(yin(1))/l !terme

        end 
c---------------------------SUBRUTINA EULER 1 PAS-----------------------
c       Amb la Subrutina Derivada que calcula les derivades de l'angle i
c       la derivada de la derivada de l'angle podem programar Euler
c       Té per ENTRADES els valors de l'angle i la derivada de l'angle
c           |yin(1) = angle_0
c           |yin(2) = derivada de l'angle = velocitat angular_0
c       i el pas que és constant segons com definim el problema i el num.
c       d'equacions utilitzades, en aquest cas són 2.
c       Té per SURTIDA el valor yout d'un sol pas
c           |yout(1) = angle_1
c           |yout(2) = derivada de l'angle = velocitat angular_1
c       Aquesta subrutina crida a la subrutina derivada
c-----------------------------------------------------------------------
        subroutine Euler_S (pas,yin,yout1,neq)
        implicit none
        integer neq
        double precision pas,yin(neq),dyout(neq),yout1(neq)
            call derivada(pas,yin,dyout,neq) 
            yout1(1) = yin(1) + pas*dyout(1) !angle_1
            yout1(2) = yin(2) + pas*dyout(2) !w_1

        end 


c------------------------- SUBRUTINA EULER.M 1 PAS -----------------------
c       Amb la Subrutina Derivada que calcula les derivades de l'angle i
c       la derivada de la derivada de l'angle podem programar Euler i 
c       Euler millorat, tenint en compte que hem d'arrencar amb Euler 
c       simple amb una sola iteració.
c       Té per ENTRADES el pas,yin, yout
c           |yin(1) = angle_0
c           |yin(2) = derivada de l'angle = velocitat angular_0
c           |yout1(1) = angle_1 (euler simple)
c           |yout1(2) = derivada de l'angle = velocitat angular_1 (euler simple)
c       Té per SURTIDA yout2
c           |yout2(1) = angle_2
c           |yout2(2) = velocitat angular_2
c-----------------------------------------------------------------------
        subroutine Euler_M (pas,yin,yout1,yout2,neq)
        implicit none
        integer neq
        double precision pas,yin(neq),dyout(neq),yout1(neq),yout2(neq)
        call derivada(pas,yout1,dyout,neq) 
            yout2(1) = yin(1) + 2.d0*pas*dyout(1) !angle_2
            yout2(2) = yin(2) + 2.d0*pas*dyout(2) !w_2
c           yout2 = yin +2.d0*pas*dyout
        end 
c----------------------- Funció energia cinètica  -----------------------------
 
        double precision function Ecine(w)
        implicit none
        double precision g,l,m,w
        parameter (g=8.87d0, l=0.45d0, m=0.51d0)

            Ecine = (1.d0/2.d0)*m*((w*l)**2)

        return 
        end 
c----------------------- Funció energia potencial -----------------------------
 
        double precision function Epoten(phi)
        implicit none
        double precision g,l,m,phi
        parameter (g=8.87d0, l=0.45d0, m=0.51d0)

            Epoten = -m*g*l*cos(phi)

        return
        end 




