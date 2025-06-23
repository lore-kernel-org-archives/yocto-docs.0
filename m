Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474F1C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 13:43:30 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.20043.1750686206777660984
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 06:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0ynt93od;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TVhH2AFnF3ECuZkRlSoB52PWuOQoY7suEiRNptIZfqU=; b=0ynt93oddaPLa0ShMpAlwa+XNB
	4FErhvtykd2psNS5YsKnrf1Woge8tKeTKCnySrXb+u8pB85gmr14oOHfwOwS2TyUXFcxpVITh1v7f
	984Xit0UZVhhWqVh85YepuuHRBtK/aH6z561tarcScgPoWa5Rt+sPhh5oRxpwdbdI6A/EZb7mSnp4
	ZYHXVZioISY/BJXJ2dWK3PJPkayIRGdWdmFIRrm83ebCCUpEi5rdhRh1G7nn9psYYCTPXW2iY6W6Z
	AwsCBCxyN8WzVMqskLDsSxZtsmQRxPyx5EvfKH8H9YWu5y3pwuG8u51ExdprFdeYBN+gos14PuwiK
	IPQhapsQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:32844 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uThSF-0000000BBDS-2mnW;
	Mon, 23 Jun 2025 09:43:25 -0400
Date: Mon, 23 Jun 2025 09:43:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual, CH 5: grammar fixes and update
 recipes
In-Reply-To: <184BAFAC08A37F25.5850@lists.yoctoproject.org>
Message-ID: <334def23-d716-bfb5-59d4-4ae5f43c8a25@crashcourse.ca>
References: <23ac0815-60ab-fef4-533b-920e61f5d38b@crashcourse.ca> <f096f57b-8889-4dac-8e9a-a15b04915344@cherry.de> <184BAFAC08A37F25.5850@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 13:43:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7153

On Mon, 23 Jun 2025, Robert P. J. Day wrote:

> On Mon, 23 Jun 2025, Quentin Schulz wrote:
>
> > Hi Robert,
> >
> > On 6/20/25 9:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > >
> > > Major updates:
> > >
> > >    - update strace recipe version
> > >    - replace git example with gnuplot, which actually has two
> > >      SRC_URI values that need naming
> >
> > But is part of meta-openembedded. Can we use an example from oe-core maybe?
>
>   i could probably find a suitable one under oe-core, but what is with
> the numerous examples of:
>
>   SRC_URI[archive.sha256sum] = "...."
>
> that i see. is there something magic about the name "archive" that is
> not explained in the docs, especially when no SRC_URI value uses the
> label "archive"?

  never mind, just saw it's set when inheriting gnomebase.

rday

