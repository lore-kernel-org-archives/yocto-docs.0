Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F99CD3445
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 20:11:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18616.1778357487114452296
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 13:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=il1ZJ81R;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=90/yUdMa0CJrO9xLuKFS5Ft+GML1780cPQ+8byuJIDc=; b=il1ZJ81RP/0dX6gUEksWyxyoWT
	3AJabUM2PHZMZlmRLg6QN6eAYmTDlajjq+h4Yzufm5cXxRGxEne+ZaASGuhrqE+P6yE3PxwdLgP7r
	ZA1ZCkpOBWdfHcwaX6YzBdEmmpGl5cG/71YLBjFgSvy+wf9xyDcjo1Aan8TUtzp25B56GXFiy+SZA
	qzaO4Y2IFfqh/KlALn8w7KmTho85JqS7PN2zm382+8t9rjl44MTocEygvzVRrKDHsCACQY9zZNlpN
	DU575aufqPV9+lvRYB8AsG79qZNDT0k/t++rtVcM9dJrXr6RoCEs8n5tWLhKQiDpdyRCUVHQyL+tj
	55IKIP2g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56422 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLo1E-00000000KAS-0BWf
	for docs@lists.yoctoproject.org;
	Sat, 09 May 2026 16:11:25 -0400
Date: Sat, 9 May 2026 16:14:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Should there be any writeup on using Claude for YP?
Message-ID: <c0d4ae07-a4db-b798-090c-27782b121a3d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 20:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9428


  There's more and more out there on using Claude Code to do YP builds
... is this something that should be documented? Perhaps at least with
links to vetted articles that show how it's done?

https://www.linkedin.com/pulse/how-i-automated-one-off-secure-boot-yocto-build-ai-saved-siganos-y4kcf/

rday

