Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FF5C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:56:33 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.14833.1751968587267933259
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 02:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=VBZLG/4d;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DFD8t3xzfuO2qdteXrT9p24aRFN2m5r4ozNot/Qp3Qg=; b=VBZLG/4dX1JPFUSD+14xJXBBjM
	acDidu5Y3U7RApGDUVTOyw/9QHqTTJT6opeIyrUJE5CnbYEkDnxsQjFKZb/jR2x3+FXBoesUp++7s
	qGyu2pZ3GTbOggumhhZ3uZKEPP+6jM4vooIua/g3kXdao/Z+DYSZGb2nOBh9X3xSqkvUomV7HRYs5
	dNJLDUdeqEI4bDEhntFIBkhrgUj7/RHDVh0aEmBHOeYC4eHTGJjgosQXOS7h7I6M7HjlGfeCLBnFn
	6stDiMnjBN7PFGeOATZTfshrOtaFDyLz8dNT5hK2Dkc4YvyY5icWGIrxpcQ79lzTJrDCg4Q7lA4LY
	JtZKszig==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:48624 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZ53n-00000006kWL-1oMJ;
	Tue, 08 Jul 2025 05:56:25 -0400
Date: Tue, 8 Jul 2025 05:56:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] a couple random thoughts about YP docs and examples
In-Reply-To: <DB6KCKNX3JJJ.3VF9X2K4S5HWR@bootlin.com>
Message-ID: <14e2cbf5-1080-9e2d-ca4a-77fd3bb7df37@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:56:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7276

On Tue, 8 Jul 2025, Antonin Godard via lists.yoctoproject.org wrote:

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

  I think there is a fundamental flaw in this thinking in that there
is a fair bit of BB-specific content that is *not* covered in the BB
manual, but is covered only in the YP docs. Consider the
previously-mentioned "bitbake-getvar" command -- that utility is
defined by the bitbake layer, but it is currently documented only in
the YP docs.

  If you really and truly want to think of BitBake as a standalone,
independent-from-OE program, then *all* of its features should be
documented in the BB manual. As it is, that's not what's happening at
the moment. If BB should really be treated as standalone, then the BB
docs should document stuff like bitbake-getvar, and bitbake-diffsigs,
and bitbake-layers, and ... well, you get the idea.

  IMNSHO, you can't have it both ways -- you can't insist that BitBake
is standalone, then leave much of its documentation to the YP docs.

rday

