Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAA4C54FB3
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 15:00:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.10555.1748185215247911046
 for <docs@lists.yoctoproject.org>;
 Sun, 25 May 2025 08:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=iC+WerRs;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ffFEbMDUM2eUUfHqj/y0AJd+u7TJImSgeauYBeMGmn4=; b=iC+WerRsXrtnAI5ShETYfaOyaB
	UkYwOtsT1EhdppfYGh/B9ke65HDQAl0VZHp+eOiJYT61WZHyxgwQsJrRXDpdko3TGXghzQPfaB9IY
	k0XSI8i4SNncbkAVe9sR3KgeLtNmHcyHqnss6msFrK3yWrzzffsvfY6A5LrCfitX4oZENWoVeui9o
	xDvagHp4zn20qmCIih7m83Dtjeo8Qffse0S/skja5K1t99xa5aNtP2++DmutPtts4BsiKmNnK1dav
	eHEvZ59PjR5+PeBipEU97EePz/IvGde5HLgVOTsgqcgcgdexZId68czXluF0RCJwr/08jv6chJjkf
	Wg2z/ZZw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56832 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJCpY-00000006tcv-1sGi
	for docs@lists.yoctoproject.org;
	Sun, 25 May 2025 11:00:12 -0400
Date: Sun, 25 May 2025 10:59:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Pedantic comments on "Yocto Project Quick Build"
Message-ID: <64b9bec1-0aa4-9e4b-06ed-445eda4d60a7@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 25 May 2025 15:00:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6902


I was going to submit a patch but I wasn't sure about one or two of
the changes so I'll just publish my comments and someone can decide
what is worth tweaking and how.

All of this is in the secton:

https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#compatible-linux-distribution

1) Bullet list has both a first- and second-level bullet point on the
same line, because the source file defines an empty top-level list
item (first item in the sublist)

2) Is Git 1.8.3.1 still supported? Man, that's ancient.

3) "If your build host does not meet any of these three listed version
requirements ..."  There's five version requirements there, not three.

  That's it for now.

rday


