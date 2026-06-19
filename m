Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5636ACDB470
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:33:13 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49085.1781893985782155333
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 11:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=DgJsZsmb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pjtX+m1cQYF551MPWVAdgSuiz7Vqt/flGcHSpmPwKKQ=; b=DgJsZsmb+3IKaV+q1drKACnzmg
	N+4+AVSF6aDF8AixImhL+HXx/kVVU5MzNNo3z7Krem2jPxf8Bb5g/szDvyTarJyVj2NbQjvt3NC1r
	FLzbnpQtzAZNXnjAXaGbZ9cv49vlp2coiaxT6Nz1R/TdVIO9jzAjn84EWT3mOHCVSNjYbonBbWIzp
	+59rzerKVcIo9MnyHkj9vNCwWrZWDc72imMQtf9LC0dlEcbHV2bKY5Zd58Oq7lRlvuY7pOxrjzGHE
	xXL3Dr8Gu/ufrmUxDIX4oXLa7IvKaVGpOkFfgY3TNdIUKRrlmAO3uPQ+shO+R83f3v3xHwPspsvh4
	e8V5998g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:50922 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wae1X-00000003Qov-1jZk;
	Fri, 19 Jun 2026 14:33:04 -0400
Date: Fri, 19 Jun 2026 14:32:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] dev-manual: mention that "bmap-tools" is
 transitional package
In-Reply-To: <b2efd029-8b9b-499b-91e5-dce3646f384f@cherry.de>
Message-ID: <35ff1c1f-1331-8675-be8a-ddec3baf0283@crashcourse.ca>
References: <79fecd83-e402-c49f-ef11-ea4024ed77e8@crashcourse.ca> <b2efd029-8b9b-499b-91e5-dce3646f384f@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 18:33:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9810

On Fri, 19 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/11/26 5:34 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > For modern Debian and Ubuntu releases, mention that the "bmap-tools"
> > package is transitional to the newer "bmaptool" package.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >    sorry about the earlier typo in the subject line
> >
> > diff --git a/documentation/dev-manual/bmaptool.rst
> > b/documentation/dev-manual/bmaptool.rst
> > index 87162a49c..1e5ad2bba 100644
> > --- a/documentation/dev-manual/bmaptool.rst
> > +++ b/documentation/dev-manual/bmaptool.rst
> > @@ -24,6 +24,12 @@ system image files much faster.
> >
> >            $ bitbake bmaptool-native -caddto_recipe_sysroot
> >
> > +   -  Finally, in modern Ubuntu and Debian releases, the ``bmap-tools``
> > +      package is a transitional package; it exists solely to ensure
> > +      backward compatibility and smooth upgrades from older installations.
> > +      You can safely remove it and install the active package,
> > ``bmaptool``,
> > +      which contains the actual utilities for flashing block images.
> > +
>
> Just list this in the first bullet point which is related to Ubuntu and Debian
> distributions?
>
> I could see switching the default package to install from bmap-tools to
> bmaptool and add a note (Sphinx note) that on older releases, it was named
> bmap-tools so install that package instead.
>
> Note that Fedora 43+ has bmap-tools, and Leap 16+
> python3-bmap-tools/python3-bmaptools.

  my patch was already merged into master-next, but i like your
suggestion so if antonin thinks it's worth it, he can revert that
earlier patch and i can do it your way.

rday

