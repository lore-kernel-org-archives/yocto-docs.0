Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D68CC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 17:45:59 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.2603.1632764756985587784
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 10:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:60390 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mUuhP-00082v-BA
	for docs@lists.yoctoproject.org; Mon, 27 Sep 2021 13:45:55 -0400
Date: Mon, 27 Sep 2021 13:45:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what's with the "\" in SSTATE_MIRRORS example in overview manual?
Message-ID: <f7799882-d01c-de7b-be8a-45c2cf6e1eae@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 27 Sep 2021 17:45:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1891


  from here:

http://docs.yoctoproject.org/overview-manual/concepts.html#shared-state-cache

toward the end of that section, we see the example:

  SSTATE_MIRRORS ?= "\
    file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
    file://.\* file:///some/local/dir/sstate/PATH"
            ^

note those early backslashes in each line, which appear to totally
break proper operation. it was only after i deleted that backslash
that things worked.

  is this a recent change? did things used to work differently? those
backslashes definitely seem incorrect. thoughts?

rday

