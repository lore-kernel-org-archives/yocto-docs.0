Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A51C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 08:53:13 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.11400.1632819191707985145
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 01:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:57142 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mV8rO-0008Nq-2X
	for docs@lists.yoctoproject.org; Tue, 28 Sep 2021 04:53:10 -0400
Date: Tue, 28 Sep 2021 04:53:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: delete bad backslashes in SSTATE_MIRRORS
 example
Message-ID: <75d586c4-dacf-ee38-13ad-6ab39d69b175@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 08:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1894

Two inappropriate backslashes in the example for setting
SSTATE_MIRRORS are apparently the result of an error by the
transmogrification script for migrating XML to rST.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index c8b89885e..301763752 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1908,8 +1908,8 @@ Behind the scenes, the shared state code works by looking in
 shared state files. Here is an example::

    SSTATE_MIRRORS ?= "\
-       file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
-       file://.\* file:///some/local/dir/sstate/PATH"
+       file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+       file://.* file:///some/local/dir/sstate/PATH"

 .. note::


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

