Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3A4C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 18:34:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.2572.1750617287302497847
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 11:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jwfMvIj9;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tz1yeARM6Fe+2fD0LkcwggjoqQ7VmyoTNKCoWNorWFg=; b=jwfMvIj99FEvpPL3x3AC/8gZyM
	Siy1yPxnPLg0cPFIZKmBzaP2xTe5tUwX+IhcSADuRLmhE8VYEgPaoEKpDY+cYN/9h7HvKPgeJ2M7/
	eqiVnSfmYzf/uOVcsR7FsEmvKApIbyajClhQFuSGlUPFXTwlad26yUWfWnsh//V00nzVgAz+WHs6r
	2KidL0ixn33zrHzIs5PzeFtSClNkB5vWmzHM7z7R3NegRnEDMZK/Cl1BADsWdJsdyqA/yRnBPhzeZ
	trNszPX7EzJONoW1DakqFPPZk3CVnZx1Y4f4F3BSqTQIdra7+QsVuaqnIS502zMr0JvK6nB8IGO2h
	KeYkDi7A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37170 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTPWd-00000008PEJ-2Gwd
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 14:34:45 -0400
Date: Sun, 22 Jun 2025 14:34:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should page on "Selecting a Device Manager" mention uedev?
Message-ID: <3ee37427-2257-90a8-4ef7-03e344f0e671@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 18:34:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7143


  this page on selecting a device manager:

https://docs.yoctoproject.org/dev-manual/device-manager.html

says nothing about eudev. should it? given that both systemd and eudev
PROVIDES = udev, what happens if one selects systemd as the init
manager, but selects eudev to provide udev? would that even work?
should this be explained?

rday

