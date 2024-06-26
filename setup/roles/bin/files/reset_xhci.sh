# sudo -i
echo -n "0000:3f:00.0" | tee /sys/bus/pci/drivers/xhci_hcd/unbind
sleep 5
echo -n "0000:3f:00.0" | tee /sys/bus/pci/drivers/xhci_hcd/bind