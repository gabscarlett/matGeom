function [centroid] = centroidOfPolyhedron(vertex,faces)

% Theory taken from: http://wwwf.imperial.ac.uk/~rn/centroid.pdf
    
% area of closed polyhedron
vector1 = vertex(faces(:, 2), :) - vertex(faces(:, 1), :);
vector2 = vertex(faces(:, 3), :) - vertex(faces(:, 1), :);

% area of each triangle
triangAreasTmp =0.5*cross(vector1,vector2);
triangAreas(:,1) = (triangAreasTmp(:,1).^2+triangAreasTmp(:,2).^2 ...
    +triangAreasTmp(:,3).^2).^(1/2); 

% total area
totArea = sum(triangAreas);

point1 = vertex(faces(:, 1), :);
point2 = vertex(faces(:, 2), :);
point3 = vertex(faces(:, 3), :);

 % centroid of each triangle
centroidTriangles = (1/3) .* (point1 + point2 + point3);

mg(:,1) = triangAreas(:,1) .*  centroidTriangles(:,1);
mg(:,2) = triangAreas(:,1) .*  centroidTriangles(:,2);
mg(:,3) = triangAreas(:,1) .*  centroidTriangles(:,3);
mg2 = [mg(:,1) mg(:,2) mg(:,3)];

% location of centroid
centroid = sum(mg2)./totArea;
    
end