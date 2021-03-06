#! /bin/bash                                                                                                       

source runList.sh

##--- for Process4 ------------------------------------
# *****> <Edit Here>  

#RUNNUMBER1=(${RNF132})    
#RUNNUMBER1=(${RNF108})                                                                              
#RUNNUMBER1=(${RNF124}) 
RUNNUMBER1=(${RNF112})


CVRUN=${RUNNUMBER1[0]}

###-------------------------------------
RE1MX2=1
## 0 REAL and MIXed
## 1 REAL only
## 2 MIXed only



#RUN=2841 VER=4.2.1 MIX=0 FLC=run2841_rf.v4.2.Psicv0 FLCS=run2841_rf.v4.5.Psis1rcv0 root flw_process4.C

# *****> <Edit Here> 
VERSION=5.1.0
FLC=run${CVRUN}_rf.v5.1.Psi2rtcv0   # Phi_rp
FLCS=run${CVRUN}_rf.v5.1.Psis1rcv0  # Phi_sub 
     
echo $RUNNUMBER1

function process4() {
    typeset -i I=0
    
    if [ ${RE1MX2} -ne "2" ]; then
	MIX=0
	echo " REAL data --- "

	while(( I < ${#RUNNUMBER1[@]} ))
	do
            RUN=${RUNNUMBER1[I]}
	    LOG=log/prooc4_${RUN}_v${VERSION}.log
	    echo RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root flw_process4.C  '>&' $LOG 
	    RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root -b -q flw_process4.C >& $LOG &
            let I++
	    if [ $I -ge ${#RUNNUMBER1[@]} ]; then
		break;
	    fi
	    
            RUN=${RUNNUMBER1[I]}
	    LOG=log/prooc4_${RUN}_v${VERSION}.log
	    echo RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root flw_process4.C  '>&' $LOG 
	    RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root -b -q flw_process4.C >& $LOG &
            let I++
	    if [ $I -ge ${#RUNNUMBER1[@]} ]; then
		break;
	    fi
	    
            RUN=${RUNNUMBER1[I]}
	    LOG=log/prooc4_${RUN}_v${VERSION}.log
	    echo RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root flw_process4.C  '>&' $LOG 
	    RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root -b -q flw_process4.C >& $LOG 
            let I++
	done
    fi

    if [ ${RE1MX2} -ne "1" ]; then
	echo " MIXed data --- "
	MIX=1
	I=0
	while(( I < ${#RUNNUMBER1[@]} ))
	do
	    RUN=${RUNNUMBER1[I]}
	    LOG=log/prooc4_${RUN}_v${VERSION}.log
	    echo RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root flw_process4.C  '>&' $LOG 
	    RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root -b -q flw_process4.C >& $LOG &
	    let I++
	    if [ $I -ge ${#RUNNUMBER1[@]} ]; then
		break;
	    fi

	    RUN=${RUNNUMBER1[I]}
	    LOG=log/prooc4_${RUN}_v${VERSION}.log
	    echo RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root flw_process4.C  '>&' $LOG 
	    RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root -b -q flw_process4.C >& $LOG &
	    let I++
	    if [ $I -ge ${#RUNNUMBER1[@]} ]; then
		break;
	    fi
	    
	    RUN=${RUNNUMBER1[I]}
	    LOG=log/prooc4_${RUN}_v${VERSION}.log
	    echo RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root flw_process4.C  '>&' $LOG 
	    RUN=${RUN} VER=${VERSION} MIX=${MIX} FLC=${FLC} FLCS=${FLCS} root -b -q flw_process4.C >& $LOG 
	    let I++
	done
    fi

}


process4

