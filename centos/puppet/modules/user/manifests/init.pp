class user {
    user { 'hmcmanus':
        home          =>    '/home/hmcmanus',
        ensure        =>    present,
        managehome    =>    true,
        password      =>    '$1$xig/U3qX$Aup1SetYEqUnSfaW9fuD2.',
    }
}
