Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5396FCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 11:58:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web01.4505.1761739100004640003
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 04:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bVlYxeud;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9RzqrM5xnqIGe8sBbLAcxjpwh+B4rgywTvj4VEJlSh8=; b=bVlYxeud/qLsRMnX5mzzRFOutQ
	G0KhwD31kMSqorkKXDzlcCsVPYXmfdIMyy7Vh3bfW0us8F97o+hyMedvfSIN4KdGXUefzB6R6D+R9
	r+7XgAgiIzBovaX9FJz1RzBnniBNfChHT8ptgzM4gluLrJPSka5OsBFqVbSycOeKdIbS92eUoKHFz
	ncye3Q8do51WOe+mZDnv5ymmnbr/HbkF60SKC9U811VR3Uk28UWZfjtUy9LtEevgR0ztCgfW8OgOg
	Bw+njJwKy9jvKCDUejUIfulKzBPp8PcGZjZ3BPIefTjfe6JABf/tdUchfONQe1IIwS3aZWQf1ZG2M
	qF/ErCag==;
Received: from [147.129.179.166] (port=52490 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vE4oh-0000000G5w3-2hTS;
	Wed, 29 Oct 2025 07:58:18 -0400
Date: Wed, 29 Oct 2025 08:01:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual/new-recipe.rst: replace 'bitbake -e'
 with 'bitbake-getvar'
In-Reply-To: <219f6279-799e-4ba5-959d-37bba26d293b@cherry.de>
Message-ID: <588dad14-f5f1-a5c7-7d30-a2443f738904@crashcourse.ca>
References: <fa6e98c8-8edb-d7c0-5407-b1f27ce83078@crashcourse.ca> <219f6279-799e-4ba5-959d-37bba26d293b@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 11:58:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7900

On Wed, 29 Oct 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 10/29/25 11:29 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Replace the legacy call to 'bitbake -e' to get the value of a recipe's
> > variable with the newer call to 'bitbake-getvar'.
> >
>
> It'd be nice if we could catch all instances of `bitbake -e` we can replace
> and fix them.
>
> documentation/kernel-dev/common.rst has one we should be able to get rid of.

  i'll send patches as i run across these -- i would not try to
automate this as i'm sure each occurrence has a specific context that
requires individual treatment.

rday

