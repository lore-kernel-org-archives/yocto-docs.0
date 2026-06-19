Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FF3CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 17:31:10 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47703.1781890269222212342
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 10:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=XnogHI22;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rTETcjGVImuJ8J+mtEVXyWGsu6ODgQmewjvSJDPdBmk=; b=XnogHI22VZcdL3XLwfKiJhJK5W
	2RB+nHO/6CC1aD4LqADQzg8l8TDIB7vK6rVTJUIKImy+ov/cjI0Svf9aND6Vv92pmuEJBQBcJllLI
	M8pIhwmLzEmC1IB1nylb/a7XCMyCJfCzn5rNSdN5fgoDy9vkbad9Va3MBLksuXsIvyOPa3h4DBn+/
	b5cUDxCYizaSCmRNl1s0XNTT2/RQM87aUHYarhfwDZh2e0dW7ylPL7j7GfMFo3cXll8VXlVz6xMdq
	WN8WvfFZGZey4b6l+ZByX53PDv7QcNxrE5+qKlyiFXxPyzTlnJmv17+ttPAGOIpr4rIoy6BldmQ/D
	QSM9AMFw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:40092 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wad3X-00000003KF3-0phn;
	Fri, 19 Jun 2026 13:31:05 -0400
Date: Fri, 19 Jun 2026 13:30:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
In-Reply-To: <eb993591-b3d4-4292-8409-7c7db83841a0@cherry.de>
Message-ID: <21867718-d308-33f5-c4dc-a832bb982a28@crashcourse.ca>
References: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca> <eb993591-b3d4-4292-8409-7c7db83841a0@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 17:31:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9808

On Fri, 19 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/16/26 6:46 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Warn the developer that if they need to set "PACKAGE_ARCH" in a
> > custom packagegroup file, that setting must precede the "inherit
> > packagegroup" line in the packagegroup recipe file.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/classes.rst
> > b/documentation/ref-manual/classes.rst
> > index 95e07f85a..839a89d4b 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -2130,6 +2130,18 @@ section in the Yocto Project Development Tasks
> > Manual.
> >
> >   Previously, this class was called the ``task`` class.
> >
> > +.. note::
> > +
> > +   If you're defining a packagegroup and need to set::
> > +
> > +      PACKAGE_ARCH = ${MACHINE_ARCH}
> > +
>
> OK so reading this I was like "but who would need to do this? packagegroups
> are only supposed to include other packages and not compile anything!
>
> Then I looked in OE-Core, and there are as many packagegroups with
> PACKAGE_ARCH set than without. It seems that the need comes from using
> MACHINE_FEATURES or other knobs that depend on some configuration variable.
>
> I think it'd be nice to document this (if not already, but since you're
> scouring the docs now maybe you'd come across something like that?).
>
> I'm thinking this is a big enough footgun that we may want to document the
> order in the variable glossary as well.

  amusingly, the current packagegroup-core-base-utils.bb opens with
the duplication:

  PACKAGE_ARCH = "${MACHINE_ARCH}"

  inherit packagegroup

  VIRTUAL-RUNTIME_vim ?= "vim-tiny"

  PACKAGE_ARCH = "${MACHINE_ARCH}"       <==== ????

"git blame" shows that second line added 2019-07-23:

    packagegroup-core-base-utils: Make it machine specific

    Recipe makes use of the variable MACHINE_FEATURES, which is machine
    specific:

      ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "kbd", "", d)}

then two days later, from the same person, the first line being added
with the same commit message.

  i'm guessing that second assignment to PACKAGE_ARCH is unnecessary.

rday

