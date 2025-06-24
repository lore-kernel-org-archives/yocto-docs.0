Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4E2C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:38:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.4466.1750757917397898319
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GDlnMmMH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A8y8JeIM/2p2jYDbnoIzo9TuTsoZcD1FRgrSUDYpR/0=; b=GDlnMmMHIvVWUH6lWHJJSkSx39
	4zSEQGZZNwBsUcqlAr68bgjQJCH665rZSrtKk9cYHGQswpYhmcwJzDj4pkxEXR0GVRaZHqshNqeFv
	hsnNC8lQLpFXihgrr1fnC1+u5puUYaan26IqE5sHKfR+gavHuI4m91IR+CcBoa+p7n1op9xIMJoY2
	aHLOSV3/kXVRrHrVdcUCV8GGbS2gn99KGc82LXVlhNYnrFQ5eRoN3CFUOVOd0Z+hf4qGihcBnWLwG
	j6YMm85HaN8S0JQ+5ShjELQ9jIUgjSWzUjqinOPmm0YrpdVC18V7tpxJgiM9sG96OwxGqoG7OZlSG
	Sb3qYPcg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:48470 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uU06r-0000000E7ha-3WUM;
	Tue, 24 Jun 2025 05:38:35 -0400
Date: Tue, 24 Jun 2025 05:38:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] how is YP "search docs" supposed to work?
In-Reply-To: <301a3cbb-e3b9-4624-a7b4-a194f1916b2c@cherry.de>
Message-ID: <a44f0b66-1d5a-23cc-c171-7e7e13ade2ad@crashcourse.ca>
References: <833d5f5b-795f-b669-8c71-a56ae6a630e2@crashcourse.ca> <301a3cbb-e3b9-4624-a7b4-a194f1916b2c@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:38:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7199

On Mon, 23 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/22/25 10:54 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    i just tried to use the "search docs" box at
> > https://docs.yoctoproject.org/index.html and typed in the search
> > phrase
> >
> >    "container layer"
> >
> > and got a ton of matches on simply the word "layer". is there some
> > special format for search strings?
> >
>
> Absolutely no clue on how this should work. The search feature isn't great to
> be honest but I'm not sure if it's not something we cannot fix via some
> configuration or a third party service or something.
>
> There's been some improvements recently, see d4a98ee19e0c ("conf.py: tweak
> SearchEnglish to be hyphen-friendly").
>
> If you find something interesting, please let us know :)

  i think i'll put this aside for now, i have enough to keep me plenty
busy. :-)

rday

