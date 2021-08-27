Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.6042.1630058012918468277
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Aug 2021 02:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:48150 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mJYYE-0001RE-Hk
	for docs@lists.yoctoproject.org; Fri, 27 Aug 2021 05:53:31 -0400
Date: Fri, 27 Aug 2021 05:53:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: couple observations about SYSTEMD_SERVICE explanations
Message-ID: <97544745-4e69-1fd3-cf22-8e55abe649de@crashcourse.ca>
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
Content-Type: text/plain; charset=US-ASCII


  just noticed a couple things. first, the glossary bit here:

http://docs.yoctoproject.org/ref-manual/variables.html#term-SYSTEMD_SERVICE

implies that that variable contains only *one* entry:

"When inheriting the systemd class, this variable specifies the
                                                            ^^^
systemd service name for a package."

  that's obviously not true, as it might contain a number of values:

meta/recipes-extended/cups/cups.inc:
  SYSTEMD_SERVICE:${PN} = "cups.socket cups.path cups.service cups-lpd.socket"

also, i just noticed the existence of the apparently undocumented
variable SYSTEMD_SERVICE_ESCAPED:

$ grep -r SYSTEMD_SERVICE_ESCAPED *
systemd.bbclass:		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
systemd.bbclass:		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
systemd.bbclass:			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
systemd.bbclass:		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
systemd.bbclass:		systemctl disable ${SYSTEMD_SERVICE_ESCAPED}
systemd.bbclass:        d.setVar('SYSTEMD_SERVICE_ESCAPED:' + pkg, paths_escaped)


rday
