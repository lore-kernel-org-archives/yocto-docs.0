Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726C5C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:16:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38830.1782490588607569135
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 09:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Nb8ghdaF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KkUFjy+WUEdADUmprTmH38fvLrqytaHXxoTsgiQ7J1Q=; b=Nb8ghdaFvllxq00HRri2GdPshO
	eM4SMOydCPClrk8Nq/N/YPfWKaIVc1Hgvj4ZvwRxkh+srqO1wfVABY9Ao+dkKBC07qE+EJAy4M6iJ
	pXKpCqJgxXABqA1A4LWNWoJAfh5+S8FJ46qNu9SlhZhWiP+Yu1layRZrS8Zi+L7n4OOD44TkQJQqx
	jyaiCP4Yg9bj6WV4lkTadUnpok0YN8KRoX3qP0YPxzGPbUGgZhhYNyIoco3RDHt5BDpibLgFV1laK
	qy1cumB1lcVu71UyRrxdA7PWi5G+Tcdqt5dzHq+rPC99Ve/kzuyXuMLHpiwfc1cpTf9Y6NEa+M6UI
	y2lDru9A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:43858 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd9E5-00000003RFS-2H5h
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 12:16:26 -0400
Date: Fri, 26 Jun 2026 12:16:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: ref manual explanation of do_configure() seems incomplete
Message-ID: <f752867d-01b5-b9f1-3530-34cf8c4ce16c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1271884281-1782490578=:3931855"
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 16:16:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9909

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1271884281-1782490578=:3931855
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  (currently poring over ref manual "tasks" section, will ask about
whatever seems confusing.)

here:

https://docs.yoctoproject.org/ref-manual/tasks.html#do-configure

one reads:

"The default behavior of this task is to run oe_runmake clean if a
makefile (Makefile, makefile, or GNUmakefile) is found and CLEANBROKEN
is not set to “1”. If no such file is found or the CLEANBROKEN
variable is set to “1”, the do_configure task does nothing."

  if you check the task definition:

https://git.openembedded.org/openembedded-core/tree/meta/classes-global/base.bbclass#n379

it seems that even if that test fails, there might still be some
subsequent processing, so stating that it will do "nothing" seems
potentially misleading.

rday
--8323329-1271884281-1782490578=:3931855--

