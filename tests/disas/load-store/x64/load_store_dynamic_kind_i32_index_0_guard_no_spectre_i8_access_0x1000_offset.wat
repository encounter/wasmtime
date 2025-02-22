;;! target = "x86_64"
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
;;   pushq   %rbp
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   movq    %rsp, %rbp
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   movq    88(%rdi), %r9
;;   movl    %edx, %r11d
;;   subq    %r9, $4097, %r9
;;   cmpq    %r9, %r11
;;   jnbe    label3; j label1
;; block1:
;;   movq    80(%rdi), %rdi
;;   movb    %cl, 4096(%rdi,%r11,1)
;;   jmp     label2
;; block2:
;;   movq    %rbp, %rsp
;;   popq    %rbp
;;   ret
;; block3:
;;   ud2 heap_oob
;;
;; function u0:1:
;;   pushq   %rbp
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   movq    %rsp, %rbp
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   movq    88(%rdi), %r9
;;   movl    %edx, %r11d
;;   subq    %r9, $4097, %r9
;;   cmpq    %r9, %r11
;;   jnbe    label3; j label1
;; block1:
;;   movq    80(%rdi), %rdi
;;   movzbq  4096(%rdi,%r11,1), %rax
;;   jmp     label2
;; block2:
;;   movq    %rbp, %rsp
;;   popq    %rbp
;;   ret
;; block3:
;;   ud2 heap_oob
