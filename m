Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC0ECD6E79
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:24:51 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.17835.1697034282645105131
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 07:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=AwOnDSGw;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ui0C00H9fqgDjGU25/yH1MT3HiyofY3Sfph+QdfqpdI=; b=AwOnDSGwjuv9VTcNIqrWToXOsy
	/veUruXorjVlQlmnuKl1fJfG2lwgoNef2lrI1psk7Q5J4qOIs72S0K0WV9oH4LlGbCBLexNFAf2Lo
	JpBLu4bn4GemxG/0MC13vhhqxDCBozOGSmcGHlWF2SXKiAGOaJSjXawO3J2lyL2aeRu9XLiJ3BBij
	oRj8nywHrBS04nGJMta2oiPQWEY92bPuMtlKcWm8iDlufhlmRXB4duqRL31LHiQv4vQBhwshzTQre
	yKGM/U8IfRqFr1NE0+Il2H/oE1uqylQ8dB3xs92NE4CM2dnehIb2mbMtu7LagF1SjbVUgBpV+pj2i
	7BHsA3Qw==;
Received: from [::1] (port=36206 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqa8d-007BCP-1d
	for docs@lists.yoctoproject.org;
	Wed, 11 Oct 2023 10:24:41 -0400
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 10:24:40 -0400
From: rpjday@crashcourse.ca
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: A couple suggestions for the BSP Guide (and beyond)
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <f7894219746f4e31da9239691a63be16@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 14:24:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4353

I can submit these thoughts at bugzilla.yoctoproject.org, but I'll run
them by here first.

1) In explaining what sorts of things can be included in a BSP layer,
there seems to be little mention of the possibility of new BSP-specific
packagegroups and images; I think the guide really needs to include
those possibilities, with examples.

2) I think that, given the growing popularity of RISC-V, a number of the
docs should incorporate examples from the meta-riscv layer. Even if 
there
is no reference RISC-V board, that layer has some nice features that
would make for enlightening examples (see point 1)).

rday

