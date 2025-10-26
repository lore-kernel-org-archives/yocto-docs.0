Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D9ECCF9E5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 11:24:55 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.8446.1761477890251821080
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Oct 2025 04:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KtE8Q/Q4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DZwzc+nFvKdfIaUiP7NduVqILVhqvzGWEyWEHtJQ7lo=; b=KtE8Q/Q4ElLEdMiuaXiikFSfQh
	HJBP9DeQkkFdDAvFjAEHqJIRNA9kmUsHIlK4zbX7oF94xoXUXQmeisaYIfoSf0TmCf1P6tQvYk1KR
	z3tHst26ACV9nVEtcdfki+2MQwurUnplDn8L2qlOT59JDSZhXQrc2/QT81PNoI1WIOFW1QBBAFzU/
	WC/2Tn68zEVgAt+nK0dpuJBhHfzvcivC/4BM/IXal2R+xGIbg30hNJM42niFLXYatwfmsNiIi1sxx
	zPpmrNXqZfWEjW9YUaFg1miMYG0b3eXQ5nOsk5eqrgqOOE3hoDJjhROzueoE4fJsGwGfUpP/Z4sDM
	JuhCygog==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:41188 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCyrf-00000005XBC-27tL
	for docs@lists.yoctoproject.org;
	Sun, 26 Oct 2025 07:24:48 -0400
Date: Sun, 26 Oct 2025 07:27:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should docs explain/warn about "FILESEXTRAPATHS:append:"
 construct?
Message-ID: <03f41e59-72f7-4055-a196-6731bc95d868@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 26 Oct 2025 11:24:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7842


  for no good reason, i was perusing the use of FILESEXTRAPATHS to
perhaps write up a note for some colleagues, and i ran across a small
number of examples of where the "append" operator was used -- here's
an example:

https://github.com/Freescale/meta-freescale/blob/master/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc#L73

  first, i've always been skeptical of the value of appending in that
situation since it seems to fly in the face of what that variable is
used for; that is, to override some normal behaviour, so it just seems
odd to append, giving it the lowest priority.

  more to the point, it's clear that in that example above, there's a
bug:

  FILESEXTRAPATHS:append := "${THISDIR}/imx-gpu-viv:"

obviously, due to appending, the colon in the string needs to be on
the front, not the end, which suggests that people who are appending
don't always actually understand what they're doing, making the idea
of calling this out even more important.

  (i posted this to the meta-freescale list, someone there can deal
with it, since i don't want to guess what the author was trying to
do.)

  is there a legitimately compelling to use the append operator in
that situation? it just seems to be begging for misunderstanding.

rday

