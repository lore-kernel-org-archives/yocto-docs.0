Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.7304.1617965635082933936
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 03:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:34944 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lUolt-00BLPQ-47
	for docs@lists.yoctoproject.org; Fri, 09 Apr 2021 06:53:54 -0400
Date: Fri, 9 Apr 2021 06:53:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what is the purpose of conf/distro/ dir with no distro definitions?
Message-ID: <4aedf060-309f-3e6e-c894-45b7481d56f2@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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
Content-Type: multipart/mixed; boundary="8323328-2144299496-1617965633=:10854"

--8323328-2144299496-1617965633=:10854
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8BIT


  in current ref manual:

http://docs.yoctoproject.org/ref-manual/structure.html#meta-conf-distro

the definition of meta/conf/distro opens with:

  "The contents of this directory controls any distribution-specific
  configurations..."

fair enough, but what is the interpretation of a layer distro/
directory that does not define any actual distros? example:
meta-virtualization layer hierarchy contains:

  .
  ÜÄÄ distro
  Åöö ÑÄÄ include
  Åöö     ÜÄÄ k8s-versions.inc
  Åöö     ÜÄÄ meta-virt-default-versions.inc
  Åöö     ÜÄÄ meta-virt-xen.inc
  Åöö     ÑÄÄ virt_security_flags.inc
  ÑÄÄ layer.conf

so, sure, those .inc files can be useful, but that layer does not
contain any actual meta-virt-related <distro>.conf files, so are those
files really "distribution-specific configurations"?

  is there a better way to word that?

rday

--8323328-2144299496-1617965633=:10854--
