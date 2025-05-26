Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6AFC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:24:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.25262.1748251487091696373
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 02:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OBA/D7eS;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dMG7hTJpes52/IMiOSPbD5uNw/NyXFYiZOLAulyJRdI=; b=OBA/D7eS20nwWDEls6VxBLI4D2
	NJY5UQdsqFmH1Xqv0g0fsbHvUPnegtdhmk5SOUji8zYRHSdBvkD1l4UYsdfRdJuk09d1KPNS4sOUX
	CezK+g+UIEiVbNCvX1rlN627dp6nD+gabbY5Y6hSSl7r1EaGoyyH7HwDNNrvCjF/XX28XDWAzrlXF
	fgUVjESz7rmaxqnpc78s6Vx8M48PVEZ/VPYu+xRiHJf3OHGnUL62Bo8+PcMujMLlnJ5XOqJklHiZL
	SGchr04gkmUV0tmJe2bp93axzxGjA7l8qouZ8CKe9SLvLPyS0fzzPDgE1QMV7cRqdlj8BczTKJJh9
	dBtQNHJA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:48564 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJU4a-00000009agy-1KGA
	for docs@lists.yoctoproject.org;
	Mon, 26 May 2025 05:24:45 -0400
Date: Mon, 26 May 2025 05:24:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: here's hoping i rebuilt my new dev laptop with proper patching
 format
Message-ID: <f7aeb27b-9b7a-f42c-fd44-693e03c0ba55@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 09:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6921


  let me know if i'm missing anything from proper patch formatting,
this is a wholly new ubuntu laptop freshly configured with everything.

