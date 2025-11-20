Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3D2CF8861
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 14:07:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34957.1763647672120801034
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 06:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QTPH0n8/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=obZxJro8uDQqIWtsq1m65gScCsFQBozCuidG4OS0NFM=; b=QTPH0n8//89Rhgp7IVJmVc6abV
	LEbWKDNdHUevX0sH/vLlqaFDD1BGR4G9VGs1LH8wypmVPbEN/IGpTlP+pUTFzPDeVkRve5df+EFaZ
	ZV6RuWk2g7ZT8TfudQw3NkdisVorEyEMVTeuviGnmseX4Mf4i3iG7ZSQR5nS5iCZ3imsw1OIfjADt
	bcIDX+DA04ufdRKpR23rdNdZ/iejED133YFmImrHHMao1jMqfz657BAbhNFmr0p/U+fEDJTR0OdmS
	vE02Z7slLY1XRwkKookR1M9m/EkErYZWT6JdwIuarLZZuWgVZnOsA0NU07WIeM5up13sbmwmLRl+7
	i8eeEwRA==;
Received: from [147.129.179.166] (port=53778 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vM5K5-000000076A6-3ktw;
	Thu, 20 Nov 2025 09:07:50 -0500
Date: Thu, 20 Nov 2025 09:08:28 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: alex.kanavin@gmail.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "bitbake-setup" suddenly works differently from QS
 guide
In-Reply-To: <CANNYZj_sH4Pt+aaOP7+2oPibC32QbrYyKYZaKc2CDcVNrExXnA@mail.gmail.com>
Message-ID: <1ea46cbe-beb1-3837-9c0b-26735a3cccc2@crashcourse.ca>
References: <00a37b3f-b40f-f58c-3af0-3512f1f40c2a@crashcourse.ca> <CANNYZj_sH4Pt+aaOP7+2oPibC32QbrYyKYZaKc2CDcVNrExXnA@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Thu, 20 Nov 2025 14:07:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8102

On Thu, 20 Nov 2025, Alexander Kanavin via lists.yoctoproject.org wrote:

> On Thu, 20 Nov 2025 at 14:48, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >   something seems to have changed dramatically since yesterday ... i
> > was following along here:
> >
> > https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/#use-git-to-clone-bitbake-setup
> >
> > and i'm sure yesterday, the build directory that was created was the
> > verbose one as described on that page; something like:
> >
> > Enter setup directory name: [poky-master-poky-distro_poky-machine_qemux86-64]
> >
> >   suddenly, it's only "distro-poky-master". i'm confused.
>
> Robert, I don't understand why you rush to the docs list instead of
> checking the newest bitbake commits first.
>
> Yes, we changed it to something shorter, after lots of discussion and
> prototyping. Yes, the change landed just two hours ago. No, the docs
> can't magically update themselves when that happens.

  based on what i learned and posted in my followup, this change seems
confusing if the name of the generated directory depends on the order
of initialization. but if that's the new standard, so be it.

rday

