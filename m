Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29EEC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 13:06:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44675.1782911191803498442
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 06:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=uEUGTssn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hwxuf3sH4O6o9AmQYm0fI+lLwZwKgyz4Fl/6ypumIX8=; b=uEUGTssnSvQ4a3781caz8FoKnm
	UICEWBdBSasdy43At2skmpCI2pT2lZL0Lu7aBNFfSVRN+jzB5f64ZqW0M8mwLS1mP2mb3U1/YGpTd
	wy2vHzqBsH9m9S4Z+7Kbnac0z8qbal519wN8PwYJv59gh4S8WcdWHtjtk9GmFfb3rxsxbCelJCL6K
	a/RdkiLIbGRb8tlJmac5dV0xM/CJuBPIrzAfza1h/8tYVfZ6QqDG+JKE872s9gT4QKJvaWir4ivAM
	2V/BMWTPN1DNNu57mPBmdOzPia12lyCJepEWBixByFlpyhmfdrdTT1UkkBXWZ86AO6JHMVnzM7hR8
	4CAY4rdw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47576 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1weue5-00000001c0Z-0sFi
	for docs@lists.yoctoproject.org;
	Wed, 01 Jul 2026 09:06:30 -0400
Date: Wed, 1 Jul 2026 09:06:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is kernel task "do_kernel_menuconfig" different from
 "do_menuconfig"?
Message-ID: <c832e729-0920-c0a7-f047-22a2f3bc9558@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Jul 2026 13:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9991


here:

https://docs.yoctoproject.org/ref-manual/tasks.html#do-kernel-menuconfig

i don't see a "kernel_menuconfig" task defined anywhere in the OE-core
layer, but i see just below that a reference to "do_menuconfig", which
does exist.

  are these meant to be the same thing? should the former task be
deleted from the list, and reference to it be adjusted to the latter?

  or what is going on here?

rday

