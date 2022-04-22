clc;
clear;
close all;
% [A,B] = generuj();


A = [    -46   -10   -27    19;
          -6   -50    30    44;
          33    30   -28     9;
         -21    37    50    33];

B = [   -29   -17   -29    47;
         44    11   -27    27;
          7   -17   -19    33;
        -10    12   -30    32];



fprintf('Nash : \n\n')
nash(A,B);
fprintf('\n\n Stackelberg a follower : \n\n')
rola_A = 'follower';
stackelberg(A,B,rola_A);
fprintf('\n\n Stackelberg a leader :\n\n')
rola_A = 'leader';
stackelberg(A,B,rola_A);