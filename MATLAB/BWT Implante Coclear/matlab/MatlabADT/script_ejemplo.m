db =ADT('timit');      %loads TIMIT database interface
db = filterdb(db,'sex','m');  %filters database for male speakers
text = 'have a good time using this program and enjoy yourself i hope this program is useful';
volume = 1;  %assigning the volume
text =strread(text,'%s');%converting Text form string to cell array
for ii=1:length(text)
    [word smpr] = query(db,'word',text{ii},1);%querying for the ii word  returnig the first match
    if ~isempty(word)
        max_v = max(word{1});   %normalizing the volume
        word{1}=word{1}.*(volume/max_v); %normalizing the volume
        sound(word{1},smpr);%play word (words return form query in the form of cell array
        pause(0.2);   %pauses for 0.2s
    end
end
