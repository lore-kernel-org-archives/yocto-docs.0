Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7EFCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:17:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127159.1781522265010974656
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 04:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=G5QQP5nO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lhckmX4ax0KzrUmIL05XMAS1HDSRtzF10r5e1GaAK+c=; b=G5QQP5nOKTpyhd4QG81Ul0hxiI
	1+XJ5ixnsvIOZIM1DP3Mpt6Zj4OQGl1SFg0otivCWFuNE4Rstzvwz7Nb/TfzgLGsA+DXHNfbMDaFA
	fpscUp+lWBM5ROZOb3D6y1l4umgNNy1rPkz/emMB1cwQuWUObV/dIRiwjRprMYdm8acvLZM3MKUbY
	0F3RHaOKb9l1H4OnH781POE3R4BPZOkLXIqtpx0V+oPmFTlyO2le1C4xNsmrlhjprXO1iUPnGtRsy
	vXvXenXnA5j6YaEOJ9lgaer5Di/YlHjKz6ptA0hUIWcb/Oot+4kCS7sCGEDoplf9V8o8yNQJRUoc3
	p4GvFuKQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:57902 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZ5K1-00000004AEu-0wef
	for docs@lists.yoctoproject.org;
	Mon, 15 Jun 2026 07:17:43 -0400
Date: Mon, 15 Jun 2026 07:17:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what to update WRT "YP Kernel Development and Maintenance"
 section?
Message-ID: <39675131-182d-79a2-6427-b9c2e5e31982@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 11:17:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9724


here:

https://docs.yoctoproject.org/kernel-dev/concepts-appx.html#yocto-project-kernel-development-and-maintenance

you can read the claim that those very old kernel releases can be
found here under the section "Yocto Linux Kernel":

https://git.yoctoproject.org/

  obviously, that's out of date since those kernels are now under the
label "Yocto Linux Kernel Archive" (which does not appear to be
keeping current), with different content under "Yocto Linux Kernel."

  any thoughts on how this *should* read? and whether there's even any
value in git.yoctoproject.org archiving kernel releases that stop at
4.12?

rday

