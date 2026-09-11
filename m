Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD54AC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:35:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46480.1789151728449496731
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 11:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=XJjMHHxq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LzyqPF2rThQDwe8IrF9j3dFXtlbEvJvYtgD3Ipt2vFg=; b=XJjMHHxqosL0vDAVywuQacJIQI
	yOuiQEREukVlKmiCAFyQRiD0WMxQU6VcGgzAbC+Y4kMj6uRj2P9bXSgE5HcMVXMMjKaY8UC8jCBsP
	VHV3C1bZYqZFaAeM6KNJHJQP5v+ixcQnKXEuh9HtWeuceL6uP5TSVyUunh27ao3kTD7cJ+gwp95UP
	Uy/Oyktvs886iwcH41upWvC79Y7qpQjBsWZjaFKvMikrx3yvT4lHhtkyPjR71Y5+SzPPXMNmL3PgI
	PEZMtGb2vKH1kDIc1jkO/tA8BMFgZkKiT+pPTc3YmqlKFGRMZmov+Ta7QOD0Y0qEYY6fxg6qtHGP6
	QZ/9aVlA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:44830 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x565u-00000003sHd-0a6F
	for docs@lists.yoctoproject.org;
	Fri, 11 Sep 2026 14:35:26 -0400
Date: Fri, 11 Sep 2026 14:33:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] system-requirements.txt: use proper "openSUSE"
Message-ID: <8f52d959-4598-33d4-1b26-3099e7a35ea0@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 18:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10481


openSUSE is adamant that the proper capitalization is "openSUSE".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index c9c277e51..81f450e13 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -70,8 +70,8 @@ supported on the following distributions:
 -  Debian 12
 -  Debian 13
 -  Fedora 43
--  OpenSUSE Leap 15.6
--  OpenSUSE Leap 16.0
+-  openSUSE Leap 15.6
+-  openSUSE Leap 16.0
 -  Rocky Linux 8
 -  Rocky Linux 9
 -  Ubuntu 22.04 (LTS)

