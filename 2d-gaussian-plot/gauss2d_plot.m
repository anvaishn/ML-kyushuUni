function []=gauss2d_plot(x,y,Mu,Sigma)
for i=1:length(x)
    for j=1:length(y)
    z(i,j)=g2_pdf(x(i),y(j),Mu,Sigma); 
    end
end

% figure(1); clf;
 surf(x,y,z); %surfc(x,y,z) ye contour dega i.e. projection on x-y plane
 waitfor(gcf);
% print -deps gauss2d_pdf_surf.eps
% figure(2);clf
% contour(x,y,z);
% print -deps gauss2d_pdf_contour.eps

endfunction