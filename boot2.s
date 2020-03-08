.code16
.global _start # makes our label "init" available to the outside

_start: # this is the beginning of our binary later.
  mov $0x0e, %ah # sets AH to 0xe (function teletype)
  mov $msg, %bx   # sets BX to the address of the first byte of our message
  mov 1(%bx), %al   # sets AL to the first byte of our message
  int $0x10 # call the function in ah from interrupt 0x10
  hlt # stops executing

msg: .asciz "Hello world!" # stores the string (plus a byte with value "0") and gives us access via $msg

.fill 510-(.-_start), 1, 0 # add zeroes to make it 510 bytes long
.word 0xaa55 # magic bytes that tell BIOS that this is bootable
