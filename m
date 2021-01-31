Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.19324.1612106803846486507
 for <docs@lists.yoctoproject.org>;
 Sun, 31 Jan 2021 07:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-11-70-24-57-162.dsl.bell.ca ([70.24.57.162]:36134 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1l6Ecc-00058B-AH
	for docs@lists.yoctoproject.org; Sun, 31 Jan 2021 10:26:42 -0500
Date: Sun, 31 Jan 2021 10:26:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: possibly misleading SYSTEMD_SERVICE glossary entry
In-Reply-To: <2d44cba5-91d9-7010-e791-6d6ec5fdf0@crashcourse.ca>
Message-ID: <e4c26a51-4b65-369f-e4fb-4323b55382@crashcourse.ca>
References: <2d44cba5-91d9-7010-e791-6d6ec5fdf0@crashcourse.ca>
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
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 Jan 2021, Robert P. J. Day wrote:

>
>   (the first in what might be a few SYSTEMD-related observations ...)
>
>   the explanation of SYSTEMD_SERVICE here:
>
> http://docs.yoctoproject.org/ref-manual/variables.html#term-SYSTEMD_SERVICE
>
> might give readers the wrong impression that they *must* define that
> variable in a systemd-based recipe. in fact, systemd.bbclass states:
>
> # The list of packages that should have systemd packaging scripts added.  For
> # each entry, optionally have a SYSTEMD_SERVICE_[package] that lists the service
> # files in this package.  If this variable isn't set, [package].service is used.
>
> so the example given in the glossary for the connman recipe:
>
>   SYSTEMD_SERVICE_${PN} = "connman.service"
>
> would appear to be superfluous since the package name is "connman".
>
>   on the other hand, it would be useful to explain that one needs to
> define that variable if the service name differs (there are numerous
> examples to show this) and, even more, that it is possible to define
> *multiple* services in a single recipe. ironically, the connman recipe
> is a good example of that very thing (even though, again, all of the
> following appear superfluous):
>
>   SYSTEMD_SERVICE_${PN} = "connman.service"
>   SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>   SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
>
> is that too much to squeeze into a variable glossary entry?

  it might also be worth explaining that a single package
SYSTEMD_SERVICE setting could reference multiple services, such as
this from the recipes-connectivity/kea/kea_1.8.2.bb:

SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service
kea-dhcp-ddns.service"

  again, while this is useful information, it might be pushing the
bounds of what can be encapsulated in a single glossary entry.

  observations about SYSTEMD_AUTO_ENABLE coming shortly ...

rday
