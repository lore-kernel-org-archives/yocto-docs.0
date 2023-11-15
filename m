Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F28C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:40:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.10332.1700044855186335909
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 02:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KLphXu67;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SM4UZ2N3XDbgKkT0yU7OrsM7p0YFElg1uGQFy2nFXAw=; b=KLphXu67H/Y6WGnQnDwBE0yMEO
	HIHBooJd6s7XMF49yJX7jwzRFGXjC/Wfh/77squPmZ5Xtct8MgmeWgvQgH9qVZS2Ydt+042nDTPbM
	XikUrmmoE9psXDFxlDiOqR6SeaPdmxfUU/ej/MK6o5Cr4WQb82XTD0q3Rp9oZAbmY7w8v6tiJRi9I
	6DOAOVdnAs6ioEqutHJBKxgDyFbOS/FqO9wCRfTX+RFEq1APEs97RyKV0j5FPQj91/7jjtm0ZNjU/
	B/8VQkh3uMnyPuqWjrYn9OoXAAoyP69rEKVZ3aeXm0iW+76H8epC6OWouC0FIVTmfGrsQaDzuGXP8
	759WVgRQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:33918 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1r3DKE-009Zq7-1Z
	for docs@lists.yoctoproject.org;
	Wed, 15 Nov 2023 05:40:53 -0500
Date: Wed, 15 Nov 2023 05:40:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: where is "But that file is already provided" diagnostic explained?
Message-ID: <46cf229c-4a9c-833d-758-357b7d5cafc@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 15 Nov 2023 10:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4632


  Asked on OE list, but a colleague has two recipes that are trying to
install the same files and, while I suggested cleaning up the recipes,
just to get things running, I recall(?) that there is an INSANE_SKIP
setting that will override this, but I don't see it documented
anywhere.

  The error message contains the phrase, "But that file is already
provided by package", yet I can't find a reference to that in the
"insane" class doc page
https://docs.yoctoproject.org/ref-manual/classes.html#ref-classes-insane

  Thoughts?

rday

