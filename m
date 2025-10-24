Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA79CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:21:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.7840.1761304907656213755
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 04:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KwjG1v5w;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2v8I+2UninaBDhBy9Sha1xltAUQaee12ECoMR2bpIZE=; b=KwjG1v5wKIFPfK+Dg9l2OxypSD
	NOXMKo4r1F+/9yYx0Dh/CAizb76JtIFOjvqtKNsqaW00L63QpKe9HcOf7+VNMh97J34x2mCTlLzjO
	FdWoKj3JbzSZ9iuxXBWn8ra2zw5bwAB+Mt1dytfFuidgVABvMIiApAnjl3hpZ79x8EzIDPl0wa2pd
	gFQxieeZWF0ruURwIc9qgUuIJebQRmtrOUzN6CUBr08/JvCulOuSg9chVsm/xtayujMu48dHd0FHY
	EXw3deoz0v0ZHAC4VpIDNMeYnM31TQ1gcLXZddw/w3yXGD3ASXGhfVABpZKQKL3xzJHtZ4J76/SK4
	5f4oP5uA==;
Received: from [147.129.179.166] (port=55338 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCFra-0000000G5h6-15NB;
	Fri, 24 Oct 2025 07:21:46 -0400
Date: Fri, 24 Oct 2025 07:24:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] overview-manual/yp-intro.rst: update on-target
 packaging info
In-Reply-To: <213f45ef-54dc-459a-9f0e-bd92aa3e1795@cherry.de>
Message-ID: <716d3daa-f951-c954-5b0a-392d1702ef75@crashcourse.ca>
References: <f94df486-b32b-d301-fc6b-b1a5d560298a@crashcourse.ca> <213f45ef-54dc-459a-9f0e-bd92aa3e1795@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 11:21:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7815

On Fri, 24 Oct 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 10/24/25 12:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    - drop references to obsolete tar packaging format
> >    - add reference to on-target "apt" utility for .deb packaging
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/overview-manual/yp-intro.rst
> > b/documentation/overview-manual/yp-intro.rst
> > index 8fa17b191..ed50aff93 100644
> > --- a/documentation/overview-manual/yp-intro.rst
> > +++ b/documentation/overview-manual/yp-intro.rst
> > @@ -174,11 +174,11 @@ Here are challenges you might encounter when
> > developing using the Yocto Project:
> >      changes on the development system within the BitBake environment and
> >      then deploying only the updated packages to the target.
> >
> > -   The Yocto Project :term:`OpenEmbedded Build System`
> > -   produces packages
> > -   in standard formats (i.e. RPM, DEB, IPK, and TAR). You can deploy
> > -   these packages into the running system on the target by using
> > -   utilities on the target such as ``rpm`` or ``ipk``.
> > +   The Yocto Project :term:`OpenEmbedded Build System` produces packages
> > +   in standard formats (i.e. RPM, DEB and/or IPK). If you included the
> > +   "package management" feature in your image, you can deploy
>
> The feature is technically called package-management (with a dash). The use of
> quotes imply (to me) that this is the name of the feature to select in
> YP/OE-Core but that's not the case. When not used to refer to the exact string
> to be put in IMAGE_FEATURES, we currently do not use the quotes (and sometimes
> also add runtime as first word). SO pick one or the other?

  i was actually grappling with that very decision -- i knew about the
hyphen, chose not to include it. i'll clean it up.
>
> > +   these packages into the running system on the target by using the
> > +   corresponding utilities on the target such as ``rpm``, ``apt`` or
> > ``opkg``.
> >
>
> The tools seem to be dpkg+apt for deb, rpm+dnf for rpm and opkg for ipk, c.f.
> ROOTFS_PKGMANAGE variable. But I guess since we use "such as" in the sentence
> we don't expect to least every possible package manager.

  i was also pondering how best to phrase that as well, will clean it
up.

rday

