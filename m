Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D36D1681A
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 11:45:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8391.1767959154038857154
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 03:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=eMwXy25/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ADf1V6c87duJXzF2qEchEv4Vyc+ZQat6mm+po0vaCoU=; b=eMwXy25/m0qJHaICMgqdnV8jyK
	Y8LaqO7c1TCiwxLvnsswA1ebktb04gpq0etWLX5K+3rMawwIjOBe2UebLDZjj0wZpIoZRKHMB9Pb8
	TKIM7jZEbnZQvP3DTqMHp75blDCVWOz8iTUQLFDSmLfr8+ynUZZWiTLcdfc6jAe7fyH70IzAVckIB
	pfmU9KvQA/d9/urLOC91ONUY8opQhUMai5nqPcV8gow320O33jFZcgpsGbG/376dvFXR9B1ep925X
	gBBChf9vqmb5HPnmpjf5tDl6Cbkl3X76eq/NnrQyIeoKchBizE2Ea8Vl1HZ3esQLZZVX8Iv1HBO3a
	L/6Uvfqg==;
Received: from [147.129.179.166] (port=59444 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1veAw8-00000004xaC-1Vad
	for docs@lists.yoctoproject.org;
	Fri, 09 Jan 2026 06:45:53 -0500
Date: Fri, 9 Jan 2026 06:49:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why is "configuration fragments" in monospaced font?
Message-ID: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 11:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8450


  more nitpick ... here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality

last line in that opening section, why is the phrase "configuration
fragments" rendered in monospaced? is that meant to be an actual
literal directive of some kind?

rday

