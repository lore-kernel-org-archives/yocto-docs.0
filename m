Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5365C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:58:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88104.1782723507887981460
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=PGeL2m3r;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sETNIJ04DHfZnBlYqbP+lvJ3VXR7CN75X0GcllrDhUE=; b=PGeL2m3rvifw2TAZwwGniSXad9
	ZYgee0mq1DosL3m+87K8A7MY772bW2Jt88ZEOJulEs3a0CFB18jRYjna+G7Mo6fz/TT/dEagcqGIL
	geBuNo04TAniSvJj6pREHzmLq8RJz0BYzCR1MIrxqhtqancgVGmfvPB/GkjmezVrtXw4RTxMkQir1
	TglVVuawsRg5Vdob+74Y/sZvCCa5KY5YKH0RGeoSMJ8ZHYCwOAihvitmsBw3pCf6LiCQ06JcBX43X
	OS4uoKkyZKnMdP5oTCWeP17umIeWa8LgGgLEwm+0Nly2M9PYX/nCfxlvOhLENuBO9UPIeWBArOCT1
	U/J+id+Q==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:33710 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1we7oo-0000000AZv9-0mGg;
	Mon, 29 Jun 2026 04:58:26 -0400
Date: Mon, 29 Jun 2026 04:58:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] YP docs should use more sphinx admonitions
In-Reply-To: <c7cfe7ed-c24c-4f9c-8509-79b6bd2cdade@cherry.de>
Message-ID: <04adb759-0e91-6485-d527-c67765ba075b@crashcourse.ca>
References: <dc561150-2037-1134-871a-d4ed84b28dd1@crashcourse.ca> <c7cfe7ed-c24c-4f9c-8509-79b6bd2cdade@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:58:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9966

On Mon, 29 Jun 2026, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> On 6/26/26 10:13 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    while there are *tons* of "note" admonitions in the YP docs, sphinx
> > supports a fair number of other admonitions that i think should get
> > more use:
> >
> > https://sphinx-book-theme.readthedocs.io/en/stable/reference/kitchen-sink/admonitions.html
> >
>
> Please only look at the official Sphinx documentation for things that are
> actually supported without additional Sphinx plugins.
>
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#admonitions-messages-and-warnings
>
> It's *very* often looking something up on search engines for something related
> to Sphinx to fall back to some third party plugin. While it's not necessarily
> bad, the fewer plugins we have the best :)

  ah, my mistake, thanks for clearing that up.

> For rST wikipedia says it's https://docutils.sourceforge.io/rst.html.
>
> But I feel like this is a good idea, I like Sphinx admonitions quite
> a lot.

  yeah, it seems like "Note" is the automatic go-to admonition when
sometimes a "Tip" or "Warning" would be more apppropriate.

rday

