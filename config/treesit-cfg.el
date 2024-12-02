;;; dealing with treesitter...

(use-package treesit
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.toml\\'" . toml-ts-mode))
  :bind (())
  :init
  (setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript"
                 "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript"
          "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript"
                 "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")))
  (dolist (grammar treesit-language-source-alist)
    (unless (treesit-language-available-p (car grammar))
      (treesit-install-language-grammar (car grammar))))
   (setq major-mode-remap-alist
         '((yaml-mode . yaml-ts-mode)
           (bash-mode . bash-ts-mode)
           (js2-mode . js-ts-mode)
           (js-json-mode . json-ts-mode)
           (css-mode . css-ts-mode)
           (python-mode . python-ts-mode)
           (c-mode . c-ts-mode)
           (c++-mode . c++-ts-mode))))
