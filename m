Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.2161.1631902052914287839
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 11:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:59136 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mRIGr-0000K8-Nq
	for docs@lists.yoctoproject.org; Fri, 17 Sep 2021 14:07:31 -0400
Date: Fri, 17 Sep 2021 14:07:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: one more point about PACKAGE_DEBUG_SPLIT_STYLE
Message-ID: <22c808f-a3e3-f6f0-9aa-5ffef70b4da@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-412771137-1631902051=:313516"

--8323328-412771137-1631902051=:313516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


http://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_DEBUG_SPLIT_STYLE

  that section claims:

“debug-with-srcpkg”: The same behavior as “.debug” previously
described with the exception that all source files are placed in a
separate *-src pkg. This is the default behavior.

  well, it's sort of the default behaviour. the code in
package.bbclass states:

    # We default to '.debug' style
    if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory':
        # Single debug-file-directory style debug info
        debugappend = ".debug"
        ...
    else:
        # Original OE-core, a.k.a. ".debug", style debug info
        debugappend = ""
        debugstaticappend = ""

  so, according to the if construct in package.bbclass, unless you
explicitly set that variable, the default is ".debug." HOWEVER, not
once you notice what is happening in bitbake.conf:

  PACKAGE_DEBUG_SPLIT_STYLE ?= "debug-with-srcpkg"

it just seems like those two explanations are fighting with each
other.

rday

--8323328-412771137-1631902051=:313516--
