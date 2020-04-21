% psudo Panel method
function [A, cen, Ixx, Iyy, Ixy, Ip] = sectionalMoments( x, y ) 
%sectionalMoments Geometry of a planar polygon
%
%   SECTIONALMOMENTS( X, Y ) returns area, X centroid,
%   Y centroid and area moments.

% For theory see:
% Calculation of The Moments of Polygons, David Hally
% https://apps.dtic.mil/dtic/tr/fulltext/u2/a183444.pdf

 
% check if inputs are same size
if ~isequal( size(x), size(y) )
  error( 'X and Y must be the same size');
end
 
% temporarily shift data to mean of vertices for improved accuracy
xm = mean(x);
ym = mean(y);
x = x - xm;
y = y - ym;
  
% summations for CCW boundary
xp = x( [2:end 1] );
yp = y( [2:end 1] );
a = x.*yp - xp.*y;
 
A = sum( a ) /2;

% TODO: Tidy up
% pass out principle and centroidal moments
% discard for numerically small values of A
if A~=0
    
    xc = sum( (x+xp).*a  ) /6/A;
    yc = sum( (y+yp).*a  ) /6/A;
    Ixx = sum( (y.*y +y.*yp + yp.*yp).*a  ) /12;
    Iyy = sum( (x.*x +x.*xp + xp.*xp).*a  ) /12;
    Ixy = sum( (x.*yp +2*x.*y +2*xp.*yp + xp.*y).*a  ) /24;
    
    % check for CCW versus CW boundary
    if A < 0
        A = -A;
        Ixx = -Ixx;
        Iyy = -Iyy;
        Ixy = -Ixy;
    end
    
    % centroidal moments
    Iuu = Ixx - A*yc*yc;
    Ivv = Iyy - A*xc*xc;
    Iuv = Ixy - A*xc*yc;
    
    % replace mean of vertices
    x_cen = xc + xm;
    y_cen = yc + ym;
    cen = [x_cen  y_cen];
    Ixx = Iuu + A*y_cen*y_cen;
    Iyy = Ivv + A*x_cen*x_cen;
    Ixy = Iuv + A*x_cen*y_cen;
    Ip = Ixx + Iyy;
           
else

    A = 0; cen = [0 0];
    Ixx = 0; Iyy = 0; Ixy = 0; Ip = 0;
    
end
