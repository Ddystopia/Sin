.text
.global sin_c
sin_c:
  movq %xmm0, %rax
  shrq $63, %rax
  cvtsi2sdq %rax, %xmm2
  movsd RTAU(%rip), %xmm1
  mulsd %xmm0, %xmm1
  addsd HALF(%rip), %xmm1
  subsd %xmm2, %xmm1
  cvttsd2siq %xmm1, %rax
  cvtsi2sdq %rax, %xmm1
  mulsd TAU(%rip), %xmm1
  subsd %xmm1, %xmm0
  movapd %xmm0, %xmm2
  mulsd %xmm0, %xmm2
  // %xmm0 - x %xmm2 - xx %xmm1 - res
  movsd 13*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 12*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 11*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 10*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 9*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 8*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 7*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 6*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 5*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 4*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 3*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 2*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd 1*8+fci(%rip), %xmm1
  mulsd %xmm2, %xmm1
  addsd fci(%rip), %xmm1
  // cycle end
  mulsd %xmm1, %xmm0
  ret

.data
fci: // (-1)^i * 1/(2i+1)!, i is index
  .double  1
  .double -0.166666666666666666666666666666666666
  .double  0.008333333333333333333333333333333333
  .double -0.000198412698412698412526317115478491
  .double  0.000002755731922398589251095059327045
  .double -0.000000025052108385441720223866179321
  .double  0.000000000160590438368216159258023325
  .double -0.000000000000764716373181981741525580
  .double  0.000000000000002811457254345520992540
  .double -0.000000000000000008220635246624331036
  .double  0.000000000000000000019572941063391262
  .double -0.000000000000000000000038681701706306
  .double  0.000000000000000000000000064469502843
  .double -0.000000000000000000000000000091836898
RTAU: // 1 / 2pi
  .double .159154943091895345608222100963757839
TAU: // 2pi
  .double 6.283185307179586231995926937088370323
PI:
  .double 3.141592653589793238462643383279502884
HALF:
  .double 0.5

