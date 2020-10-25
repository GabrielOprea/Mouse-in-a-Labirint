function [values, colind, rowptr] = matrix_to_csr(A)

  n = size(A,1);
  nz = 0;

  for i = 1:n
    gasit = 0;  
    for j = 1:n    
      
      if A(i,j) != 0
        nz++;
        values(nz)= A(i,j);
        colind(nz)= j;
        
        if(gasit == 0)
          gasit = 1;
          rowptr(i) = nz;
        endif
     
      endif
    
    endfor

    rowptr(n+1) = nz + 1;
    
  endfor

endfunction