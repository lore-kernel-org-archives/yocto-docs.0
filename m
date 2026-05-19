Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403D6CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 16:10:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2451.1779206998266839900
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 09:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=VEmZuY/Y;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=178SIpR60zKWDOrhednMirWQyvtUX1WO7lRVGJb5jWg=; b=VEmZuY/Y+cK0OWOF1KjOYBYoH+
	UtlQRmQ/cTyN0u7KN6S/yeoKP8T9phN5LDcBzuD4Cufvd35j2qisFg0jAYFdGTYtx5ch2qAql3KbB
	K9VNezy0V7kPXAhlAUuY1ME+Z1mejEKyviYQQiQVtmGyBVrxxUFgAeMzEh4rCaUosIlCWeyrdBP/I
	WXMgq8pYGdLTmH71qSyI0f0yO/cyPssSbyk9ojEaIzuOdOQ8c8QFfYtZk7yBfLruG7F4LZEu0Yggq
	ahb3I5VFG1ztSgPp2s7+1i9C1Azp1oR/RcPPrZe6dnWn9xKK55v1vSa4z0BMfi9wEtMM5HTrQ3twV
	P0dt8pmQ==;
Received: from [147.129.179.166] (port=45764 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPN11-00000009JJm-0aJr
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 12:09:56 -0400
Date: Tue, 19 May 2026 12:12:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "PACKAGE_EXCLUDE" still claims it is not supported by DEB
 packaging
Message-ID: <e764d11e-104c-42f6-6ce4-3cba46b59bcb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 16:10:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9494


here:

https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE

one reads:

"This variable is supported only when using the IPK and RPM packaging
backends. DEB is not supported."

i just tried it with DEB packaging and it seems to work fine, and i
don't see anywhere in the OE-Core Git log where this support was
added.

  can someone clarify this?

rday

