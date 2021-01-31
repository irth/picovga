#include "pico/stdlib.h"
#include "hardware/pio.h"
// Our assembled program:
#include "sync.pio.h"
#include "color.pio.h"

int main() {   
    // stdio_init_all();

    PIO pio = pio0;
    uint offset = pio_add_program(pio, &sync_program);
    uint sm = pio_claim_unused_sm(pio, true);
    sync_program_init(pio, sm, offset, 14);

    pio_sm_put_blocking(pio, sm, 490+33);


    PIO pio_color = pio1;
    uint offset_color = pio_add_program(pio_color, &color_program);
    uint sm_color = pio_claim_unused_sm(pio_color, true);
    color_program_init(pio_color, sm_color, offset_color, 10);
    // pio_sm_put_blocking(pio_color, sm_color, 40);

     // The state machine is now running. Any value we push to its TX FIFO will
    // appear on the LED pin.
    while (true) {
            // printf("Hello, %d, %d", pio->irq, pio_color->irq);
        sleep_ms(500);
    }
}