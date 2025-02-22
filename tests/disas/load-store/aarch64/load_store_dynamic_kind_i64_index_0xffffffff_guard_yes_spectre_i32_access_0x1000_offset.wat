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
    i32.store offset=0x1000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load offset=0x1000))

;; function u0:0:
;; block0:
;;   ldr x10, [x0, #88]
;;   ldr x12, [x0, #80]
;;   movz x11, #0
;;   add x12, x12, x2
;;   add x12, x12, #4096
;;   subs xzr, x2, x10
;;   csel x11, x11, x12, hi
;;   csdb
;;   str w3, [x11]
;;   b label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   ldr x10, [x0, #88]
;;   ldr x12, [x0, #80]
;;   movz x11, #0
;;   add x12, x12, x2
;;   add x12, x12, #4096
;;   subs xzr, x2, x10
;;   csel x11, x11, x12, hi
;;   csdb
;;   ldr w0, [x11]
;;   b label1
;; block1:
;;   ret
