Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60368C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 12:59:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.18625.1753448371385404509
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 05:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZkH6Pr0v;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zv23pG9CX7l6TUJlzjpk3FkvYkC36Oy0DrIe624NyeU=; b=ZkH6Pr0v2J8QopaZHIBW404EBc
	ziyVgDwXUkD1hO4Uq9EHR5iv2GxFHPodx1Wl6mcP/bFy2KGHjpcddvS+uR5TKee/4YtuO4agig3Ae
	D7Y/o+nzji3acJyInmliWHXWAUFhiZPe4vySLYHbzQovDgs/zHoWsZAWWczLtw3GgbhFQVw8YvEHJ
	7nfKOuwOCKqer+F4DVPU4Ps1WYKN5glqlktW0l/TKDtM2Q/RAbYeYQXECZtmMJpR95Iu7SQTukMvE
	AohtK8yBpKnmzkX5PS0UxQN1URMGc3a/TEGplnLOLt5Ci8yRycOTfLrWI0IAD87VFmKyOYskHUzhJ
	iJBLIPAA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:59482 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufI1G-00000001Dfl-3dz3
	for docs@lists.yoctoproject.org;
	Fri, 25 Jul 2025 08:59:29 -0400
Date: Fri, 25 Jul 2025 08:59:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what means PACKAGECONFIG[...] = ",,,"?
Message-ID: <f29a37a8-e752-d173-283b-f0730b8f84b1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 12:59:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7386


  i was thinking of improving the documentation for PACKAGECONFIG with
a couple better examples, and i noticed this in the OE layer:

  recipes-support/icu/icu_77-1.bb:PACKAGECONFIG[make-icudata] = ",,,"

i'm not sure what to make of a value assignment of ",,,". so there are
null values for the enable option, disable option, build *and* runtime
dependencies? what does that mean?

rday

