(load "firecracker.lisp")
(sb-ext:save-lisp-and-die "firecracker" :toplevel #'main :executable t)
