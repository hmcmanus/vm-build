class tools {
    yumrepo{ 'epel':
        enabled         =>      1,
        failovermethod  =>      'priority',
        gpgcheck        =>      0,
        mirrorlist      =>      'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
        name            =>      'epel',
    }
    
    yumrepo{ 'rpmforge':
        baseurl         =>      'http://apt.sw.be/redhat/el6/en/$basearch/rpmforge',
        enabled         =>      1,
        failovermethod  =>      'priority',
        gpgcheck        =>      0,
        mirrorlist      =>      'http://mirrorlist.repoforge.org/el6/mirrors-rpmforge',
        name            =>      'rpmforge',
    }
    
    package{ 'terminator':
        ensure          =>      installed,
        require         =>      Yumrepo['epel'],
    }

    package{ 'subversion':
        ensure          =>      installed,
        require         =>      Yumrepo['rpmforge'],
    }
    
    package{ 'git':
        ensure          =>      installed,
        require         =>      Yumrepo['rpmforge'],
    }
}
