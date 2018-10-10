function sigDeriv = derivative( sig , xAxis )
%% Takes the Derivative of Input wrt the x Axis                           %
%                                                                         %
% Inputs:  sig: Multi-dimensional Array with Signals Located at the Last  %
%          Dimension (Up to 4 Dimensions)                                 %
%          xAxis: Independent Variable on the X-Axis                      %
% Outpurs: sigDervi: Derivative of the Function wrt to the Independent    %
%          Variable                                                       %
%                                                                         %
% Terahertz Biophotonics Laboratory                                       %
% Mahmoud E. Khani 09-17-2018                                             %
% mahmoud.ebrahimkhani@stonybrook.edu                                     %
% m.ebrahimkhani1993@gmail.com                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dt = diff( xAxis( 1 : 2 ) ) ;
sigDeriv = zeros( size( sig ) ) ;
numDimen = size( size( sig ) , 2 ) ; % # of Dimensions
if numDimen == 2 % 2 Dimensional
    for ii = 1 : size( sig , 1 )
        derivTemp( : ) = diff( sig( ii , : ) ) / dt ; % Derivate
        sigDeriv( ii , : ) = [ 0  derivTemp ] ; % Pad with 1 Zero
    end
end
if numDimen == 3 % 3 Dimensional
    for ii = 1 : size( sig , 1 )
        for jj = 1 : size( sig , 2 )
            derivTemp( : ) = diff( sig( ii , jj , : ) ) / dt ; % Derivate
            sigDeriv( ii , jj , : ) = [0 derivTemp] ; % Pad with 1 Zero
        end
    end
end
if numDimen == 4 % 4 Dimensional
    for ii = 1 : size( sig , 1 )
        for jj = 1 : size( sig , 2 )
            for kk = 1 : size( sig , 3 )
                derivTemp1( : ) = sig( ii , jj , kk , : ) ;
                derivTemp( : ) = diff( derivTemp1 ) / dt ; % Derivate
                sigDeriv( ii , jj , kk , : ) = [0 derivTemp] ; % Pad with 1 Zero
            end
        end
    end
end
    