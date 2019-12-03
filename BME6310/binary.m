function[bin] = binary(num)
tic
%type in command window num = whatever number

B = [];
while(1)
    L = floor(log(num)/log(2));
    if num == 0
        break;
    end
    num = num-2^L;
    B(L+1)=1;
end
bin=fliplr(B)
toc
end