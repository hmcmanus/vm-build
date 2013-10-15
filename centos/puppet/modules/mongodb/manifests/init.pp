class mongodb( $version = '2.2.3' ) {
    
    yumrepo{ 'mongorepo':
        name           =>        'mongodb',
        enabled        =>        1,
        gpgcheck       =>        0,
        baseurl        =>        'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/',
    }

    package{ 'mongo-10gen':
        ensure          =>       $version,
        require         =>       Yumrepo['mongodb'],
    }

    package{ 'mongo-10gen-server':
        ensure          =>       $version,
        require         =>       Yumrepo['mongodb'],
    }
}
