function sigSpecPower = specPower( sig , h , N )
%% deconvolves data from sample with a reference signal in Fourier domain % 
%                                                                         %
% Inputs:  sig: Multi-dimensional Array with Time Series Located at the   %
%          final Dimension (Up to 4 Dimensions)                           %
%          h: Reference Signal                                            %
%          N: Nfft                                                        % 
% Outpurs:  sigSpecPower: Deconvolved Power Spectrum                      %
%                                                                         %
% Terahertz Biophotonics Laboratory                                       %
% Mahmoud E. Khani 09-17-2018                                             %
% mahmoud.ebrahimkhani@stonybrook.edu                                     %
% m.ebrahimkhani1993@gmail.com                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% take the mean of the amplitude spectra of the refrences
for ii = 1 : size( h , 1 )
    tempFour = h( ii , : ) ;
    tempH( ii , : ) = abs ( fft( tempFour , N ) ) ;
end
H = mean( tempH ) ;
numDimen = size( size( sig ) , 2 ) ; % # of Dimensions
if numDimen == 2 % 2 Dimensional
    for ii = 1 : size( sig , 1 )
        fftTemp(:) = fft( sig( ii , : ) , N ) ; % DFT
        % Deconvolved Power Spectrum
        sigSpecPower( ii , : ) = -1 * abs( fftTemp ./ H ) .^ 2 ; 
    end
end
if numDimen == 3 % 3 Dimensional
    for ii = 1 : size( sig , 1 )
        for jj = 1 : size( sig , 2 )
            fftTemp1( : ) = sig( ii , jj , : ) ;
            fftTemp( : ) = fft( fftTemp1 , N ) ; % DFT
            % Deconvolved Power Spectrum
            sigSpecPower( ii , jj , : ) = -1 * abs( fftTemp ./ H ) .^ 2 ; 
        end
    end
end
if numDimen == 4 % 4 Dimensional
    for ii = 1 : size( sig , 1 )
        for jj = 1 : size( sig , 2 )
            for kk = 1 : size( sig , 3 )
                fftTemp1( : ) = sig( ii , jj , kk , : ) ;
                fftTemp( : ) = fft( fftTemp1 , N ) ; % DFT
                % Deconvolved Power Spectrum
                sigSpecPower( ii , jj , kk , : ) = -1 * abs(fftTemp ./ ...
                    H) .^ 2; 
            end
        end
    end
end
    