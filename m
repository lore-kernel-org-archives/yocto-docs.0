Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98883CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:38:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.19057.1761223074477499739
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 05:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=p8VTA9Ja;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pTVKdK9GW1vgMAkBBi32d0uwY+TjBEWuUaqUmoQ7jvs=; b=p8VTA9JaMaLHMeihCUgjG4c+K8
	i3ZdyBxgn/gBx6+ccVWETlVHq2etpcekAgi+GmsB//zOdRULD8A+K1/EaGnmxLfY8g1TKK+ITrv3y
	WdJ+IKTYUm5gzdzuZXQlh8JkWklO2bNDqe/EIdtmdx+UbIbDWCkNMytkIktKAN+KDw4vy9hOChx17
	84NiJsuArYxuF9gpAeHavJvT7jHshclVpq0H2MTYpJiNuP85E3vba8JfebMVihRB+E0QIVF+LLFM2
	dB5MHRSqocbF6a1vpKiyxR41IRqGF14Vl4ZwGMwZT7y9TnK41L24WUZGEkY6mJuA+s9J4mPz44Uyn
	B1/yzOAA==;
Received: from [147.129.179.166] (port=37496 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBuZg-0000000CIXe-31x2
	for docs@lists.yoctoproject.org;
	Thu, 23 Oct 2025 08:37:51 -0400
Date: Thu, 23 Oct 2025 08:40:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: observations on YP overview manual, ch 3
Message-ID: <e59c985c-1b0d-3702-fb17-363ad6ed161c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-586481880-1761223229=:930949"
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
 <docs@lists.yoctoproject.org>; Thu, 23 Oct 2025 12:38:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7785

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-586481880-1761223229=:930949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  from here:

https://docs.yoctoproject.org/overview-manual/development-environment.html#

* section 3.3, "For any supported release of Yocto Project, you can
also go to the Yocto Project Website and select the “DOWNLOADS” item
from the “SOFTWARE” menu ...".  i do not see any link or menu entry
named "SOFTWARE". same claim is made a but further down.

  ah, the graphic on that page shows where it used to be, so that
graphic is clearly out of date.

  i think that's it for that section.

rday
--8323329-586481880-1761223229=:930949--

