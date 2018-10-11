#!/bin/bash

#Define function output_trigger to display the information from the selected led's trigger file.
#And replace the `[` and `]` with `*` when a string around by `[` and `]`. e.g `[test]` will be converted to `test*`
#This is for task 5
output_trigger() {
  echo "    "
  echo "Associate Led with a system Event"
  echo "================================="

  echo "Available events are:"
  echo "---------------------"

  task3_counter=1
  #Define a re to substitute the special character `[` and `]` with `*`
  for item in `cat $path/${array_led_info[$selected_led_number]}/trigger|sed -e 's/\[/g/' -e 's/\]/\*/'`;
  do
    echo "$task3_counter)" "$item";
    task3_counter=$(expr $task3_counter + 1)
  done;
  echo "$task3_counter)" "Quit to previous menu"
}

#The function "operate" allows you how to operate the selected led.
#This is for task 3 & 4.
operate() {
  echo "$led_name"
  echo "================="
  echo "    "
  echo "Waht would you like to do with this led?"
  echo "1) turn on"
  echo "2) turn off"
  echo "3) associate with a system event"
  echo "4) associate with the performance of a process"
  echo "5) stop associate with a process's performance"
  echo "6) quit to main menu"
  echo "Please enter a number (1-6) for your choice:"
  
  read operate_number
  case  $operate_number in
    1*)
    sudo chmod 775 $path/${array_led_info[$selected_led_number]}/brightness
    sudo  echo 1 |sudo tee $path/${array_led_info[$selected_led_number]}/brightness >/dev/null
    ;;
    2*) 
    sudo chmod 775 $path/${array_led_info[$selected_led_number]}/brightness
    sudo echo 0 |sudo tee $path/${array_led_info[$selected_led_number]}/brightness > /dev/null
    ;;
    3*)
    output_trigger
    ;;
    [4-5]*)
    echo "I have not implemented these both features."
    ;;
    6*)
    break;;
esac
}

#Following code is to read the info from the folder /sys/class/leds then display
#This is for task 2
counter=1
echo "    "
echo "Welcome to Led_Kconfigurator!"
echo "=============================="
echo "Please select an led to configure:"
echo "    "
path='/sys/class/leds'
for led_name in $(ls  $path); do
  array_led_info[$counter]="$led_name"
  echo "$counter.$led_name"
  counter=$(expr $counter + 1)
done
  echo "$counter.Quit"
  echo "Please enter a number (1-$counter) for the led to configure or quit:"

  read selected_led
  selected_led_number=$selected_led
  led_name=${array_led_info[$selected_led_number]}

result=$((selected_led - counter))

if [ $result = 0 ]; then
   clear
else
   operate
fi
