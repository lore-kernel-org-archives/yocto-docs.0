Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E54C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 14:54:11 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.23398.1633272839016582103
 for <docs@lists.yoctoproject.org>;
 Sun, 03 Oct 2021 07:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com
 ([174.114.56.109]:44192 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mX2sG-0008G8-Dt
	for docs@lists.yoctoproject.org; Sun, 03 Oct 2021 10:53:57 -0400
Date: Sun, 3 Oct 2021 10:53:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: best practices regarding using WKS_FILES to reference multiple .wks
 files?
Message-ID: <409faf0-ab12-33b5-20d0-aa60d678ef6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 03 Oct 2021 14:54:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1910


  quick observation -- variable glossary makes no reference to
WKS_FILES variable (or a few other wic-related variables as i think i
mentioned once, but that's not why we're here).

  simple practice for wic is to define a single .wks file which
defines all partitioning for the target. however, what i'm running
into in my current project is that that single .wks file defines a
couple dozen partitions, many of which are maintained by a number of
different developers.

  unsurprisingly, since all this content is in a single file, and
those developers are regularly tweaking their partition attributes,
it's a regular occurrence to have commits step on each other when
merging to master.

  is it reasonable (or even doable) to define a collection of
reasonably independent .wks files that, collectively, define the final
partitioning, and use WKS_FILES to pull them all in, thus avoiding all
those merge conflicts?

  is this approach documented anywhere? is it considered good style?

rday

