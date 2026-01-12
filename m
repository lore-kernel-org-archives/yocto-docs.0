Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF28CF45AA
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:47:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37534.1768236434776056577
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 08:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=U361qg8F;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ptnUINxG/00smDb87nagHKsmAYN+VpcV7+rMEPkrHnc=; b=U361qg8FMEJm2C2sAGu5YEMjEG
	IDqtflWaIndsnJqQs0hzT1vIqPkucdoCQGJoX6D1JPj7nA/L8hsfu+k1XIKYmOphemZHFz7599oip
	3u6XabIW6TFwwOpdhfpqQgHS3CPn/Gbw8OCtFHSTUqUgXJgU6afPnGHsYD2klPwWeJE83QasjIroc
	IB3ZXh2u2pVAZGm1RYqA4r/IQ8paSgm9VPNrxOvhfZUSht9t584y/GViaG2G66scXwoFOq0yYPVdX
	7jYgGzs5/GmSrpTtgcdy6lcIQWQdFl7m0kp0sVrsyb7n4U3GscpLYce5O0UJPsWW+dmAWjKxy0nx0
	WkxPHF3g==;
Received: from [147.129.179.166] (port=54746 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vfL4S-0000000GZ4n-3ywX;
	Mon, 12 Jan 2026 11:47:13 -0500
Date: Mon, 12 Jan 2026 11:50:33 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
In-Reply-To: <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de>
Message-ID: <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca> <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 16:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8468

On Mon, 12 Jan 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    more nitpick ... here:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality
> >
> > last line in that opening section, why is the phrase "configuration
> > fragments" rendered in monospaced? is that meant to be an actual
>
> So it doesn't feel left out with addfragments right after being monospaced
> too? More seriously, I don't know, but I wager the intent was to make the text
> italic as to highlight that it's a two-word term?
>
> Would you mind sending a patch for it?
>
> While at it, I think it makes sense to modify the "``addfragments`` directive"
> part with a link to the section in the docs. Maybe another patch to send?
>
> Also, this pertains to bitbake user manual, so I think it'd make sense to add
> the bitbake ML when asking about bitbake-specific docs (both BB and YP-docs ML
> that is).

  I notice you just posted a set of patches to fix a bunch of the
references, but it also seems that there are different syntaxes being
used for some of those references. What is the blessed way to name and
set references across the YP docs, and the proper way to then access
them? There seems to be a lack of consistency.

rday

