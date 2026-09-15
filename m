Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132E7C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 20:29:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6356.1789504158596830443
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 13:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ItDjLfxY;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gx2NatXDPh9WabL9YDoiUrvC5Y5tSsOu2oRKVU0fV9g=; b=ItDjLfxYczBepqwZUWqB2saMU5
	p+DRZgsKdXgwXY3TtAV0guX3gZBJfNUVYetrOlAAlKmK23nX6q8PlbxEo2jMUITR2P0qd6qLRXecK
	m1SjORLZWDs/1a2u8oX3SeEWI/1O6VllgZObCDCbQ9k1wB1FdsobtCJtGBjhWNblEL+XotAJsIb5g
	b7tDGAyFpWJmXFiCXAkXW66e7WbHJiH4N4z31jlB7JHgT3Z91zEhttzXfRRgoN7PDx/kTye37083K
	GTThU2xkcCn89yo8T4TyIFcRIocE2h2+j0/4ytiHwnxr3gmKjcm7iPJ6K9hJzTjJ0zdeZiRvtQ0EU
	C6vtYhyg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:43556 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x6ZmA-0000000ESE2-2BHy
	for docs@lists.yoctoproject.org;
	Tue, 15 Sep 2026 16:29:16 -0400
Date: Tue, 15 Sep 2026 16:26:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is it worth updating "Properly Versioning Pre-Release Recipes"?
Message-ID: <1d09ac5c-77c1-09ab-5eef-f86b270f66c8@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1558764845-1789504025=:798010"
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
 <docs@lists.yoctoproject.org>; Tue, 15 Sep 2026 20:29:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10515

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1558764845-1789504025=:798010
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#properly-versioning-pre-release-recipes

that section uses as an example the irssi recipe, which is not even
mentioned at the "Storing and Naming the Recipe" section anymore and
doesn't use pre-release anymore, anyway.

  the only recipe i see in all of my layers that uses that feature is
avahi:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/avahi/avahi_0.9.bb

and google AI has a decent rationale:

"Avahi uses prolonged release candidate (RC) versioning—such as the
multi-year 0.9-rcX cycle—primarily because the project has experienced
long stretches of sparse active maintenance while downstream Linux
distributions still require fixes for security vulnerabilities and
bugs."

  so with a single recipe that seems to use that feature, is it worth
updating? if so, i can figure out a patch.

rday
--8323329-1558764845-1789504025=:798010--

