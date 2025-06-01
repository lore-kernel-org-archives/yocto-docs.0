Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5C8C54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 15:47:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.29876.1748792865920273046
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Jun 2025 08:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Rv1Re5Rh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oT0q8ccDhbOgsCv4sCJ7rzM/gaeLDK5QZ3Q/1Oiwg/g=; b=Rv1Re5RhLZherAeFja5TkikDt7
	tI5Usk7q8zJcjz+YLy4Y+Z8AXeIvo3XonTMOStgCWo/unPeiH5tM4sCdAMJ0wfrvzABeyAZVQMrFw
	FdfcCswhX70/NIbn7FRH5+iG0rKwkMAldMhcDQ+2nYao/ZlgMWAgVE4RvNEtN2XXzpocdXBz/Kut8
	GQmbOMiFVHgex3mWSYiqXYMb6EFx33p1kwWHMbgugKJ28XaoNEhNzZCCOVKX8aP3xGq661q0H6V+p
	C4RMRJAo+yiiFx1aZACm1SHSVA3o8H6lFEuHqAlETNHO1kqedh4wKESF1+dnr+R0pT5lgexYIuZzM
	n5+oq+hg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:35196 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uLkuO-0000000DyyF-2iJ8
	for docs@lists.yoctoproject.org;
	Sun, 01 Jun 2025 11:47:41 -0400
Date: Sun, 1 Jun 2025 11:47:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Should bitbake manual mention use of unversioned recipes with bbappend
 files?
Message-ID: <e44eda6b-722f-4d56-fcbb-9e08e56669b8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 01 Jun 2025 15:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6954


(Is this list for BitBake documentation questions as well?)

This section in the BB manual:

https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-intro.html#append-files

describes the proper use of wildcards with bbappend files, but it says
nothing about the occasional BB recipe that is unversioned. One
example in the poky layer is the linux-yocto-dev recipe and its
bbappend file:

$ find . -name linux-yocto-dev*
./meta/recipes-kernel/linux/linux-yocto-dev.bb
./meta-yocto-bsp/recipes-kernel/linux/linux-yocto-dev.bbappend
$

Is it accurate to say that, in cases like this, both files must be
unversioned to be considered associated with each other? That is, the
bbappend file "linux-yocto-dev.bbappend" will only ever be used for
the unversioned recipe file "linux-yocto-dev.bb" and for no other?

I think it's worth adding a final short paragraph to that section to
mention this (as long as my understanding is correct).

rday

