Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90519CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:08:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.28585.1761559732997621534
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 03:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=kaIylX6T;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bRjT4FXhyqWsAtz8MDXru4Ddg+dxzPOMBae2DUAVaLY=; b=kaIylX6TLljCPIoWI4J+tpvagY
	zY11vQL+PX/do+Cs3or5QdeDhzYgs8tAQTtqt2tPjfmBv8+idcw3+gx4o4T54v3kPVSh/1aLr2udy
	4rdNG68UnHCT/hxdLninpLukDkq5Qopi/7a2TubjWihnM+nmJF1LMxraXEyEhnv2bOzc69WLFw9/p
	bvPx+kFsqEH5v0sbxPuL9w8F5ErGfqvMmre/oiwYgiL1AGpIMGXGGwOymhFHd4FzS7KZhb7VPSNlT
	7PtOxMlO1bh/STInMGt/5+yxpf4Jam13qlsjrFHiJFsBiHB6jLhFj+FQv8CxgJnBC+k0BbSgUNr1i
	TZEFnBhw==;
Received: from [147.129.179.166] (port=40618 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDK9h-00000008ny2-1X7e;
	Mon, 27 Oct 2025 06:08:51 -0400
Date: Mon, 27 Oct 2025 06:11:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] can you apply back quotes to something already tagged
 with ":ref:"??
In-Reply-To: <5fbc6959-fad5-4889-bb5a-ca3e308bc6ee@cherry.de>
Message-ID: <ab11b102-0a59-8b4e-7d15-844c7f89578a@crashcourse.ca>
References: <03001043-f0eb-c151-d69f-ffe409969902@crashcourse.ca> <5fbc6959-fad5-4889-bb5a-ca3e308bc6ee@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 10:08:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7844

On Mon, 27 Oct 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 10/25/25 12:07 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    just noticed the following in dev manual, "layers" chapter, where it
> > *appears* that someone is trying to render as monospaced the utility
> > name 'bitbake-layers' inside that ":ref:"
> >
> >     layer-creation tools, see the
> >     ":ref:`bsp-guide/bsp:creating a new bsp layer using the
> > \`\`bitbake-layers\`\` script`"
> >     section in the Yocto Project Board Support Package (BSP) Developer's
> >     Guide and the ":ref:`dev-manual/layers:creating a general layer using
> > the \`\`bitbake-layers\`\` script`"
> >     section further down in this manual.
> >
> > Notice the backslash escaping of back quotes that suggest this is an
> > attempt to render as monospaced, but that doesn't seem to do that, as
> > you can see:
> >
> > https://docs.yoctoproject.org/dev-manual/layers.html#creating-your-own-layer
> >
> > or is that trying to do something different?
> >
>
> https://docs.yoctoproject.org/bsp-guide/bsp.html#creating-a-new-bsp-layer-using-the-bitbake-layers-script
> (source code
> https://git.yoctoproject.org/yocto-docs/tree/documentation/bsp-guide/bsp.rst#n1145)
>
> Remove the escaping backslashes and try to build:
>
> /yocto-docs/documentation/dev-manual/layers.rst:19: WARNING: undefined label:
> 'bsp-guide/bsp:creating a new bsp layer using the ``bitbake-layers`'
>
> If you remove the tick quotes entirely:
> /yocto-docs/documentation/dev-manual/layers.rst:19: WARNING: undefined label:
> 'bsp-guide/bsp:creating a new bsp layer using the bitbake-layers script'
>
> The title contains tick quotes and it'll be found by the cross-referencer only
> if we pass the link with the tick quotes. They need to be escaped though
> otherwise they don't work as evidenced above. Having it render as the title
> would be nice but that isn't the reason.

  yeah, i followed up my original post with a "mea culpa" that i
figured out what was going on.

rday

