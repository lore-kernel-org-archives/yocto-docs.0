Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51126C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 19:37:17 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web10.2235.1665430628151544032
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 12:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=qbzRxE/a;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 83b837f9-48d3-11ed-89ae-f8db88ea9a09;
	Tue, 11 Oct 2022 03:41:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ljq8jkD5iOWybgd6lQCzwD7BFUVWVLLuwmuTy6dED3o=; b=qbzRxE/alUkzQudMfpKsyMenQO
	RZjW84508nFq6oLcV2cIwixsZhxk8pVKd7k9csVL33XtgC+U/7ODVDmaofyEDaUO5QvkSMVPBH+ul
	RVKWTf86R34cttnu/zeZNgjTyzgc/tlXJlhxXUdWJcFWuMYo1PaWdA/YyTgyco8g5KITa3OdS2HNr
	uPq62Bq9eic98GOkXmdINnj6aD2XdxftgL9O0BCZiGrwrOavhky/JDyDdy5r9Jsv6syOeGoONnDi1
	dw/Qu7CEeKIEDib5AXVLNLKGkUHRdzxqi/EdqB7Ec5J/QEQnPvI5yAGotAfxwmTPpEUVsO7CImuRK
	YnnuG+aA==;
Received: from [151.210.143.155] (port=49252 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1ohyaF-0002ER-GT;
	Tue, 11 Oct 2022 08:37:03 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Joshua Lock <joshuagloe@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 10/34] ref-manual: add UBOOT_MKIMAGE_SIGN
Date: Tue, 11 Oct 2022 08:37:03 +1300
Message-ID: <6131146.31r3eYUQgx@linc>
In-Reply-To: <10891.1665397447952895356@lists.yoctoproject.org>
References: 
 <dc2732f75dd21ca4fcf40c8ba78808209eb00274.1665392835.git.paul.eggleton@linux.microsoft.com>
 <10891.1665397447952895356@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 19:37:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3344

On Monday, 10 October 2022 23:24:07 NZDT Joshua Lock wrote:
> Nit: commit title mentions UBOOT_MKIMAGE_SIGN , but the patch documents
> UBOOT_MKIMAGE_KERNEL_TYPE

Oops. Fixed on the branch.

Thanks
Paul





