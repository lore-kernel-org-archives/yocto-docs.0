Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BE0C433FE
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 13:48:56 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.6292.1639748935379166234
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 05:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:60636 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1myDbT-000604-Dn
	for docs@lists.yoctoproject.org; Fri, 17 Dec 2021 08:48:54 -0500
Date: Fri, 17 Dec 2021 08:48:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: pkg_postinst() versus pkg_postinst_ontarget() contexts?
Message-ID: <b67d3d1-2699-e440-44d1-e7968b9f08a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 13:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2303


  next Q in this thread (rather than posting one all-encompassing
post, i'd rather a small set of more focused posts):

  so there is the basic distinction between a package's:

  pkg_postinst()
  pkg_postinst_ontarget()

but let's be precise.

  is that first variation ever run *only* during image install
context? that is, there's no weird magic that lets you defer it to
on-target time? more precisely, if that package is not installed
initially in the image, but is subsequently installed using package
management on the target, is it true that it will not be run at all?

  conversely, is it true that pkg_postinst_ontarget() will be run only
in on-target install context?

  what this means is that a package might conceivably need to define
both, whose only difference is that the first will make reference to
${D} for its work, and the second will not.

  or am i misreading this?

rday

