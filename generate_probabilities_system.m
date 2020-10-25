function [A, b] = generate_probabilities_system(rows)

  L = zeros (rows);
  dim = 1;
  
  for i = 1:rows
    for j = 1:i
      L(i,j) = dim;
      dim = dim + 1;
    endfor 
  endfor #construiesc o matrice inferior triunghiulata
  
  dim = dim - 1; #dimensiunea sistemului de ecuatii
  A = zeros (dim);
  b = zeros (dim, 1);
  
  for i = 1:rows
    for j = 1:i
      #calculez nr de vecini ai fiecarui element 
      nr_neigh = 2; #orice element are 2 vecini in lateral
      
      if i != rows #vecinii de jos
        nr_neigh = nr_neigh + 2; 
      else
        nr_neigh = nr_neigh + 1;
      endif
      
      if j == 1 && j == i #daca e primul element,nu are vecini sus
        nr_neigh = nr_neigh; 
      else
        
        if j == 1 #daca e in stanga, are un vecin sus
          nr_neigh = nr_neigh + 1;
        else
          
          if j == i #la fel si in dreapta
            nr_neigh = nr_neigh + 1;
          else
            nr_neigh = nr_neigh + 2; #daca e la mijloc, are 2 vecini sus
          endif
        
        endif
      
      endif
      
      crt = L(i,j);
      el = crt;
      A(el,el) = nr_neigh;
      
      #matricea sistemului e simetrica; pt fiecare element din
      #labirint adaug -1 pe pozitiile vecinilor sai
      if i != rows
        el = L(i + 1,j);
        A(crt,el) = -1;
        A(el,crt) = -1;
        
        el = L(i + 1,j + 1);
        A(crt,el) = -1;
        A(el,crt) = -1;
      else
        b(crt) = 1;
      endif     
      
      if(crt != 1)
        
        if(j != 1)
          el = L(i,j - 1);
          A(el,crt) = -1;
          A(crt,el) = -1;
        endif
        
        if(j != i)
          el = L(i,j + 1);
          A(el,crt) = -1;
          A(crt,el) = -1;
        endif
      
      endif   

    endfor
  
  endfor

endfunction