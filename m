Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4068CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 08:36:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15555.1781080568638171071
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 01:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=nzNiky9W;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4q4Dhyig33KZG4SU10+M9divVKZSkk2dtUUVGNl8VtM=; b=nzNiky9WgtrNo0rT9jb07gtFPo
	aMyRdw+jwhawX9SkJq6+dVHHOSax7DBw9AWxKuGibJ/SIt8Craf1SD9I7rY+oxNZyyHvIkfcE4nxl
	QVxCYhB1b/UoqMNkMiHATII7XO7/SBetziTr3HG5LrTNDcX2hlm0q/0nH9Za2TBd+CMfMwFzC+6HQ
	XeXmyy5+tIt3m410uhuNfcryTpEVTQmKGArigOFZCVLypOW3SE9ewZGsbSEOzqQPyZ1nCtolPXExw
	uzRmUZpOOBjvrLnzC4svG0+nuKOwEYK8KLJp3/dAHBkBux14gvlPPVaP0nOEx9N6SQhUDGF9Bs+TQ
	bOX5q4GA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:36360 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXEPt-00000008NQn-0dmo;
	Wed, 10 Jun 2026 04:36:06 -0400
Date: Wed, 10 Jun 2026 04:36:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe
 re-compile
In-Reply-To: <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com>
Message-ID: <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca>
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca> <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9671

On Wed, 10 Jun 2026, Alexander Kanavin wrote:

> On Tue, 9 Jun 2026 at 21:20, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> > --- a/documentation/dev-manual/temporary-source-code.rst
> > +++ b/documentation/dev-manual/temporary-source-code.rst
> > @@ -65,3 +65,11 @@ build system uses to build the package would be as follows::
> >
> >     project/build/tmp/work/qemux86-poky-linux/foo/1.3.0
> >
> > +Finally, if you make some changes to a recipe's unpacked source code,
> > +you can force a re-compile of that recipe with the command::
> > +
> > +   $ bitbake -c compile -f recipe-name
> > +
> > +The ``-f`` option in the above forces that task to be re-run
> > +(invalidating any existing stamp file).
> > +
>
> While explaining where to find the unpacked source is okay, taking it
> further and providing a way to force-build it is not a good advice. If
> someone needs to modify and build source like this, they should be
> using 'devtool modify'.

  i actually thought about adding a link to devtool, along the lines
of "while this technique works, devtool modify is now the recommended
way" or something like that, at least as a historical reference for
people who have been doing it the bitbake way all this time to let
them know there's a better way.

rday

