Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40098CA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 11:58:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43832.1791287932943510324
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Oct 2026 04:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=iBJuD2u6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6M9wxvM/j657LU/KjZdY0cCbfdMmtNm2Em0prtN+QAk=; b=iBJuD2u6+cErGKjHR76FupSNR1
	LuGwTdrDpzElDJGLK902v1DQni2xni4IqaMxt2bTzxxEKPmFLMyY6LhzkzCI3HHDpWUhJgY4LyuVX
	wfv7oIfhuN1iXeZncfaP6r2da370MAk1nw28GAogiBOAh8kOPI1lyzMRy7wq9Kl2RL8Hx66A4wfXM
	Ao7ZyTbrcrTEiqq14sOMFoR/LbwpQVdFyxhRoCvU7WsLCmjDzur7+BJTagXoqndDoDSJApkPXcLw6
	HQwgRq5wdVUJWJIPbkw7ez2+HdKlt8ypJ6dc41bmhhtiqBqqzOX0+wi6mXHV9kJ7GEhMkNaqMXJQ3
	fW0kwrSw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:55674 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xE3oo-0000000EWPG-069T
	for docs@lists.yoctoproject.org;
	Tue, 06 Oct 2026 07:58:50 -0400
Date: Tue, 6 Oct 2026 07:56:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can a wic ".wks" file contain variables?
Message-ID: <1de8502e-9007-9636-d0f9-ece17125b675@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 06 Oct 2026 11:58:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10657


  working through wic manual to submit some enhancements and i thought
that, unlike .wks.in files, .wks files count not contain variables
that needed expansion, but in the "example-wks" directory of the wic
repo, this .wks file contains "KERNEL_CONSOLE" in the last line:

https://git.yoctoproject.org/wic/tree/example-wks/mkefidisk.wks

  is that legal?

rday

