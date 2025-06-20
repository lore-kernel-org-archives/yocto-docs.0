Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A02C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:44:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.4113.1750412693224386331
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 02:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Ni9MHMS1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WNBG+s7iguU7oUxmEFjqpfksUXqcj5/xhGzK61KeaUw=; b=Ni9MHMS1mCGJTSqbtresW8lgQs
	NEimADEZ+MRhffWCTwkYcZTF2MBdzYW4/5yKRqvcjBRgfAtyZb1wccSCZxNJ43YnghYB46ExUMmSo
	gdvqemIoZ8kge8ObnqjgPm4dRHYzb4lCYYaVOv+nMKyLnDNm2i+9teHRyyE3wYiG8s1g7DZJrfsIj
	oh/x/Lv9wOVHIfVNqJ5vgBIxzXMRnNCUWmQucj6Atymv7qCcl4r9pP/xz4BkAY9A1fx8bgy9EcGVe
	JVL6YwrMApoZ7konErEZPeY67auOEqp0eRc3UNHiDEZgAOvlulc0jEXbX/1uiYzGwwDXWZlzzdjjU
	HfemNMig==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44078 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSYIj-0000000GH2P-0nGi;
	Fri, 20 Jun 2025 05:44:51 -0400
Date: Fri, 20 Jun 2025 05:44:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] dev manual inconsistently encourages changing "poky"
 checkout locally
In-Reply-To: <CANNYZj-vcNipixa-0e+v43ww7CCfLqtFVG4WBF7U+Tq9Fg2PEg@mail.gmail.com>
Message-ID: <3f1b7be8-fed6-efdd-ce87-79441aa58a8a@crashcourse.ca>
References: <7da04e7f-11c4-819e-cd9b-7aaea55bd91d@crashcourse.ca> <CANNYZj-vcNipixa-0e+v43ww7CCfLqtFVG4WBF7U+Tq9Fg2PEg@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 09:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7120

On Fri, 20 Jun 2025, Alexander Kanavin wrote:

> Can you point to the 'other doc' please? I think the idea is that one
> never makes local modifications to poky, but pulling in upstream
> changes is fine.
>
> Alex

  it's point 5 here:

https://docs.yoctoproject.org/what-i-wish-id-known.html

>
> On Fri, 20 Jun 2025 at 11:05, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >
> >   while at least one of the other YP docs stresses to never, ever,
> > ever mess with your checkout of poky, the dev manual here:
> >
> > https://docs.yoctoproject.org/dev-manual/start.html#cloning-the-poky-repository
> >
> >   reads: "Your local repository of poky is identical to the upstream
> >   poky repository at the time from which it was cloned. As you work
> >   with the local branch, you can periodically use the git pull --rebase
> >   command to be sure you are up-to-date with the upstream branch."
> >
> > that seems inconsistent. does that merit rewording?
> >
> > rday
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7118): https://lists.yoctoproject.org/g/docs/message/7118
> > Mute This Topic: https://lists.yoctoproject.org/mt/113739433/1686489
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

