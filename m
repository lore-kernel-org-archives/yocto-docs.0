Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82138C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 19:39:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2467.1787513973792043963
 for <docs@lists.yoctoproject.org>;
 Sun, 23 Aug 2026 12:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GnDgmzL4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=elhNl2P8bYw4mwv2HApxS/Nk3KlQggdvNwjfvLbhYmU=; b=GnDgmzL4pgIicdyhxCJEu0rN7q
	shmjWj88wKydgirw9IuCrT8XzAWToL9mfMtSyvIhWlh4z6B6QlKfoLDEFxDsgy8D6N6biYcrDvVFi
	2i3j85KFf/+hjyEwtiSnkx+S5Xe/eiEaqDzS3c+BTf2MlHZmUQocXdBR9ykOqJVUZHXA2n+QoHuDF
	y5flR9E39cH9PouTuqyXHwLzmLKabQ1YSM1OErME+JV1RP7OQjjG0hz1VCZ2Mu/XpynQadKTiqC26
	vV5Y77pSFy1Hq5v+hOxqbleBjYVG8wKHQcRR3scMwmuAv/P6GjOGDDib3RiEuoZNl+m7MXEjbjRaD
	jmQ3Fiag==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37660 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wyE2V-00000008w8d-2hwe
	for docs@lists.yoctoproject.org;
	Sun, 23 Aug 2026 15:39:32 -0400
Date: Sun, 23 Aug 2026 15:37:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what implements the "copy" button in YP docs code blocks?
Message-ID: <12410595-07e2-2543-2a63-2f02666c7383@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 23 Aug 2026 19:39:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10321


  perusing another sphinx code base and want to add the YP-common
feature of, in code blocks. the ability to copy the command (while
leaving behind the '$' prompt).

  is that all provided by a simple "code-block", or is there some
special extra config to get that?

rday

