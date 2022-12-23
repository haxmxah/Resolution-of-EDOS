
c       MARTA XIULAN ARIBÓ HERRERA
C       En aquesta pràctica tractarem el tema de les equacions diferencials
c       en concret els mètodes d'Euler simple i el mètode preditor
        PROGRAM PENDOL_SIMPLE
c-----------------------------PROGRAMA PRINCIPAL-------------------------
        implicit none
c-------------------------- DECLARACIÓ DE VARIABLES --------------------
        integer i,neq,pasos,c,pasos_e(4)
        parameter(neq = 2)
        double precision pi,m,l,g,Wn,Tn, phi_0, w_0,pas
        parameter(pi = 4.d0*atan(1.d0), m = 0.98d0, l = 1.07d0, 
     *g = 10.44d0, Wn = sqrt(g/l), Tn = 2.d0*pi/Wn)!unitats S.I [m,s,kg]
        double precision yin(neq),dyout(neq),yout1(neq),youtp(neq)
        double precision EKIN, EPOT !funcions de l'energia potencial i cinètica
        double precision w0_d(2)
        open (1, file =  "P7-20-21-resf.dat")
        open (2,file = "extra.dat")

c---------------------- APARTAT A Petites oscil·lacions --------------------
        write (1,*) "#APARTAT A: OSCIL·LACIONS PETITES"

********************** 
c        EULER SIMPLE
********************** 

        write (1,*) "#REULTATS PER EULER SIMPLE"
        write (1,200) "Temps", "Valor de phi", "Valor de w"

        phi_0 = 0.025d0 !rad
        w_0 = 0.d0 !rad/s
        yin(1) = phi_0 !condicions inicials
        yin(2) = w_0  !
        pasos = 1500 
        pas = 7.d0*Tn/dble(pasos)

        do i = 1,pasos,1
            call Euler_S (pas,yin,yout1,neq)
            yin = yout1
            write(1,*) i*pas, yout1(1), yout1(2) !temps, phi, w
        enddo
        write (1,"(a1)")
        write (1,"(a1)")

********************** 
c       EULER PREDITOR
********************** 
        
        write (1,*) "#REULTATS PER EULER PREDITOR"
        write (1,200) "Temps", "Valor de phi", "Valor de w"

        phi_0 = 0.025d0 !rad
        w_0 = 0.d0 !rad/s
        yin(1) = phi_0 !condicions inicials
        yin(2) = w_0  !
        pasos = 1500 
        pas = 7.d0*Tn/dble(pasos)

        do i = 1,pasos,1
            call Euler_P (pas,yin,youtp,neq)
            yin = youtp
            write(1,*) i*pas, youtp(1), youtp(2) !temps, phi, w
        enddo
        write (1,"(a1)")
        write (1,"(a1)")

        call system ("gnuplot -p plot1.gnu")

c---------------------- APARTAT B GRANS OSCIL·LACIONS --------------------
        write (1,*) "#APARTAT B: OSCIL·LACIONS GRANS"

********************** 
c        EULER SIMPLE
********************** 

        write (1,*) "#REULTATS PER EULER SIMPLE"
        write (1,200) "Temps", "Valor de phi", "Valor de w"

        phi_0 = pi - 0.15d0 !rad
        w_0 = 0.d0 !rad/s
        yin(1) = phi_0 !condicions inicials
        yin(2) = w_0  !
        pasos = 1500 
        pas = 7.d0*Tn/dble(pasos)

        do i = 1,pasos,1
            call Euler_S (pas,yin,yout1,neq)
            yin = yout1
            write(1,*) i*pas, yout1(1), yout1(2) !temps, phi, w
        enddo
        write (1,"(a1)")
        write (1,"(a1)")

********************** 
c       EULER PREDITOR
********************** 
        
        write (1,*) "#REULTATS PER EULER PREDITOR"
        write (1,200) "Temps", "Valor de phi", "Valor de w"

        phi_0 = pi - 0.15d0 !rad
        w_0 = 0.d0 !rad/s
        yin(1) = phi_0 !condicions inicials
        yin(2) = w_0  !
        pasos = 1500 
        pas = 7.d0*Tn/dble(pasos)

        do i = 1,pasos,1
            call Euler_P (pas,yin,youtp,neq)
            yin = youtp
            write(1,*) i*pas, youtp(1), youtp(2) !temps, phi, w
            write(2,*)i*pas, youtp(1), youtp(2) !extra
        enddo
        write (1,"(a1)")
        write (1,"(a1)")

        call system ("gnuplot -p plot2.gnu") !gràfica de phi(t)

        call system ("gnuplot -p plot3.gnu") !gràfica espai de fases

        call system("gnuplot -p plot7.gnu") !gif extra amb el script penjat
        !al campus virtual

c------------------------------ APARTAT C ENERGIA --------------------
        write (1,*) "#APARTAT C: ENERGIA"
********************** 
c        EULER SIMPLE
********************** 

        write (1,*) "#REULTATS PER EULER SIMPLE"
        write (1,200) "Temps", "Ecinetica", "Epotencial", "Etotal"

        phi_0 = pi - 0.025d0 !rad
        w_0 = 0.12d0 !rad/s
        yin(1) = phi_0 !condicions inicials
        yin(2) = w_0  !
        pasos = 1500 
        pas = 7.d0*Tn/dble(pasos)

        do i = 1,pasos,1
            call Euler_S (pas,yin,yout1,neq)
            yin = yout1
            write(1,*) i*pas, EKIN(yout1(2)), EPOT(yout1(1)),
     *EPOT(yout1(1))+EKIN(yout1(2)) !temps, E.cinetica, E. potencial, E.total
        enddo
        write (1,"(a1)")
        write (1,"(a1)")
********************** 
c       EULER PREDITOR
********************** 

        write (1,*) "#REULTATS PER EULER PREDITOR"

        write (1,200) "Temps", "Ecinetica", "Epotencial", "Etotal"

        yin(1) = phi_0 !condicions inicials acumulen valors aixi que s'han de "renovar"
        yin(2) = w_0  !


        do i = 1,pasos,1
            call Euler_P (pas,yin,youtp,neq)
            yin = youtp
            write(1,*) i*pas, EKIN(youtp(2)), EPOT(youtp(1)),
     *EPOT(youtp(1))+EKIN(youtp(2)) !temps, E.cinetica, E. potencial, E.total
        enddo
        write (1,"(a1)")
        write (1,"(a1)")

        call system ("gnuplot -p plot4.gnu") !gràfica de l'energia cinètica 
c                                             l'energia potencial en funció del temps
c                                             dels dos mètodes

c------------------------------ APARTAT D TRANSICIÓ --------------------
        write (1,*) "#APARTAT D: TRANSICIÓ"
        !creem un vector amb les condicions inicals de w_0 +- 0.05 per facilitar
        !els bucles i simplificar el codi
        phi_0 = 0.d0
        w_0 = 2.d0*Wn
        w0_d(1) = w_0 + 0.05d0 !(rad/s) +
        w0_d(2) = w_0 - 0.05d0 !(rad/s) -

        pasos = 6000 
        pas = 15.d0*Tn/dble(pasos)

        write (1,*) "#REULTATS PER EULER PREDITOR"
        !A PARTIR D'ARA NOMÉS UTILITZAREM EL MÈTODE DE PREDITOR/CORRECCIO
        do c = 1,2
            yin(1) = phi_0
            yin(2) = w0_d(c) !1 +, 2 -
            write (1,*) "#Condicions per ω =", yin(2)
            write (1,200) "Temps", "Valor de phi", "Valor de w"
            do i = 1, pasos
                call Euler_P (pas,yin,youtp,neq)
                yin = youtp
                write(1,*) i*pas, youtp(1), youtp(2) !temps, phi, w
            enddo
            write (1,"(a1)")
            write (1,"(a1)")
        enddo

        call system ("gnuplot -p plot5.gnu") !gràfica de l'espai fàsic
c       |OBSERVACIÓ|
c       Es tracta d'un cas límit en el que per w_0 + 0.05 el pendol comença
c       a donar voltes circulars en el play xy, es per això que la seva 
c       velocitat va augmentant i disminuint segons on es trobi, i l'angle creix
c       a mesura que va fent més voltes.
c       Mentre que per w_0 - 0.05 
c       el pèndol no té suficient velocitat angular i es queda escrivint el
c       típic moviment de pèndol (de dreta a esquerra)
c-------------------- APARTAT E CONVERGENCIA DEL MÈTODE --------------------

        write (1,*) "#APARTAT D: TRANSICIÓ"
        !creem un vector amb les condicions inicals de w_0 +- 0.05 per facilitar
        !els bucles i simplificar el codi
        phi_0 = 2.87d0
        w_0 = 0.d0

        pasos_e(1) = 300
        pasos_e(2) = 550
        pasos_e(3) = 1000
        pasos_e(4) = 20000

        do c= 1, 4,1
            yin(1) = phi_0
            yin(2) = w_0
            pasos = pasos_e(c)
            pas = 11.d0*Tn/dble(pasos)
            write (1,*) "#REULTATS PER EULER CORRECTIU AMB PAS = ",
     * PASOS
            write (1,200) "Temps", "Ecinetica", "Epotencial", "Etotal"
            do i = 1, pasos
                call Euler_P (pas,yin,youtp,neq)
                yin = youtp
                write(1,*) i*pas, EKIN(youtp(2)), EPOT(youtp(1)),
     *EPOT(youtp(1))+EKIN(youtp(2)) !temps, E.cinetica, E. potencial, E.total
            enddo
            write (1,"(a1)")
            write (1,"(a1)")
        enddo

        call system ("gnuplot -p plot6.gnu") !gràfica de l'energia en funció
                                             !del temps segons els pasos fets

c--------------------------------FORMATS--------------------------------

200     format(a7,10x,a20,10x,a20,10x,a20)
300     format(f20.12,10x,f20.12,10x,f20.12)
400     format(f20.12,10x,f20.12,10x,f20.12,10x,f20.12)

C---------------------------------------------------------------------------
   



        END PROGRAM 



c-------------------------- FUNCIONS I SUBRUTINES ----------------------

c---------------------------SUBRUTINA DERIVADA--------------------------
c       !Aquesta subrutina és molt important!
c       Té per entrades yin on |yin(1) = angle 
c                              |yin(2) = derivada de l'angle 
c       Té per surtida yout on |dyout(1) = derivda de l'angle = yin(2)
c                              |dyout(2) = derivada de yin(2) = derivada
c                                                           segona de l'angle
c       En el nostre cas el nostre vector funció té dimensió 2
c       SUBRUTINA FETA A PARTIR DE LA IDEA DE BRUNO JULIÀ A LES CLASSES
C-----------------------------------------------------------------------
        subroutine derivada (pas,yin,dyout,neq) !añador neq
        implicit none
        integer neq
        double precision t, yin(neq), dyout(neq)
        double precision g,l,pas
        parameter (g=10.44d0, l=1.07d0)

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
c--------------------- SUBRUTINA EULER PREDITOR 1 PAS -----------------------
c       Amb la Subrutina Derivada que calcula les derivades de l'angle i
c       la derivada de la derivada de l'angle podem programar Euler
c       Té per ENTRADES els valors de l'angle i la derivada de l'angle
c           |yin(1) = angle_0
c           |yin(2) = derivada de l'angle = velocitat angular_0
c       i el pas que és constant segons com definim el problema. El num.
c       d'equacions utilitzades, en aquest cas són 2.
c       Té per SURTIDA el valor youtp d'un sol pas que fa ús del vector
c       predictor
c           |youtp(1) = angle_1
c           |youtp(2) = derivada de l'angle = velocitat angular_1
c       Aquesta subrutina crida a la subrutina derivada
c-----------------------------------------------------------------------
       
        subroutine Euler_P (pas,yin,youtp,neq)
        implicit none
        integer neq
        double precision pas,yin(neq),dyout(neq),youtp(neq),yp(neq),
     *dyoutp(2)
            call derivada(pas,yin,dyout,neq) 
            yp(1) = yin(1) + pas*dyout(1) !predictor
            yp(2) = yin(2) + pas*dyout(2)
            !de forma més compacte yp = yin +pas*dyout però m'agrada 
            !posar-ho de forma més explícita
            call derivada(pas,yp,dyoutp,neq) !calculem les derivades del predictor
            youtp(1) = yin(1) +((pas/2.d0)*(dyout(1)+dyoutp(1))) 
            youtp(2) = yin(2) +((pas/2.d0)*(dyout(2)+dyoutp(2))) 
        end 

c----------------------- Funció energia cinètica  -----------------------------
 
        double precision function EKIN(w)
        implicit none
        double precision g,l,m,w
        parameter (g=10.44d0, l=1.07d0, m=0.98d0)

            EKIN = (1.d0/2.d0)*m*((w*l)**2)

        return 
        end 
c----------------------- Funció energia potencial -----------------------------
 
        double precision function EPOT(phi)
        implicit none
        double precision g,l,m,phi
        parameter (g=10.44d0, l=1.07d0, m=0.98d0)

            EPOT = -m*g*l*cos(phi)

        return
        end 


