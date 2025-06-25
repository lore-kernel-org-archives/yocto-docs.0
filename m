Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76198C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 07:54:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.10160.1750838093394225870
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 00:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mtcZ3eLf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vCaK4i/Wj43vJzagneUZvBP3zeQaVlkmEiyaaxlFJwc=; b=mtcZ3eLfYyhzF4Zhy6H7iECscp
	KsKrqj23p+GO65k2vJ9Or8rcYf+qQsYF6fKnsC/YRW9AnhUhFSdShGWAR5F/w3KWpWbxZYQRiO+ic
	oalToRZWF2gnQTE8+ECVGpiB9ZaGefAozDXGRSk0/AXbZY1LC8xZkWqksDxhMQ+55SrrlqXeJ8af3
	vHffkwJhveuzqjbYXRGEYhZcYmg59wm0KsY/Eu9iCHMFMSzK1rfw4cgZmCVBGFghQu47b1YZ8RCPx
	3NtQH7Z/I2DIpSH1pNfK0hUXvbKiYWRGXMX2IIBx/NhroUu7WA1PmHwXX/+hk9CaUPMoJbtNeBEgY
	AZ1zHyMw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:60932 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uUKxw-0000000044d-2org
	for docs@lists.yoctoproject.org;
	Wed, 25 Jun 2025 03:54:50 -0400
Date: Wed, 25 Jun 2025 03:54:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: anyone have a better example than "irssi" for "rc1" versioning?
Message-ID: <a5284cb7-ba9b-3d8d-cb24-76c184aede61@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 07:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7221


  (side note: apologies for the deluge of patches, i just figured with
my current spare time, i might as well make use of it. i think i've
resolved most of the feedback.)

here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#properly-versioning-pre-release-recipes

there's an outdated reference to irssi recipe:

https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb

can someone suggest a better example for that?

rday

