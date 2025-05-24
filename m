Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C79C54F30
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 12:32:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6048.1748089938459832347
 for <docs@lists.yoctoproject.org>;
 Sat, 24 May 2025 05:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=A1gaF3wC;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h+/QEeIRVXREy3mP/+XuAUX9Gb32j8PFltELh6x7MpU=; b=A1gaF3wCeIXY6IGNKYgBv+4GN3
	xf/jFIIzU50GxjUNlAoUxqSBC5HTshW12GzVqTEYZUcVNUMx66pQodqcohoHm4g56CUf/bUKDENiz
	4R/yOn2lht98u3UMwy4QxbJWW33DKsaL/qyfk392L1RB91PqqEx3lNiX0uejbHg7XOuquzghqJSxK
	akJW151g2/1a3Z0w/GZipdhWUvn75UYcExjRw0/1MOyLUQJbWUqAUzaE8ssGM4FMogiiSrNkD7WJg
	j+3nHau10owT+09hRxev4Jj2FOW9R6yorQxqoV1miGNQNW9Q6bwZdHDcNgjlBXpxvJDcVv57CNQ+l
	CDH7B0CQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:35170 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uIo2r-00000003BBY-3u5b
	for docs@lists.yoctoproject.org;
	Sat, 24 May 2025 08:32:16 -0400
Date: Sat, 24 May 2025 08:32:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "Yocto Project Quick Build" renders an actual variable name
Message-ID: <6196c48f-cc34-4a4d-7d9f-6bb4115d4446@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 12:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6898


  Been a while since I've been here (was part of massive layoffs at
Ford recently so I have spare time to dive back into YP docs), I'm
reading https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html,
and I see the line:

  sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;

so somewhere a variable is not being processed correctly? Was this the
right place to report that?

rday

