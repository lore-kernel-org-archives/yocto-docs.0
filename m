Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.5596.1603959215600785685
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 01:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:60148 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kY33t-00GpRe-Ux
	for docs@lists.yoctoproject.org; Thu, 29 Oct 2020 04:13:34 -0400
Date: Thu, 29 Oct 2020 04:13:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: adding more glossary links in the glossary
Message-ID: <df8f2d4e-30c5-d267-dbae-a67aaf4bcc6@crashcourse.ca>
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
Content-Type: multipart/mixed; boundary="8323328-932371477-1603959213=:5803"

--8323328-932371477-1603959213=:5803
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  finally have time to jump back into docs now that everyone else has
done all the heavy lifting ... currently perusing glossary and noticed
the following right near the top. in glossary entry for AUTOREV, there
is the sentence:

"If you use the previous statement to retrieve the latest version of
software, you need to be sure PV contains ${SRCPV}."

  that last bit, the "${SRCPV}" part, is set up as a glossary link via
the .rst content:

  `${``\ :term:`SRCPV`\ ``}``

to get both a glossary link and the appropriate rendering. if that's
the way to do it, then it seems there's more in the glossary that
should be so rendered, as in just above that in AUTO_LIBNAME_PKGS, one
reads:

  "The default value is “${PACKAGES}”, ..."

which has the underlying .rst content as, well, exactly that so there
is no glossary link.

  is it safe to assume that, over time, things like that should
eventually be linkified, as in:

  `${``\ :term:`PACKAGES`\ ``}``

is there any reason you *wouldn't* want to use a glossary link if one
exists?

rday



--8323328-932371477-1603959213=:5803--
