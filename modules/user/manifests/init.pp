class user {
    user { 'hmcmanus':
        home          =>    '/home/hmcmanus',
        ensure        =>    present,
        managehome    =>    true,
        password      =>    '',
    }
}
