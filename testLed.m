function [isSucceed] = testLed(status_led1x)
isSucceed=0;
a=arduino('COM9','Uno');

status_led = str2num(status_led1x);
save('status_led.mat','status_led');
load('status_led');
% while(1)
%     load('status_led');
%     pause(2);
if (status_led ==  1)
    writeDigitalPin(a,'D2',1);
    writeDigitalPin(a,'D3',0);
    writeDigitalPin(a,'D4',0);
    pause(2)
elseif (status_led ==  2)
    writeDigitalPin(a,'D2',0);
    writeDigitalPin(a,'D3',1);
    writeDigitalPin(a,'D4',0);
     pause(2)
elseif (status_led ==  3)
    writeDigitalPin(a,'D2',0);
    writeDigitalPin(a,'D3',0);
    writeDigitalPin(a,'D4',1);
     pause(2)
end
% end
