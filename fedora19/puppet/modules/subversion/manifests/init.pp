class subversion {
    
    package{ 'subversion':
        ensure        =>    installed,
    }
    
    package{ 'mod_dav_svn':
        ensure        =>    installed,
    }

    file { 'subversion.conf':
        ensure        =>    present,
        path          =>    '/etc/httpd/conf.d/subverion.conf',
        source        =>    'puppet:///modules/subversion/subversion.conf',
        owner         =>    root,
        group         =>    root,
        require       =>    Package['mod_dav_svn'],
    }
    
    file { 'svn-auth':
        ensure        =>    present,
        path          =>    '/etc/svn-auth-users',
        source        =>    'puppet:///modules/subversion/svn-auth-users',
        owner         =>    root,
        group         =>    root,
        require       =>    Package[mod_dav_svn],
    }

    file {'svn-repo':
        ensure        =>    directory,
        path          =>    '/var/www/svn',
        owner         =>    apache,
        group         =>    apache,
        require       =>    Package[mod_dav_svn],
    }

    exec {'init-repo':
        path          =>    ['/usr/bin/',],
        command       =>    'svnadmin create testrepo',
        cwd           =>    '/var/www/svn/',
        require       =>    File['svn-repo'],
        unless        =>    '/usr/bin/ls /var/www/svn/testrepo > /dev/null',
    }

    exec {'chown-repo':
        path          =>    ['/usr/bin'],
        command       =>    'chown -R apache:apache testrepo',
        cwd           =>    '/var/www/svn/',
        require       =>    Exec['init-repo'],
    }

    service {'apache':
        name          =>    'httpd',
        ensure        =>    running,
        enable        =>    true,
        subscribe     =>    File['subversion.conf'],
    }
}
