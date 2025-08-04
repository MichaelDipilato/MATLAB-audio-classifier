function mp3towav(filename)

if exist(filename) == 2
    disp('The file exist')
    info = audioinfo(filename);
else 
    disp('File does not exist')
    return;
end
y = audioread(filename);
fs = info.SampleRate;
% disp(fs)
audiowrite([filename(1:end-3),'wav'],y,fs);
plot(y)
xlabel('Time (samples)')
ylabel('Amplitude')
sound(y,fs)