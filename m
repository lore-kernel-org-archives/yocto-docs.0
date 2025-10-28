Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8167CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 18:37:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.17005.1761676667905473235
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 11:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vbaSk3LD;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qh+LmjNh2MqcafEcePHxfNMiFWqIo21IFexc0xFZILU=; b=vbaSk3LDkU8TAwu2C2nuAXrXNJ
	0bxMDWlmZuKqYtLtDrZexBpnuK9M45RnwO7+GZW/OhTwPPvlUp22/SADAw8qemxrqT3YfoMNioMJp
	nvkCi52mnOfJnRQ+dcMhtxRAxVyr7Mbo07OPs5uxB8kV/z7Y/oe+Bvjz5iMMA8rgaDC08iigewXOV
	A0d+TmU5/GslTTnOjPkoPFDoEjxB6zAnhS6JQ6gw83pm8PVS+DrxSqsf0kjD7clI8lCVTRuDj5zmj
	02YkbwhcehxWxPDi8uHYCjSGqHZLyatVF3OkLj9NZHahAWoHn5Xjq5HGFBoMT5J7BHs/j0qJSwYuh
	HR3YKSqg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52224 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDoZi-0000000Daf8-32GM
	for docs@lists.yoctoproject.org;
	Tue, 28 Oct 2025 14:37:46 -0400
Date: Tue, 28 Oct 2025 14:40:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: whether "bitbake -e" examples should be updated
Message-ID: <a21a032d-3f13-03fa-a7d2-69112eafa2fa@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 18:37:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7887


  more nitpicky pedantry ... here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#running-a-build-on-the-recipe

the reader is advised to display the value of a variable relative to a
recipe basename with:

  $ bitbake -e basename | grep ^WORKDIR=

well, sure, but as we all know, there's the newer:

  $ bitbake-getvar -r basename WORKDIR

which inspires the question -- should that second variation be *added*
to that page, or should it *replace* the older command because there's
little point in explaining the earlier command?

  more globally, how complete are the docs in terms of explaining all
the cool debugging scripts provided in oe-core/scripts? i know the dev
manual has an entire section on debugging, so i'll get to that later.

rday


