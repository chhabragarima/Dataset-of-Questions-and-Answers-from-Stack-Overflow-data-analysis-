function [S,B] = FD(A,l)
  [n,d] = size(A);

  B = zeros(2*l,d);
  
  for i = 1:2*l-1
      B(i:i,1:d) = A(i:i,1:d);
  end
  
  for i = 2*l:n    
     for j =l:2*l 
        if any(B(j:j,1:d)) ==0 
            B(j:j,1:d) =  A(i:i,1:d);
            break
        end
     end
     
     [U,S,V]=svd(B);
     delta=power(S(l:l,l:l),2);
     if S(2*l:2*l,2*l:2*l) ~=0
         S1=S;
         for k=1:l-1
             S1(k:k,k:k)=max(0,sqrt(power(S1(k:k,k:k),2)-delta));
         end
         for k=l:2*l
             S1(k:k,k:k)=0;
         end
         B=S1*V';
     end
  end
end

     