function rec_lenght=get_RecLenght(directory)


 file = dir (directory);
   filenames = {file.name};
   rec_lenght = sum( ~cellfun(@isempty, strfind(filenames, '1_')) );
   