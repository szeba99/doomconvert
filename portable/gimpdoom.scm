(define new-file-path (string-append (substring file-path 0 (- (string-length file-path) 3)) "png"))
(define img (car (gimp-file-load RUN-NONINTERACTIVE file-path file-path)))
(gimp-image-convert-indexed img dithering CONVERT-PALETTE-CUSTOM 16 FALSE FALSE "Doom")
(file-png-save RUN-NONINTERACTIVE img (car (gimp-image-get-active-layer img)) new-file-path new-file-path 0 0 0 0 0 0 0)
(gimp-quit 0)

