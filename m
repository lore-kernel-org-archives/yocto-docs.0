Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F167C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 19:36:17 +0000 (UTC)
Received: from mail-61-r20.ipv4.per01.ds.network
 (mail-61-r20.ipv4.per01.ds.network [27.123.24.217])
 by mx.groups.io with SMTP id smtpd.web09.2136.1665430566902099989
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 12:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=ISLEmthO;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.24.217, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out02.au.ds.network (Halon) with ESMTPS
	id b4944801-48d4-11ed-9ffa-f8bc1204ff90;
	Tue, 11 Oct 2022 03:49:52 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XXVPIIh8b2XGE9JtPWguuzl+iVYJIGEBXR0JoAoam0o=; b=ISLEmthO5LRxvIb+Ju5CuPripi
	irV9pGTlwCdwZxNt7tZfYQ/B2nG8ijrB+Q1u8agSqzdCNi8WCnXHAKYUPn2WMv7YJYU+dRGkI2dpt
	8TOhtZFpX9K8iFYxhO9jQExWWmW4DLGO8m9IXaRfxi/IK7U/SLOEKa/Ezz6+II9J3ojjhl8lxNBj/
	6PZefOPSYuYSs/lK3U/Nred/aqk86QfRSwCFA1zIeh+DeGmvZm8n4CpaY9TfghIgWP3uICvAifvOH
	FdxlV/OBTg5HwyxeapmCq5r77f2M4nP3YAGyIzUWViYLR9fFppefTB2+4+lS62UJ3lKKlwJvLMfvq
	9iyAF4Uw==;
Received: from [151.210.143.155] (port=49210 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1ohyZG-0001QO-Kq;
	Tue, 11 Oct 2022 08:36:02 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Joshua Lock <joshuagloe@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 14/34] ref-manual: add pypi class
Date: Tue, 11 Oct 2022 08:36:02 +1300
Message-ID: <6966649.DvuYhMxLoT@linc>
In-Reply-To: <7844.1665397383974110998@lists.yoctoproject.org>
References: 
 <724a266846bef0af109ff0e5740217008f85872b.1665392835.git.paul.eggleton@linux.microsoft.com>
 <7844.1665397383974110998@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 19:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3343

On Monday, 10 October 2022 23:23:03 NZDT Joshua Lock wrote:
> > +``pypi.bbclass``
> > +================
> > +
> > +The ``pypi`` class sets variables appropriately for recipes that build
> > +Python modules from `PyPI < https://pypi.org/ >`__, the Python Package
> > Index.
> > +By default it determines the PyPI package name based upon BPN (stripping
> > the
> 
> Nit: it would be nice to change BPN here to :term:`BPN`

Ah yes, well spotted. Fixed on the branch.

Thanks
Paul




