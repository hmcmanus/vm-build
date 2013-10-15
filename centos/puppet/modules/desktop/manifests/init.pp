class desktop {
    exec { 'yum install -y "Desktop" "Desktop Platform" "X Window System" "Fonts"': 
        path       =>    [ "/usr/bin" ],
        creates    =>    '/usr/share/X11',
    }
}
