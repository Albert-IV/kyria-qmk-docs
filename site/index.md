# Kyria + QMK = 💙

This site aims to bridge the gap between the QMK documentation and what you need to get your new Kyria up and running.  If nothing else, these are my own personal docs.

**Note:** Anywhere you see `<YOUR_BINDINGS>` you will need to replace this with whatever keymaps you are using.  You can use `default` when starting out, but it's recommended that you copy the bindings to your own version so you do not have issues syncing your Github fork with the official QMK repository.  `cp keyboards/kyria/keymaps/default keyboards/kyria/keymaps/<YOUR_BINDING_NAME>`

# Flashing Your Keyboard via CLI

If you're a CLI type of person, the default flashing command will not work. This is because the default firmware uses the incorrect bootloader by default.

### Micro-USB (Pro-Micro)

```
make kyria:<YOUR_BINDINGS>:avrdude
```

### USB-C (Teensy)

TBD (Feel free to open a PR!)


# Making Either Side Master

By default your Kyria will only work when your USB or USB-C connector is on the left side.  To make your keyboard be able to know which side you've connected automatically, do the following:

In your `keyboards/kyria/keymaps/<YOUR_BINDINGS>/config.h` file, add the following line somewhere outside of the `#ifdef` blocks:

```
#define EE_HANDS
```

Next you will need to flash both sides of your keyboard using the following commands:

When flashing the left side of your keyboard:

```
make kyria:<YOUR_BINDINGS>:avrdude-split-left
```

When flashing the right side of your keyboard:

```
make kyria:<YOUR_BINDINGS>:avrdude-split-right
```


