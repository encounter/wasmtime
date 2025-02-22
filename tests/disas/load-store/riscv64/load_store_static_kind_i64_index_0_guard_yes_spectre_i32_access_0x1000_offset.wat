;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -W memory64 -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

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
;;   lui a1,262144
;;   addi a4,a1,-1025
;;   slli a5,a4,2
;;   sltu a4,a5,a2
;;   ld a5,80(a0)
;;   add a5,a5,a2
;;   lui a0,1
;;   add a5,a5,a0
;;   sub a1,zero,a4
;;   not a4,a1
;;   and a5,a5,a4
;;   sw a3,0(a5)
;;   j label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   lui a1,262144
;;   addi a3,a1,-1025
;;   slli a5,a3,2
;;   sltu a3,a5,a2
;;   ld a4,80(a0)
;;   add a4,a4,a2
;;   lui a5,1
;;   add a4,a4,a5
;;   sub a1,zero,a3
;;   not a3,a1
;;   and a5,a4,a3
;;   lw a0,0(a5)
;;   j label1
;; block1:
;;   ret
