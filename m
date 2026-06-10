Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED469CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:51:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16376.1781085088335313581
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 02:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=q6lF2lKi;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6P83oY9ARtHztXR9y8+dHBJ7nXNp4A1C0ECzq2WsfVM=; b=q6lF2lKig1piOvbjlPR+f5faUp
	qmCVkiVPE76NNAbiCAA8mpFZ11eCRihu3/g+JTg/Yj11DYrKSXtjtCUmqu8avDQqM2aVdD3HY3JYD
	AtbOza0XWaYyh2TZzyF4A3cy5VPFUbU+5u7GCIztMxjz9ZOLVaWWh4eL/LDYPoBTDrPJvVCe1wKSp
	zm4IE2WaHLb6ysXUONB8LZe1os3KRrD8s2qm8YrOw+BTqLBQvjxu+54XHlYewvmTLi8pjn/SoyRj0
	qq2pLoixA7z6QqJhscz8vIcUhDqXCYuhL48qeGq6picsaIYqg3OfowmO8pVmc22+VaEBnKe8OuTwT
	jGzURJyg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46814 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXFan-00000008VlY-3Bs8;
	Wed, 10 Jun 2026 05:51:26 -0400
Date: Wed, 10 Jun 2026 05:51:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: Quentin Schulz <quentin.schulz@cherry.de>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe
 re-compile
In-Reply-To: <CANNYZj9EaHwoGNyGeiNV=LYWaDwR31A5THogT-7m9X4g1jjNWg@mail.gmail.com>
Message-ID: <792c5b1a-00a8-00d3-a0c4-8cfd23be31b1@crashcourse.ca>
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca> <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com> <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca> <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
 <CANNYZj9EaHwoGNyGeiNV=LYWaDwR31A5THogT-7m9X4g1jjNWg@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 09:51:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9676

On Wed, 10 Jun 2026, Alexander Kanavin wrote:

> On Wed, 10 Jun 2026 at 11:24, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> > Do not modify a recipe's unpacked source code, it's the best way to have
> > your changes lost. There are non-negligible chances that it'll end up
> > being deleted and unpacked again (e.g. because the cache is outdated via
> > its dependencies or the recipe parsing resulted in a rebuild of the recipe).
> >
> > Using -f also taints the build and you need to clean the sstate-cache
> > for this recipe to recover from it last time I checked, which is
> > something we don't like recommending to people (if you need to clean the
> > sstate-cache, either something's wrong with your recipe or there's a bug
> > we need to fix), so I don't think documenting this enormous footgun is a
> > good thing.
>
> I agree, I'd rather not mention it at all, and point people directly to devtool.

  ok, i'll add that but, as i just mentioned, it's there in the quilt
section as well.

rday

