Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E33CDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:35:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3299.1782293719610662969
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 02:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=r7Pxp0uS;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XAW8BWAC08xyZ8R0bAE8LrLCne8pzwe3ul7LWPbi8L8=; b=r7Pxp0uSr1pSiE7XfmRejwTQSA
	mrqoV0yxs4nwtGKt/GvUHnClNKsOC3x3nMuAXND6SqWp76MvdmYH3TLLrIGGs0Qsq7K4sQ21C2a6H
	ouQZyq6tzxN6bsvJ91fRsmhBIuS9aO1pHreIDnQEPOGRmJthrIQkOAyVqhxEpvnohYBDiy5wkHqks
	tEch7LJJ1qXio1lhXA1KF4OIwxUdi0a24DlKN5QeUu8Kf+FcG1ujCZ5Ny/9VJpBYGQ2WE4n5+Pgrj
	637ujDAhw4Nx3gWpAVNa0ZHsPrPoml5wUm/R4U/SZyCLhfK6hFkw6FczNKcgHEpDBKzq/WXbecqtA
	ik1nsyUA==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:40028 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcK0p-0000000FB0X-4AcW;
	Wed, 24 Jun 2026 05:35:17 -0400
Date: Wed, 24 Jun 2026 05:35:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why not rename "Maintaining Build Output Quality" to
 "buildhistory"?
In-Reply-To: <cfc70f67-3220-4766-ae57-035f66eb56eb@cherry.de>
Message-ID: <5611a1fd-167e-a1a0-c644-7e92248a6afe@crashcourse.ca>
References: <4871863c-1d5d-1ff9-2918-a2d9c6e19041@crashcourse.ca> <cfc70f67-3220-4766-ae57-035f66eb56eb@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 09:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9852

On Wed, 24 Jun 2026, Quentin Schulz wrote:

> On 6/24/26 10:21 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > while this section is titled "Maintaining Build Output Quality":
> >
> >    https://docs.yoctoproject.org/dev-manual/build-quality.html
> >
> > it's really solely about how to use "buildhistory", so why not just
> > call it something like "How to use YP buildhistory"? the title seems a
>
> OK but why would I want to use buildhistory? How do I hear about buildhistory
> in the first place?
>
> > bit misleading and even a little inaccurate.
> >
>
> What's misleading or inaccurate about it?
>
> """
> The buildhistory class helps you maintain the quality of your build output.
> """
>
> This matches the title of the section (which appears in the navigation panel
> on the left.

  because the title suggests a more general approach to maintaining
build quality when the section covers only buildhistory. so why not
just title it that way?

rday

