Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B43C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 13:01:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13417.1783861304931594817
 for <docs@lists.yoctoproject.org>;
 Sun, 12 Jul 2026 06:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dqu1LabF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uO9tRibjbwrtzo1GkWvQ8wM4MV5xHL3KrZ0PjnmkDG8=; b=dqu1LabFY6WRaj2Tw3Us6e36Cv
	WvOtIRU3Lu3WA7DtTs/XqM9ZpAsomTFLNnW5tW4YjOBB/PVP4IpVqG1NIBjnpdMkQW0oRgBVdT82w
	h5JmJm6dk3RdJjee2Jc4V4yd0WNUil6Cm5E3sqWoha0PO2tQmjm4GlSfxvRYwfybtwNRAVxGCZAsV
	tPfFPDz6EHZyBZoWhSwIcJcx76ohmud7aF26C6ITlc8kbC7pac/5ZXE6bAzcjesCc8LHzlJUpZBVu
	O5CDYef1stZ7vP53Uy66C+z7alq8TAJqBkToncF64Pak9xhD8wZCjP54zR5LFzkhRJBHRC6jJxV+A
	uJ+MeklQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:35142 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1witoQ-0000000DhiT-0m6G
	for docs@lists.yoctoproject.org;
	Sun, 12 Jul 2026 09:01:42 -0400
Date: Sun, 12 Jul 2026 09:01:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is yocto-docs considered a part of "Poky"?
Message-ID: <79d2d2d5-f9d9-a8ba-a43a-8370230a385f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 12 Jul 2026 13:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10068


  i've seen that claim somewhere, and it didn't sound right.

rday

