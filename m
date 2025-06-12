Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CF6C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:09:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.11404.1749730135139625246
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 05:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HU99OUQJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OPMXRgXyX+FOOJgJ5KOJ3AIFrCzCmsKeo7HIoGLWNcg=; b=HU99OUQJllNAirthOAS5ksgvIY
	9l7/4xF3yGFu+b7aOhvV5twHdEHX0CBGKo6zIrpnVqpyk3PTMgXz4NlPS9gWU4X5pCLP2OwKHegTA
	vwuukG7LvULY7HZoaClMBy5tQvZtVBueQKZMVUX+bdqey19Sf+AEZ8EkvOIfPUXEbw3wHKOreST0r
	CSIij5IUbEVFmP4JqonWGgo+/4IneOhXlFMyl+dgysrmYMFNN1rx4vQBmeaRBEtaUw+RcnGxeCZdf
	0n96D4RLMklrpDJ5KuTPPAaaYOnY9aiNRIaXYrxl18AD3UQNXxQtoZrxnJD+oHC+W2/HY0Rrd7Wp9
	9bKnU3Xg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:47370 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uPgjk-00000000NHa-3OrD
	for docs@lists.yoctoproject.org;
	Thu, 12 Jun 2025 08:08:53 -0400
Date: Thu, 12 Jun 2025 08:08:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: various thoughts about "Introducing the Yocto Project"
Message-ID: <26f0d9be-4e83-8712-1a48-a49e556fafc2@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 12 Jun 2025 12:09:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7066


  again, given free time, just perusing the current docs so some
thoughts about:

https://docs.yoctoproject.org/overview-manual/yp-intro.html

- "Architecture Agnostic": "Yocto Project supports Intel, ARM, MIPS,
AMD, PPC and other architectures". I might add RISC-V to that list at
this point, and even downplay MIPS and PPC given that there are no
actual reference boards for those latter arches anymore, but I will
let someone else make that call.

- "commercial Linux vendors such as Wind River, Mentor Graphics,
Timesys, and ENEA ..." Should this list be updated? Would not Monta
Vista be in there? And perhaps others deserve mention?

- "The Yocto Project OpenEmbedded Build System produces packages in
standard formats (i.e. RPM, DEB, IPK, and TAR). You can deploy these
packages into the running system on the target by using utilities on
the target such as rpm or ipk."

  First, is tar packaging even supported anymore? I thought it was
deprecated a long time ago.

  Second, I'm assuming the reference to the ipk "utility" should be
opkg, no?

- "It is not a requirement that a layer name begin with the prefix
meta-, but it is a commonly accepted standard in the Yocto Project
community." I *vaguely* recall that there are some aspects of YP
workflow that count on layer names starting with "meta-", but perhaps
I am misremembering. Are you sure this is really optional?


  that's it for that page.

rday

