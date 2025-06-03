Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79127C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 14:32:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.13142.1748961121091074650
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 07:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UnAjSK02;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XFqmbjNIKR3Sorw55UJOcAMm697y+ocdXlM79h6U4wU=; b=UnAjSK02HodTzKupK3RgjeYvaS
	DFhWE6j0Zhq/7J99cZ11GrdPHc1HsGdSjD5+AzHsTBS9IEh0/gPTRCAsAD/R33XWDIisLVOpLH3GI
	RcgeAEoCVjvUcr3X9Wq3RE4ImA+n+Xb09/Ug7Fg5yXRrWT7ELMO4zIYe16ijJCLVwJuhAHWW4xXu+
	kpVBl9NRKdfBSE7pJAmpVuv6wqtnnYDX9q7ascgSAn6LkoM7Mi+8LUvTUCEMoSJJztenoeDhcXXxr
	AD3eoLZjyN1OPryy/enQD6sHxdi3o77R+GT6dnG3T6ArBwSsjIiJQvUbMpE/PWf0I7Gi7DiQj/BOa
	8hG5oPgA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56358 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uMSgH-00000003nFQ-3JkK
	for docs@lists.yoctoproject.org;
	Tue, 03 Jun 2025 10:31:59 -0400
Date: Tue, 3 Jun 2025 10:31:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: BB manual: DEFAULT_PREFERENCE example does not exist anymore
Message-ID: <9040c30a-c091-f2be-fd62-087fb758ed47@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 14:32:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6988


Here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#preferences

the Note proclaims:

  "For example, in the OpenEmbedded codebase, there is a standard,
  versioned recipe file for BusyBox, busybox_1.22.1.bb, but there is
  also a Git-based version, busybox_git.bb, which explicitly contains
  the line

    DEFAULT_PREFERENCE = "-1"

That version of busybox is long gone and, in fact, in the current
OE-Core codebase, there is not a single usage of DEFAULT_PREFERENCE
to be seen.

The best example of that would seem to be here:

https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-httpd/nginx

which is actually nicely explained in the .bb file. So should one
update that example to use nginx? Or just remove that Note
altogether given how infrequently that variable is used?

rday


