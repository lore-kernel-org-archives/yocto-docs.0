Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB41BC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 09:57:56 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.8848.1639648676092593958
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 01:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:45072 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mxnWN-0006Ym-4p
	for docs@lists.yoctoproject.org; Thu, 16 Dec 2021 04:57:54 -0500
Date: Thu, 16 Dec 2021 04:57:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: no mention in var glossary of SSTATE_SKIP_CREATION
Message-ID: <5e9071cc-fdb1-ec62-efa8-46ac447895a8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 09:57:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2283


  asked this morning about how to disable sstate-cache creation for an
individual recipe -- i had no clue so a quick google took me here:

https://stackoverflow.com/questions/69674939/how-to-disable-sstate-cache-per-recipe-in-yocto

whereupon i verified that there is no mention of this potentially
useful variable in the glossary.

  i'm not convinced that this is what the questioner really needs, but
i'm suggesting that solution until such time as i can figure out what
they're *really* trying to do.

rday

