Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7B8C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 12:41:15 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.25443.1639485673888219161
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 04:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:58268 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mx77I-0004sl-7K
	for docs@lists.yoctoproject.org; Tue, 14 Dec 2021 07:41:12 -0500
Date: Tue, 14 Dec 2021 07:41:09 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: IMAGE_PREPROCESS vs IMAGE_POSTPROCESS vs ROOTFS_PREPROCESS vs ...
Message-ID: <c2e362b4-ee69-9aba-8b7a-4d428744e5d9@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 12:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2255


  yesterday, colleague asked me about the differences between all of
the customization variables you can see here:

http://docs.yoctoproject.org/ref-manual/variables.html#term-IMAGE_POSTPROCESS_COMMAND
http://docs.yoctoproject.org/ref-manual/variables.html#term-ROOTFS_POSTINSTALL_COMMAND

frankly, i wasn't sure, and the similar text across all of those
explanations doesn't make them any easier to understand.

  first, it would seem useful to supply at least one example in each
case of the sort of thing that each variable is meant to facilitate.

  in addition, is there somewhere a section that perhaps goes over the
entire customization process, so that a reader can see the steps in
order that are done? maybe that's a better approach. as it is, it's
pretty tough to appreciate the distinction between all of those
variables.

rday

