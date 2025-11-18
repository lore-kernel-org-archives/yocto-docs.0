Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80FCCEE32A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 15:43:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56.1763480604775424552
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 07:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mN4r0wPm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A7QwYsXmNaYiOZ+Q8gdvH4MMRn09sOUUQNMsIhQ+MH4=; b=mN4r0wPmMECQDP7Fg85mQETUEL
	tjs3GUwDkKQSGMJBTbysLWEz8ADSi9u+2uXAPepIRoiUjUu7Cxo+Phk0+ssXM3rc9lEE1sl7GVu7j
	DZUxGYoc8nonIfPPBkQP3Rawxknxttz2eX3g3FnjxW03RIbbQtrIAZedJWzh9REz+shnGwsY32IVD
	vDVOMNKeFJnFpt9KDcUSH/iioP39pBJQk/7q1bToJwTvfApH7JhRdFlJEbB5J3B5KjQJFdnfVQOas
	es0sn9KJWWAPGPhzO+wdMMa8BwhrlbksWpsXIUVnQmJU5DhgvHs8gQ+YNhFJCzMr7tCA0lwR0362Q
	ZB8mfxjw==;
Received: from [147.129.179.166] (port=51956 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLNrV-0000000HX7J-01HN
	for docs@lists.yoctoproject.org;
	Tue, 18 Nov 2025 10:43:23 -0500
Date: Tue, 18 Nov 2025 10:43:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should variables glossary document REQUIRED_MACHINE_FEATURES and a
 bunch more?
Message-ID: <abd05cc5-4e3f-6edb-9da6-70dc18b1c9d4@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 18 Nov 2025 15:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8073


  here:

https://docs.yoctoproject.org/ref-manual/classes.html#features-check

the majority of that bullet list of variables does not contain links
to the variables glossary, simply because those variables are not *in*
the variables glossary. should they be?

rday

