Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425ECCD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:52:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71620.1778579539632255194
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 02:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Igtq47d/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ABdjy9z6yu9CLBd0+n/Ww4/aCZZdahdUuwoSkmsojtQ=; b=Igtq47d/VlF24eBrkH9g69y+SL
	GmgIFmmpIPtBPyp2ClrwYrwnrhlalSzehKUFsfQaL4/UImMdL124Z8RlC1chooZcmz84Uzuiqtzuv
	7qIGB40Xcx0F0+o/BU4vfx6mIMG1xMMDhzlaxPu44ztwkolIi/2Q5Bd6uwv/vmbP5gLhtaHp9t3eB
	3Hot9R5IsVd/RvD9IhbFDmDuTI+XYRZyDut3iqe+bnqKMz7JeMUUR0E/MAMiayzpNpFeiyPiDmXNu
	n7o8I8e9tFJjgGd5uNs5MZPCG6npW03UtcPoUKtVJYA8Ej7XRkIqBksBRBsimhrSga2+XoMnrj1lo
	FVExlULQ==;
Received: from [147.129.179.166] (port=53382 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMjmi-00000007LW3-3jGc;
	Tue, 12 May 2026 05:52:18 -0400
Date: Tue, 12 May 2026 05:55:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: mw.choi@telica.co.kr, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual/variables: document the 'dynamic layer'
 concept
In-Reply-To: <0dfd7a48-266b-48b8-b3ff-87b26ce60e45@cherry.de>
Message-ID: <44a71923-cc55-c9a9-f35a-277eeae529ff@crashcourse.ca>
References: <20260511093446.2350-1-mw.choi@telica.co.kr> <0dfd7a48-266b-48b8-b3ff-87b26ce60e45@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-433344537-1778579721=:1331602"
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
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 09:52:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9457

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-433344537-1778579721=:1331602
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 12 May 2026, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Minwoo Choi,
>
> On 5/11/26 11:34 AM, 최민우 via lists.yoctoproject.org wrote:
> > [You don't often get email from mw.choi=telica.co.kr@lists.yoctoproject.org.
> > Learn why this is important at https://aka.ms/LearnAboutSenderIdentification
> > ]
> > > Signed-off-by: Minwoo Choi <mw.choi@telica.co.kr>
> > ---
> >   documentation/ref-manual/variables.rst | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> > b/documentation/ref-manual/variables.rst
> > index a8cbb87cf..755929947 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -841,8 +841,9 @@ system and gives an overview of their function and
> > contents.
> >         previous link.
> >
> >      :term:`BBFILES_DYNAMIC`
> > -      Activates content when identified layers are present. You identify
> > -      the layers by the collections that the layers define.
> > +      Activates content when identified layers are present. This mechanism
> > +      is commonly referred to as "dynamic layers". You identify the layers
>
> Where do you see it is "commonly referred to as dynamic layers"? I cannot find
> it in the docs.

  Technically correct -- you won't find that phrase in the docs, but
that's how everyone *names* those directories. A small sample:

./meta-intel/dynamic-layers
./meta-ti/meta-ti-bsp/dynamic-layers
./meta-rockchip/dynamic-layers
./meta-raspberrypi/dynamic-layers
./meta-freescale/dynamic-layers
./meta-riscv/dynamic-layers
./meta-ros/meta-ros-common/dynamic-layers
./meta-virtualization/dynamic-layers
./meta-python-ai/dynamic-layers

  So there is certainly an *informal* convention.

rday
--8323329-433344537-1778579721=:1331602--

