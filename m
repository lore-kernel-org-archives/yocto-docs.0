Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03863C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 10:28:32 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.9737.1652264908360494061
 for <docs@lists.yoctoproject.org>;
 Wed, 11 May 2022 03:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38788 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1noja0-0005TN-2u
	for docs@lists.yoctoproject.org;
	Wed, 11 May 2022 06:28:27 -0400
Date: Wed, 11 May 2022 06:28:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is there an actual "Getting Started" guide?
Message-ID: <e9ed828b-e775-66e9-5d28-b1e7499adc6e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 11 May 2022 10:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2928


  was building a fresh ubuntu 22.04 build machine for OE/YP, starting
with minimal install to see how much more i would have to add, and
got (via sanity.bbclass) a missing module message based on:

status.addresult('Your Python 3 is not a full install. Please install
the module %s (see the Getting Started guide for further
information).\n' % e.name)

  note the reference to the "Getting Started guide", which does not
seem to exist (anymore?). where *would* one go to resolve an error of
the form "missing distutils.sysconfig" absent a Getting Started guide?

rday

p.s. i know how to resolve the above, the issue is the reference to
the guide in the error message.

