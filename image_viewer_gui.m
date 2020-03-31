function image_viewer_gui(dir_path)
% SIMPLE_GUI2 Select a data set from the pop-up menu, then
% click one of the plot-type push buttons. Clicking the button
% plots the selected data in the axes.

%% Find the folder, create a list of its contents
%check if folder exists
if ( exist(dir_path, 'dir') ~= 7 )
    fprintf("Error. Folder not found in ~\\MATLAB\\. Try again.\n");
end
%dir pulls the data about each file in the folder
contents = dir(dir_path);
%first two entries are the folder itself and the parent, so we discard
contents = contents(3:end);
images = cell(size(contents));
for i = 1:length(contents)
   im_path = strcat(dir_path, '\', contents(i).name);
   images{1, i} = imread(im_path);
end

%initialize position to keep track of current item
current_pos = 1;
%% Create and program the GUI

%create and hide the GUI
f = figure('Visible', 'off'); 

%create components
hnext = uicontrol('Style', 'pushbutton', 'String', 'Next', 'Position', [350, 20, 70, 25], 'Callback',{@nextbutton_Callback});
hprev = uicontrol('Style', 'pushbutton', 'String', 'Prev', 'Position', [150, 20, 70, 25], 'Callback',{@prevbutton_Callback});
htext = uicontrol('Style','text','String',strcat("file ", string(i),"/", string(length(images))),'Position',[400,400,100,15]);
him = imshow(images{1, i}); title(contents(i).name, 'Interpreter', 'none');
align([hnext, hprev], 'None', 'Center');

%% program callbacks
function nextbutton_Callback(source,eventdata) 
% Display the next image in the list
     i = i+1;
     i = mod(i, length(images));
     him = imshow(images{1, i}); title(contents(i).name, 'Interpreter', 'none');
     htext.String = strcat("file ", string(i),"/", string(length(images)));

end

function prevbutton_Callback(source,eventdata) 
% Display the previous image in the list
    i = i-1;
    i = mod(i, length(images));
    him = imshow(images{1, i}); title(contents(i).name, 'Interpreter', 'none');
    htext.String = strcat("file ", string(i),"/", string(length(images)));

end


%% Initialize the UI.
% Change units to normalized so components resize automatically.
f.Units = 'normalized';
%him.Units = 'normalized';
hprev.Units = 'normalized';
hnext.Units = 'normalized';
htext.Units = 'normalized';


% Assign a name to appear in the window title.
f.Name = 'Image Viewer';

% Move the window to the center of the screen.
movegui(f,'center')

% Make the UI visible.
f.Visible = 'on';

end