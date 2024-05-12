DEVICES=(
  "20-3c-ae-d3-09-6d"  # trackpad
  # "f9-c6-51-5d-d0-55"  # keyboard
)

function bt-pair() {
  for DEVICE in ${DEVICES[@]}; do
    echo "Pairing $DEVICE..."
    sleep 1
    blueutil --unpair "$DEVICE" --info "$DEVICE"
    sleep 1
    blueutil --pair "$DEVICE" --info "$DEVICE"
    sleep 1
    blueutil --connect "$DEVICE" --wait-connect "$DEVICE"
  done

  echo "All devices paired"
}

function bt-unpair() {
  for DEVICE in ${DEVICES[@]}; do
    echo "Unpairing $DEVICE..."
    blueutil --unpair "$DEVICE"
  done

  echo "All devices unpaired"
}
