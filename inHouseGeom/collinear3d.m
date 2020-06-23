   function tf = collinear3d(p1,p2,p3)
   % test if three points are collinear in 3D space plane
   
   % make a line with the first two points
   line = createLine3d(p1, p2);   
   tol = 0.000001; % tolerance
   % check if the thirsd point lies on the line
   tf = isPointOnLine3d(p3, line, tol);
   end