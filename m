Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED38C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 19:34:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.28666.1750188855005082769
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 12:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=nWE++s+7;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2tQsPN+bztwiigZHhuHFpjneNCGgGZ4O62zUSe8bTEw=; b=nWE++s+7B79pNBkEUuTAcX8tCb
	69pQZ4LljYN07GpWN9zpbWrPC+RuJEuIrCUuy5IIbNw4wBt8yUxaJEM8oLf2Mw5qts+nTwfyryLap
	Yz4+LAKFtDQto0YOPCiJ4A5kpGQdlGFs6el8ylEgkjW7jAgO4zfKv8hkYbwQhMDKSfIxfr3HqCi+C
	pJcg2btC/M0UUjNPcepwcelIw8g+jbcsUpwvxyS9aZPZEuS0IY3RLkazrrIrJ9JZrWtbQwRVv9q2G
	sGyJeq2nx39TBzjffuAy8QJCP6IaR8731K3wIebft9nisuRYNjHOntTjv8cr5J9OaWT+hnnM8lVID
	PqOdf7eg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:48588 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRc4S-000000011V5-3gfq
	for docs@lists.yoctoproject.org;
	Tue, 17 Jun 2025 15:34:13 -0400
Date: Tue, 17 Jun 2025 15:34:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: do layer names need to start with "meta-" or not?
Message-ID: <c0a49c8a-94e8-2c97-4c4e-1df6863bae87@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 19:34:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7087


  this is confusing ... see here:

https://docs.yoctoproject.org/bsp-guide/bsp.html#bsp-layers

"Because the BSP layer naming convention is well-established, it is
advisable to follow it when creating layers. Technically speaking, a
BSP layer name does not need to start with meta-. However, various
scripts and tools in the Yocto Project development environment assume
this convention."

  so is it a "convention" and "advisable", or is it a requirement?

rday

