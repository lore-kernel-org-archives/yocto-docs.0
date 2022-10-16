Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E31C433FE
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 19:16:48 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web10.32819.1665947800294165311
 for <docs@lists.yoctoproject.org>;
 Sun, 16 Oct 2022 12:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default header.b=BmS24SNL;
 spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 9e7b6fb0-4d87-11ed-89ae-f8db88ea9a09;
	Mon, 17 Oct 2022 03:20:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dl8qcd2XKEwIGYuv7AZA7KRx/WBAvBN+9B/xlBUpDQM=; b=BmS24SNLiVysb0Ba3S9grg289X
	b/GzKQZLkTjbLTSW0hhiEHKzeKUYsZ5KJeY7kF5ReuvbffK+T8nV5rUT9PMxlXY74HDpzW8n3KWNC
	NvY59BHw/nvUChN/6KB/+FjOS0s6FLN2pwRDs3vfQuwQUJdGngiCKv25xsDZR4+8AGQAJbC4s93m+
	2svBzSey3QmtmocUZpak8Z4LXAmoBbUrmFuTy1gUgTFCCUHrpFHSXcj/hhPewZLvhyA9M7j7nWIAX
	xOzK62ET+NIK7aeMgUj7hOG2eQa2fk9CE9ji1Ol6K5dgCIyO1SLd4HWL2dixld7irtSV0k/smjwh/
	ZJA4EmUg==;
Received: from [151.210.143.155] (port=6464 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1ok97j-0003xU-7o;
	Mon, 17 Oct 2022 08:16:35 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH 08/34] ref-manual: sync supported distro list with code
Date: Mon, 17 Oct 2022 08:16:33 +1300
Message-ID: <2651293.mvXUDI8C0e@linc>
In-Reply-To: <733d013c-5e75-0cf4-d71b-2ae2e56d6fa7@bootlin.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com> <4b9ba55459a5f02d5f72aa907b5cee128558f557.1665392835.git.paul.eggleton@linux.microsoft.com> <733d013c-5e75-0cf4-d71b-2ae2e56d6fa7@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id: paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 16 Oct 2022 19:16:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3363

On Tuesday, 11 October 2022 21:20:37 NZDT Michael Opdenacker via 
lists.yoctoproject.org wrote:
> Hi Paul,
> 
> On 10/10/22 11:23, Paul Eggleton wrote:
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> > 
> > We were missing Ubuntu 21.10.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > ---
> > 
> >   documentation/ref-manual/system-requirements.rst | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/system-requirements.rst
> > b/documentation/ref-manual/system-requirements.rst index acc97c9..014c9a5
> > 100644
> > --- a/documentation/ref-manual/system-requirements.rst
> > +++ b/documentation/ref-manual/system-requirements.rst
> > 
> > @@ -41,6 +41,8 @@ distributions:
> >   -  Ubuntu 20.04 (LTS)
> > 
> > +-  Ubuntu 21.10
> > +
> > 
> >   -  Ubuntu 22.04 (LTS)
> 
> Is the code right though? 21.10 is no longer updated by Canonical and
> 22.04 is more recent. What about stopping testing it instead?

Fine by me, I just figured the documentation should match what is in 
SANITY_TESTED_DISTROS; in this case perhaps the latter needs updating.

Cheers
Paul




