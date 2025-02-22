;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0x1000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0x1000))

;; function u0:0:
;; block0:
;;   ld a4,88(a0)
;;   slli a5,a2,32
;;   srli a1,a5,32
;;   lui a5,1
;;   addi a2,a5,1
;;   sub a2,a4,a2
;;   bgtu a1,a2,taken(label3),not_taken(label1)
;; block1:
;;   ld a2,80(a0)
;;   add a1,a2,a1
;;   sb a3,4096(a1)
;;   j label2
;; block2:
;;   ret
;; block3:
;;   udf##trap_code=heap_oob
;;
;; function u0:1:
;; block0:
;;   ld a3,88(a0)
;;   slli a5,a2,32
;;   srli a1,a5,32
;;   lui a5,1
;;   addi a2,a5,1
;;   sub a2,a3,a2
;;   bgtu a1,a2,taken(label3),not_taken(label1)
;; block1:
;;   ld a2,80(a0)
;;   add a1,a2,a1
;;   lbu a0,4096(a1)
;;   j label2
;; block2:
;;   ret
;; block3:
;;   udf##trap_code=heap_oob
