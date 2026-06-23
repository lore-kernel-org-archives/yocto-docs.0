Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC7FCDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 18:29:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27941.1782239380096627295
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 11:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=f5pDAQl+;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j2O/Kw5cQdwQlb7CUWviMFAw0b3D3LJSgEAMjdiWAhQ=; b=f5pDAQl+z2MmD8oHmcgR8Ed4Ic
	aLIaPfOEr9Pua8+6dS7q+gkXf04tBUzt7HwTZvbq54leDiPbXH8puQrZn4eUGViwDXho00IqbIwbR
	N2KE9nx4QWESZFaYcBQkjWyBBUOg051UlJAVKH68sX74yaku55RN7l+hT2wYMFp1+ZaA6bwd77MaG
	rp5mkC5iIu4Q+XY1wd4azcz0VKqVzs6QED/LKfb9xXMSEdqbrwDOSglriDakZAg/JtYklgvqr7z2T
	uI6fNJ0G62KjOJ1AIHfo0WCdPdaFq5IIoe5c9ustYMOpYarm8Dd/u5iqBKMZka385wm5vrHf23pxO
	fbIaBnRQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56050 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wc5sO-0000000Dcl2-2aMD
	for docs@lists.yoctoproject.org;
	Tue, 23 Jun 2026 14:29:38 -0400
Date: Tue, 23 Jun 2026 14:29:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Zaurus? Really?
Message-ID: <023dcad6-da72-e084-4c4d-5149ebaf0e79@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 18:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9844


here:

https://docs.yoctoproject.org/dev-manual/debugging.html#other-debugging-tips

there is actually a reference to a Zaurus. how many readers are going
to recognize that? :-)

rday

