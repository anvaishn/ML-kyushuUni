function [] = gauss1d_plot(x, mu, sigma)
    for i = 1:length(x)
        z = (2*pi*sigma.^2)^(-1/2)*exp(-(x-mu).^2./(2*sigma.^2));
    end
    plot(x,z);
    waitfor(gcf);
endfunction
