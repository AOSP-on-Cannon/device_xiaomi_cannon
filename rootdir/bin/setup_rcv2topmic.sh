# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh 2000.wav  1

sleep 1

echo "enabling top mic"
    tinymix 'Mic_Type_Mux_2' 'DCC'
    tinymix 'UL1_CH1 ADDA_UL_CH1' 1
    tinymix 'UL1_CH2 ADDA_UL_CH2' 1
    tinymix 'MISO0_MUX' 'UL1_CH2'
    tinymix 'MISO1_MUX' 'UL1_CH2'
    tinymix 'ADC_R_Mux' 'Right Preamplifier'
    tinymix 'PGA_R_Mux' 'AIN2'

# start recording
nohup tinycap /sdcard/top_mic.wav -D 0 -d 10 -r 48000 -b 16 -c 2 -T 6 > /sdcard/nohup.out &

sleep 2
echo "enabling receiver"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'RCV Mux' 'Voice Playback'

    tinyplay /vendor/etc/rcv_pink.wav

sleep 1

echo "disabling top mic"
    tinymix 'Mic_Type_Mux_2' 'Idle'
    tinymix 'UL1_CH1 ADDA_UL_CH1' 0
    tinymix 'UL1_CH2 ADDA_UL_CH2' 0
    tinymix 'ADC_L_Mux' 'Idle'
    tinymix 'ADC_R_Mux' 'Idle'
    tinymix 'PGA_L_Mux' 'None'
    tinymix 'PGA_R_Mux' 'None'

echo "disabling receiver"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 0
    tinymix 'ADDA_DL_CH2 DL1_CH2' 0
    tinymix 'RCV Mux'  'Open'

