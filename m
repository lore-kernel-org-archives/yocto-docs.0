Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B98CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 14:59:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.11697.1761145155111166537
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 07:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Hv30Muvr;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fwb4LZp7SOoJcRhYjSLcfRDq4tR3t6VI+HGEVoloNlI=; b=Hv30MuvrMQ/aZ78Y18ZPmU2GD9
	G8Zl5+bCS6LQfBqqJsaq+kCgvWngx4Bn5CuzA6z/7apw+VZI3NifWxHeZKaAtCiJA6GKAKL4b/zHJ
	CEeZCUkDqlYuoev4o6cCllo7/kRu77rRHZNu87pgpprVKqaD4VtFUo8FeEF7A+qkjy3ppzaNAMi9e
	9T+nCfYICfa+/UG7IVfn4vVO6RX1HyImUHYiiqlhO4YHqPy8D1makD6S9HPOFd76nXhdhNxlXo4n7
	elLDihm+cQGA9gCor6o/foOhMXKb8S4SDUGMpKWTvYd9xx7RMNd4BZXljCc1AkESpIJr889PVfYv4
	wW6PlVhA==;
Received: from [147.129.179.166] (port=49700 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBaIw-00000009A6R-3g36
	for docs@lists.yoctoproject.org;
	Wed, 22 Oct 2025 10:59:13 -0400
Date: Wed, 22 Oct 2025 11:01:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: the bullet list indentation in overview manual looks weird
Message-ID: <a4a0c9d4-bccb-00e2-4232-2a1f1066a839@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 14:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7770


here:

https://docs.yoctoproject.org/overview-manual/concepts.html#source-fetching

the tail end of section 4.3.5.1 has a strange-looking rendering of the
bullet list, with some unnecessary(?) indentation. can someone clarify
that that rendering and indentation was what was intended?

rday

