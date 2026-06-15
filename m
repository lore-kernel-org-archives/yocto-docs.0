Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58416CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 18:17:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.135990.1781547440692538724
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 11:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jKB0/swg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DG6Q3Y7GHQw3qGYvBgiLVmDe/EuPmFpWPaL781UaSzk=; b=jKB0/swgmAZq/1qhxb5JtzsC0e
	/gqd3UH/LD0ThSWNShHgd9SExGz9A5qEwWf6GIc33GT+Pi/EGtZBezQVBfFK23Ukc++NJhVNy8xwV
	cyPO5W7T4sRvrgzIr1tb8fEH9bs+krX/u5tsP47LeKMnbbc9nPfpkkAFdZ4rlwkM+3RnseBZ3KlJM
	sXHXjpSmPEECJO0nMsQ51k2+TOoHFik+wvR0Vf0RmBI3D6MQpV1sSUg8EATTMY56UFiL4FTSwkS4e
	Lsq/e296pZp9sM6i2rlacHnw0owoyEUlKMeHCQdmwWnNDWPs23pTP2TjC1M3QeMWnkhuUlHWXPRcM
	E49XU9Mg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33232 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZBs2-00000004y7L-2NuO
	for docs@lists.yoctoproject.org;
	Mon, 15 Jun 2026 14:17:19 -0400
Date: Mon, 15 Jun 2026 14:17:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: kernel metadata: confusing definition of "simplest unit" of
 metadata
Message-ID: <accd0076-57f5-e485-64e9-58e7dd236e1a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 18:17:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9725


  in the opening sentence here:

https://docs.yoctoproject.org/kernel-dev/advanced.html#configuration

one reads:

"The simplest unit of kernel Metadata is the configuration-only
feature. This feature consists of one or more Linux kernel
configuration parameters in a configuration fragment file (.cfg) and a
.scc file that describes the fragment."

  but that's not true since it seems to imply that you can't have a
.cfg file without a .scc file that describes it. but you can clearly
have that; here's an example from the meta-arm layer that uses only
.cfg files and no .scc files for a kernel append file:

https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-kernel/linux

  so how should one read that opening sentence, since it certainly
seems misleading. is it meant to refer only to the yocto-kernel-cache
layer, which certainly seems to adopt that as a *standard*. but that's
not the same as it being *required*.

rday

