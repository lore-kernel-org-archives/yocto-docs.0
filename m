Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F148EC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:00:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.83292.1752512394249235651
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 09:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RtVUNNdE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zsbfMMorGJ++5XVQt+IS5Neg+25ZM4KGBQI9OmQfgeM=; b=RtVUNNdE5dVh3/zig9Icywot0Y
	VKvD6xVAbqMPQLGDce0Y87rKzjelQ/sa/r3x98cxJQMdccl3AwaQN+igcXPxxld7tv4z6umLWQeKo
	K8Qet6kHQoWpOmDJtp5q7CQ9GaCbPgZi6KNInvZzgCpXBICQujnfWZnQYIM4ilB4sNuYcnmGxAEso
	lk/riO+37diFWs3vGiRM1z/ELXTjXcc8elbfy72ffOU0Ls7/76xslN+s/KON95C/KBMUGT5cIyWax
	h2GMUlNFhxxVpPl8Uy3IxpsAfN7KLG+IMcfani30DnmrheQSbx1Ff09DDC6th3IkzzQbMyuID37qf
	+EWipOeA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49716 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ubMWt-0000000CpfZ-0nNI
	for docs@lists.yoctoproject.org;
	Mon, 14 Jul 2025 12:59:51 -0400
Date: Mon, 14 Jul 2025 12:59:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: pedantry: what is the proper descriptor for :append, :prepend and
 :remove
Message-ID: <3115a61f-25c2-5be5-d221-3b28314f07c1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 14 Jul 2025 17:00:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7327


  I ask as I have seen documentation that describes those three things
as "overrides", apparently because they appear in the same place as
variable overrides, but that seems wildly misleading. It seems that
they should more properly be classified as "operators", and if that
was the case, I think some documentation could be made clearer by
distinguishing between "operators" and "overrides" when you see stuff
like:

  VAR:append:arm

that sort of thing. So what's the proper descriptor for those three
things?

rday

