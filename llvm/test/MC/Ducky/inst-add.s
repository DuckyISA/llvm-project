; RUN: llvm-mc -triple ducky -show-encoding < %s 2> %t | FileCheck %s
; RUN: not test -s %t

test:
  add r0, r1
  add r1, sp
  add fp, 0x79
  add r0, 0x7fff

; CHECK: add r0, r1 ; encoding: [0x1c,0x08,0x00,0x00]
; CHECK: add r1, sp ; encoding: [0x5c,0xf8,0x00,0x00]
; CHECK: add fp, 0x79 ; encoding: [0x9c,0x07,0xf3,0x00]
; CHECK: add r0, 0x7fff ; encoding: [0x1c,0x00,0xff,0xff]
