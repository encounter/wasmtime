;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; function u0:0:
;; block0:
;;   mov w12, w2
;;   movz x13, #0
;;   ldr x14, [x0, #80]
;;   add x14, x14, x2, UXTW
;;   movz x15, #65535, LSL #16
;;   add x14, x14, x15
;;   movz x11, #65535
;;   subs xzr, x12, x11
;;   csel x14, x13, x14, hi
;;   csdb
;;   strb w3, [x14]
;;   b label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   mov w12, w2
;;   movz x13, #0
;;   ldr x14, [x0, #80]
;;   add x14, x14, x2, UXTW
;;   movz x15, #65535, LSL #16
;;   add x14, x14, x15
;;   movz x11, #65535
;;   subs xzr, x12, x11
;;   csel x14, x13, x14, hi
;;   csdb
;;   ldrb w0, [x14]
;;   b label1
;; block1:
;;   ret
