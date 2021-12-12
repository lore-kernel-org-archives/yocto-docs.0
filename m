Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C446EC433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 15:01:05 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.35070.1639321265063154346
 for <docs@lists.yoctoproject.org>;
 Sun, 12 Dec 2021 07:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:45832 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mwQLX-0000sS-IG
	for docs@lists.yoctoproject.org; Sun, 12 Dec 2021 10:01:04 -0500
Date: Sun, 12 Dec 2021 10:01:01 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] undocumented SYSTEMD_SERVICE_ESCAPED,
 SYSTEMD_DEFAULT_TARGET
 variables
In-Reply-To: <16C008ECF757D9E9.19089@lists.yoctoproject.org>
Message-ID: <8bc740c1-9ed4-bcac-b933-fd2be35bb650@crashcourse.ca>
References: <16C008ECF757D9E9.19089@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Sun, 12 Dec 2021 15:01:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2240

On Sun, 12 Dec 2021, Robert P. J. Day wrote:

>
>   just noticed that the two variables above are not in the current
> variables glossary.
>
>   the latter is used occasionally so should be documented, but the
> former does not seem to occur *anywhere* other than in
> systemd.bbclass; is it actually a viable variable? i don't see s
> single example of its usage in the numerous layers i have checked out.

  oh, wait, it looks like SYSTEMD_SERVICE_ESCAPED is a purely internal
variable in systemd.bbclass. it's just confusing if you're reading
source and you come across a fully-capitalized variable that leads you
to believe it's user-manipulable.

rday

