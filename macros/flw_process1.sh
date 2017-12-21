#! /bin/bash
# TPC data
export STTPCDIR=/cache/scr/spirit/DataAskedByMizuki/
export ST132DIR=${STTPCDIR}Sn132-All-LayerCut90-GC-DS-GiordanoCommentOut/
export ST108DIR=${STTPCDIR}Sn108-All-LayerCut90-GC-DS-GiordanoCommentOut/
export ST124DIR=${STTPCDIR}Sn124-All-LayerCut90-GC-DS-GiordanoCommentOut/
export ST112DIR=${STTPCDIR}

#BigRIPS data
export STBEAM132=/cache/scr/spirit/DataAskedByMizuki/beam.Sn132_all/
export STBEAM108=/cache/scr/spirit/DataAskedByMizuki/beam.Sn108/
export STBEAM124=/cache/scr/spirit/DataAskedByMizuki/beam.Sn124/

#KATANA data
export STKATANADIR=/data/spdaq01/katana/root/katana/

#Kyoto data
export STKYOTODIR=/cache/scr/spirit/kaneko/rootfile/kyoto/
export STKYMLTDIR=/cache/scr/spirit/kaneko/rootfile/kyoto_re/mult/
#--------------

#RUN=2900 VER=0 root -b -q flw_process1.C

## 132
RUN132=(\
"2841" "2843" "2844" "2845" "2846" "2848" "2849" "2850" "2851" "2852" "2855" "2856" \
"2857" "2858" "2859" "2860" "2861" "2875" "2877" "2878" "2879" "2880" "2881" "2882" \
"2883" "2884" "2887" "2888" "2889" "2890" "2891" "2892" "2893" "2894" "2896" "2898" "2899" \
"2900" "2901" "2902" "2903" "2904" "2905" "2907" "2914" "2916" "2917" "2919" "2920" "2921" "2922" \
"2924" "2925" "2926" "2927" "2929" "2930" "2931" "2932" "2933" \
"2934" "2935" "2936" "2939" "2940" "2941" "2942" "2943" "2944" "2945" "2946" "2948" \
"2955" "2956" "2958" "2959" "2960" "2961" "2962" "2964" "2965" "2966" "2968" "2969" \
"2970" "2971" "2972" "2973" "2975" "2976" "2977" "2978" "2979" "2980" "2981" "2982" \
"2983" "2984" "2985" "2986" "2988" "2989" "2990" "2991" "2992" "2993" "2997" "2999" \
"3000" "3002" "3003" "3007" "3039"\
)

## 108
RUN108=(\
"2272" "2273" "2274" "2275" "2276" "2283" "2284" \
"2285" "2286" "2288" "2289" "2291" "2310" "2311" "2314" "2315" "2320" "2322" "2323" "2324" "2325" \
"2331" "2332" "2333" "2334" "2335" "2336" "2337" "2340" "2341" "2362" "2363" "2368" "2369" "2370" \
"2371" "2372" "2373" "2374" "2375" "2378" "2379" "2380" "2381" "2382" "2383" "2384" "2385" "2386" \
"2387" "2388" "2389" "2391" "2392" "2393" "2394" "2395" "2396" "2397" "2398" "2399" "2400" "2401" \
"2402" "2429" "2432" "2433" "2434" "2437" "2438" "2439" "2440" "2442" "2453" "2461" "2462" "2463" \
"2501" "2502" "2503" "2505" "2506" "2507" "2508" "2509"\
)

##124
RUN124=(\
"3059" "3061" "3062" "3065" "3066" "3068" "3069" "3071" "3074" "3075" "3076" "3077" \
"3078" "3080" "3081" "3082" "3083" "3084" "3085" "3087" "3088" "3089" "3090" "3091" \
"3092" "3093" "3094" "3095" "3097" "3098" "3102" "3103" "3138" "3139" "3140" "3141" \
"3142" "3143" "3144" "3145" "3146" "3148" "3149" "3150" "3151" "3152" "3153" "3154" \
"3155" "3156" "3157" "3158" "3159" "3165" "3166" "3167" "3168" "3169" "3170" "3171" \
"3172" "3177" "3179" "3180" "3181" "3182" "3183" "3184" \
)

ALL=(\

)
##--- for Process1 ------------------------------------
RUNNUMBER1=(\
"3039" "2272" "2509" "3059" \
)

VERSION=2


function process1(){
    typeset -i I=0
    while(( $I < ${#RUNNUMBER1[@]} ))
    do
	RUN=${RUNNUMBER1[I]} 
	LOG=log/prc1_${RUN}_v${VERSION}.log
	echo RUN=${RUN} VER=$VERSION root -b -q flw_process1.C '>&' $LOG
	RUN=${RUN} VER=$VERSION root -b -q flw_process1.C >& $LOG &
	let I++
	if [ $I -ge ${#RUNNUMBER1[@]} ]; then
            break;
        fi

	RUN=${RUNNUMBER1[I]} 
	LOG=log/prc1_${RUN}_v${VERSION}.log
        echo RUN=${RUN} VER=$VERSION root -b -q flw_process1.C '>&' $LOG
	RUN=${RUN} VER=$VERSION root -b -q flw_process1.C >& $LOG &
	let I++
	if [ $I -ge ${#RUNNUMBER1[@]} ]; then
            break;
        fi

	RUN=${RUNNUMBER1[I]} 
	LOG=log/prc1_${RUN}_v${VERSION}.log
        echo RUN=${RUN} VER=$VERSION root -b -q flw_process1.C '>&' $LOG
	RUN=${RUN} VER=$VERSION root -b -q flw_process1.C >& $LOG &
	let I++
	if [ $I -ge ${#RUNNUMBER1[@]} ]; then
            break;
        fi

	RUN=${RUNNUMBER1[I]} 
	LOG=log/prc1_${RUN}_v${VERSION}.log
        echo RUN=${RUN} VER=$VERSION root -b -q flw_process1.C '>&' $LOG
	RUN=${RUN} VER=$VERSION root -b -q flw_process1.C >& $LOG 
	let I++
    done
}


process1 





