function [x1,x2,x3,x4,x5] = importdata(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [X1,X2,X3,X4,X5] = IMPORTFILE(FILENAME) Reads data from text file
%   FILENAME for the default selection.
%
%   [X1,X2,X3,X4,X5] = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data
%   from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   [x1,x2,x3,x4,x5] = importfile('rankingcandidates.dat',1, 240);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2018/04/10 15:33:56

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Format for each line of text:
%   column1: categorical (%C)
%	column2: categorical (%C)
%   column3: categorical (%C)
%	column4: categorical (%C)
%   column5: categorical (%C)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%C%C%C%C%C%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow(1)-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    textscan(fileID, '%[^\n\r]', startRow(block)-1, 'WhiteSpace', '', 'ReturnOnError', false);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
x1 = dataArray{:, 1};
x2 = dataArray{:, 2};
x3 = dataArray{:, 3};
x4 = dataArray{:, 4};
x5 = dataArray{:, 5};

