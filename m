Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5485FC44509
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 14:28:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11986.1783952880808465478
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jul 2026 07:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=t+sYXBjL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jelsM9VMpY7n1PYlJ86AhoW7CpKWuK6vmZ7PwxHFEDg=; b=t+sYXBjLILEFJ6DYbtE4ArYcZT
	fuZiOegf5C+dqe2JZZMljvYdNPmdhcxnH5RQocpWNlXHk91pfK7K8rnEU+2jVhqhDL3oEplBwX8jl
	vBY29PjzCv6d6PeCH/j4L+NVRJCzHOjkgw76h8wu99/1K/6w4upFY1gUVbrvVF8lggJbWXrVhqi8l
	IbGySUP6iJV5v9PMro9+igklnHNYXI+iKcxMve7GvwcuEgQBQQxwzVyZXRMeoRdRVV1a+jDUV7zTz
	tTInqN64bAERhh53B0vgk9iO+fRtzLBMUZ8iB/RqLXhNRmfnHQQB53kNE4uzf9a7zYgFW0Wohw8o3
	AkD3PymQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:49252 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wjHdV-0000000Fxts-32S2
	for docs@lists.yoctoproject.org;
	Mon, 13 Jul 2026 10:27:59 -0400
Date: Mon, 13 Jul 2026 10:27:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should "DISTRO_FEATURES_OVERRIDES" be in the variables glossary?
Message-ID: <4ed778f3-596c-11aa-d1f7-de8ee6370b52@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 13 Jul 2026 14:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10069


https://git.openembedded.org/openembedded-core/tree/meta/classes/distrooverrides.bbclass

or is that too niche? i'd never even *seen* that variable before all
this poking around i've been doing.

rday

