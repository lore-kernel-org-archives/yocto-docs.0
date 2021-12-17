Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B0FC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 14:43:31 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.6828.1639752209835896411
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 06:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:60648 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1myESH-0007qG-VJ
	for docs@lists.yoctoproject.org; Fri, 17 Dec 2021 09:43:28 -0500
Date: Fri, 17 Dec 2021 09:43:26 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] trying (again) to clarify pkg_postinst[_ontarget]
In-Reply-To: <16C18E407EC6B90F.29929@lists.yoctoproject.org>
Message-ID: <da2d68d5-eb14-8dc-41a8-d7efd2ac2a7@crashcourse.ca>
References: <16C18E407EC6B90F.29929@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 14:43:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2306

On Fri, 17 Dec 2021, Robert P. J. Day wrote:

... snip ...

>   i ask as i see this in base-passwd_3.5.29.bb:
>
>     pkg_postinst:${PN}-update () {
>     #!/bin/sh
>     if [ -n "$D" ]; then
>             exit 0
>     fi
>     ${sbindir}/update-passwd
>     }
>
>   how does one interpret that? or is just a holdover from the old
> days? certainly that section in the docs is not going to help a reader
> understand the (still) numerous references to ${D} in some of those
> scripts.

  as another obvious example of this, here's wpa-supplicant_2.9.bb:

  pkg_postinst:${PN} () {
        # If we're offline, we don't need to do this.
        if [ "x$D" = "x" ]; then
                killall -q -HUP dbus-daemon || true
        fi

  }

is there some rationale for the above awkwardness?

rday

