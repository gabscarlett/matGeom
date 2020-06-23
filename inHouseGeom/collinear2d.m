   function tf = collinear2d(p1,p2,p3)
   % test if three points are collinear in a plane
   % make line with first two points
     m = slope(p1,p2);
     b = intercept(p1,p2);
     % evaluate with third point
     y = (m*p3(1)+b) ; 
     % test if collinear within error bound
     tol = 0.000001; % tolerance
     tf=abs(y- p3(2))<tol; % return true/false
   end
     % get slope
     function m = slope(p1,p2)
     m = (p2(2)-p1(2))/(p2(1)-p1(1));
     end
     % get intercept 
     function b = intercept(p1,p2)
    m = slope(p1,p2);
    b = p1(2)-m*p1(1);
   end