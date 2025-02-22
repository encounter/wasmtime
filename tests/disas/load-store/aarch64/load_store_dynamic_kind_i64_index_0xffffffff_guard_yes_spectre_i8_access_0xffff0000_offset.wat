;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -W memory64 -O static-memory-maximum-size=0 -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; function u0:0:
;; block0:
;;   ldr x11, [x0, #88]
;;   ldr x13, [x0, #80]
;;   movz x12, #0
;;   add x13, x13, x2
;;   movz x14, #65535, LSL #16
;;   add x13, x13, x14
;;   subs xzr, x2, x11
;;   csel x12, x12, x13, hi
;;   csdb
;;   strb w3, [x12]
;;   b label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   ldr x11, [x0, #88]
;;   ldr x13, [x0, #80]
;;   movz x12, #0
;;   add x13, x13, x2
;;   movz x14, #65535, LSL #16
;;   add x13, x13, x14
;;   subs xzr, x2, x11
;;   csel x12, x12, x13, hi
;;   csdb
;;   ldrb w0, [x12]
;;   b label1
;; block1:
;;   ret
