LINKARGS = "-mthumb -mcpu=cortex-m3 -Tefm32gg.ld --specs=nosys.specs -lgcc -lc -lnosys -lm -Wl,--start-group -lnosys -lgcc -lc -lm -Wl,--start-group"

bin: src/main.rs
	cargo linkargs $(LINKARGS) --target thumbv7m-none-eabi --verbose

hex: bin
	arm-none-eabi-objcopy -O ihex target/thumbv7m-none-eabi/debug/button-blink button-blink.hex
