
s=serial('COM9');

fopen(s);
fwrite(s,2)
pause(1);
fclose(s);

% fopen(w);
% fwrite(w,2)
% pause(1);
% fclose(w);
% 
% fopen(w);
% fwrite(w,3)
% pause(1);
% fclose(w);