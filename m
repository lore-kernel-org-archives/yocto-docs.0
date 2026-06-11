Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61966CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 20:03:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55340.1781208183580652277
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 13:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=P98AW6bl;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AX/TfdnyQgj5zSdjGQCD7ZaLla+j3kEQpuLIf0uWZd8=; b=P98AW6blbhk1qCyoBMKDQAb2QR
	iRM2Pn5JojE29Ow7vDkh9Zb9k6f3+fsbANsmU25Zj9+UrcqIR39XgphlKJX0ix+f2Cqdntf/X9w69
	HT//5Q9DeFLEt4HvL0S2jq6hVMd+ZB261UsevCclHqzW+U4ks3CUO8SX0wGmEXDfBJdVp4y/J2roZ
	3VThbmRk6T98rggAKYpiJAPk2wISw9E8hFsjL5ZDmBug+PUHPxF9vUvdK33DzZyPa2FYL3W1wsYfJ
	Zo889+2OAlBqweZpX12YlSICkrhSES/eD94L8KwIFinJ4T5sORJ+VA1FTIRKrhZCSABcj1k63eW7m
	Gwzp67QQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:60730 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXlcC-0000000CSg2-2kpe
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 16:03:01 -0400
Date: Thu, 11 Jun 2026 16:02:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: in what context is "sysvinit" the "default init manager for YP"?
Message-ID: <189ec6a5-2ab7-a0cd-4e88-b0a6f017712e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 20:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9699


  here:

https://docs.yoctoproject.org/dev-manual/init-manager.html#

The opening sentence is:

"By default, the Yocto Project uses SysVinit as the initialization
manager."

  that claim is confusing since if one initializes a build using basic
OE, the default init manager is, of course, systemd. OTOH, if one adds
the meta-poky layer to the build and selects:

  DISTRO = "poky"

then, yes, the init manager will be "sysvinit".

  so is it assumed, in the docs, that a YP build will implicitly
select the "poky" distro? should that section be expanded just a wee
bit to explain the possibilities?

rday

