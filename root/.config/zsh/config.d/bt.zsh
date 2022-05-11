DEVICES=(
  "20-3c-ae-d3-09-6d"  # trackpad
  # "f9-c6-51-5d-d0-55"  # keyboard
)

function bt-pair() {
  for DEVICE in ${DEVICES[@]}; do
    echo "Pairing $DEVICE..."
    blueutil --connect "$DEVICE" --wait-connect "$DEVICE"
  done

  echo "All devices paired"
}

function bt-unpair() {
  for DEVICE in ${DEVICES[@]}; do
    echo "Unpairing $DEVICE..."
    blueutil --disconnect "$DEVICE" --wait-disconnect "$DEVICE"
  done

  echo "All devices unpaired"
}
