Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26745CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:26:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42210.1782133177257945830
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 05:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OsXley0H;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZOEftu+/hr8o2aFOyWw1cBMUW0mTYWsMds+aAs+qEC8=; b=OsXley0HE+64jYGTCX0uZkLC3t
	RrOkhCtu3hYh+vCxiqbLS3G7Lm4Ff38zQbdswTOOt+Xw9mv6Km2ru3sIc//uQVIPCJB8oGmisL1jJ
	OlJIXuuOZZFmuMb3555gKSJP8J0PBZuYHWgGnbYd6sXFpPKLQhET8i6q5MF5D/pD3/Kjc44dcORRx
	zFdoK4DYNmNkQPHAzzQnvIgRju6ozxeAz+mE/OZoYzzQ2oj55tZytSdkdqJs9wtAWXl1hKqcJbFDn
	IoMmiraOuBtM4G15GBEso9DG5iFKXGKnwLSrClWgpcTcs9MMLgBPDSnHhQ3odMbzKPIVsJtrxQ33x
	wpmOh4RA==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:37814 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbeFS-0000000AQNP-0S13
	for docs@lists.yoctoproject.org;
	Mon, 22 Jun 2026 08:59:35 -0400
Date: Mon, 22 Jun 2026 08:59:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Should Poky's "tiny-init.bb" recipe be documented?
Message-ID: <5288d9bd-9e65-5b51-02ca-c898b5b34bcb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 13:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9829


  Was just perusing the meta-poky layer and noticed the recipe
"tiny-init.bb", which claims:

  SUMMARY = "Poky-tiny init"
  DESCRIPTION = "Basic init system for poky-tiny"

But the poky-tiny distro defines its init manager with:

  # enable mdev/busybox for init
  POKY_INIT_MANAGER:poky-tiny = "mdev-busybox"

and "tiny-init" is not a valid value for INIT_MANAGER, so what is the
purpose of tiny-init.bb, and should it be documented?

rday

