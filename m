Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56FDC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:10:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45921.1789150246956150877
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 11:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=VvEga538;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fGkq37zoMNdnv+ArE3Nhd2CCdIdKT6DoaH4K3DjG2Ms=; b=VvEga538Y+EYOlzWiNyIDspGk2
	8yhEZNAMGSLsPiXuncUbhFz+wm9AenugTcbNDW9+gV01QtQuuHyiFXNU5Eha3tBvnHGB32/+inCvV
	THbA7snaBqYUNCtiGYOuAykbD8JPnhb4UJqHq00zc6rV3Xf1wgVnKMmNmwu3cMYyKktl8WOu+vpUE
	AoKbAJF7lMXNBNTrnSAyGDH8ZATfbLuIS9qUTiqWEId+lmX42qMS+A5tKKF0tYBCK7HeHXE1poRDp
	37Yd6XTtOu6BqZPRNSLU6tWIHTxC/kPickVJgJdv92F7UcZywUsKM1UOg5LtyDalE36/wqEwEyuYK
	lJadczRw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:60476 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x55i0-00000003pbr-3n9S
	for docs@lists.yoctoproject.org;
	Fri, 11 Sep 2026 14:10:45 -0400
Date: Fri, 11 Sep 2026 14:08:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: how should one update "dual, six-core Xeons"?
Message-ID: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 18:10:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10479


here:

https://docs.yoctoproject.org/dev/dev-manual/start.html

it's amusing to read, "These systems, in general, should be high
performance (e.g. dual, six-core Xeons with 24 Gbytes of RAM and
plenty of disk space)."

would someone like to suggest a more modern configuration, and i'll
submit a patch.

rday

