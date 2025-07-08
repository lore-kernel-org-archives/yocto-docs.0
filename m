Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EECC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:43:13 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.14698.1751967791296000112
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 02:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bInHj1cO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IAlUXx0wxagQ+lnCyYV5wczJ2EM3hLpjlRE65zaaDpY=; b=bInHj1cO01G1rQyswHjGd4xkZc
	kEyjCudfnn+kRcRnmRi3SZshGNeKz7JN9M+6OJOf9TMeWQDMYyCXyq07NyjwbetKXEVZUGFi89rcj
	fukR3x8ONJDlyEuvUM9Z9RLxl6zhzuq+VhejPmrFOAA3GQxtggX0okd4xe3+QyOR4JMHqc0wgoX0d
	/BFLGdvIs1Gru7JPZmQ5BF0VTaZKI8lJ+ipifXJDhzdRTBlYEHeI1NRGFFSxH2jMNPaRh/DhLL0n6
	eLR+RkEtWJThmnH1Un1fBF5kdVQTZbLsepynItgNh1ohQqzrQZv5cXyfWdiWfGUg1UIpZiIY6SbGl
	NZG/aIgQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:59108 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZ4qx-00000006iHq-3Iud;
	Tue, 08 Jul 2025 05:43:09 -0400
Date: Tue, 8 Jul 2025 05:43:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] a couple random thoughts about YP docs and examples
In-Reply-To: <DB6KCKNX3JJJ.3VF9X2K4S5HWR@bootlin.com>
Message-ID: <f6cc9346-ff09-4cd9-f788-c7a33dc052a3@crashcourse.ca>
References: <d2261e4d-bfe5-3c97-a580-ed25d69e228c@crashcourse.ca> <DB6KCKNX3JJJ.3VF9X2K4S5HWR@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:43:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7275

On Tue, 8 Jul 2025, Antonin Godard wrote:

> On Mon Jul 7, 2025 at 9:16 PM CEST, Robert P. J. Day wrote:
> >
> >   reading the bitbake manual (although this could just as well apply
> > to YP docs in general), my first general nitpick is the number of
> > awkwardly contrived examples that involve contrived variable names.
> > consider this section on the ":remove" directive:
> >
> > https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#removal-override-style-syntax
> >
> > why use variables FOO and FOO2 and arbitrary numeric strings when
> > there are so many meaningful examples in the OE code base that would
> > make actual sense, such as:
> >
> >   meta/recipes-bsp/grub/grub2.inc:CFLAGS:remove = "-O2"
> >   meta/recipes-bsp/grub/grub2.inc:TUNE_CCARGS:remove = "-mfpmath=sse"
> >
> > Examples like that actually suggest to the reader *why* one might want
> > to remove strings from various variables related to various recipes.
> >
> >   Also, I don't see any mention in that section about override-related
> > removal that would be useful to explain, stuff like:
> >
> > meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv32 = "libunwind"
> > meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv64 = "libunwind"
> > meta-poky/conf/distro/poky-tiny.conf:PACKAGECONFIG:remove:pn-opkg-utils = "python"
> >
> > In short, we should be using actual examples from the OE code base as
> > examples, and we should try to be complete.
>
> Bitbake is not only used with OE-Core, and so the Bitbake
> documentation should not make any references to it. Maybe more
> meaningful examples could be taken but we need to keep that in mind.

  i understand the general *philosophy* behind that, but i still think
it is more informative if actual live examples are used, rather than
the generic "FOO = fubar" sort of thing.

rday

