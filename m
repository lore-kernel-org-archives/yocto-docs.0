Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8B0CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:00:55 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4319.1782298848812982836
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 04:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=c/zOzLiq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fu5Pc0A5FP5pq8YaDoIDjYmURDvqvJ3ygNZq542s2i8=; b=c/zOzLiqp7CJC94elgnoYj4NPG
	SCgX0lXuvwvvUzDYS17dWhtblGlDRmi3YrQNQjE3py1bUieDsK/Mkx82iW/PE1ZT4iaJTvax8D38W
	wDMJsfAJMIDw5YUQBw8MS4oBjUX6BIW+JXl7I4Qc3Ge1edpcu2GgIoGzLGCQ7VOizlgVfvu/7Xx7b
	SooMZ7zkMt+7AVncgd8X1auamkcxS2DL1iJMrwKurMtOb8HqUTD297UtEWg37jSJQX53YVvGzgaqy
	gM0CEbHTs8zrIzJbpLGcKFlavFavyYyeBugkJTEdF6shTQWU486gWbEEQ6LjqeR3HuY0Qit9Wacou
	kY+uK9vw==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:32796 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcLLZ-0000000FJQ0-1Dap;
	Wed, 24 Jun 2026 07:00:46 -0400
Date: Wed, 24 Jun 2026 07:00:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add missing section on
 build/tmp/deploy/spdx
In-Reply-To: <5860d181-e58a-42ca-a849-a85d1dccd8a4@cherry.de>
Message-ID: <dd385398-0b9b-978c-1a6e-4fdd87685f1b@crashcourse.ca>
References: <3c5da9d7-fc80-7a9a-eaa1-4fb9eed25a6d@crashcourse.ca> <5860d181-e58a-42ca-a849-a85d1dccd8a4@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 11:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9861

On Wed, 24 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/22/26 7:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > There is no subsection on build/tmp/deploy/spdx; add it.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/structure.rst
> > b/documentation/ref-manual/structure.rst
> > index ff84b250b..e22de6047 100644
> > --- a/documentation/ref-manual/structure.rst
> > +++ b/documentation/ref-manual/structure.rst
> > @@ -539,6 +539,15 @@ licensing, see the
> >   ":ref:`dev-manual/licenses:maintaining open source license compliance
> > during your product's lifecycle`"
> >   section in the Yocto Project Development Tasks Manual.
> >
> > +.. _structure-build-tmp-deploy-spdx:
> > +
> > +``build/tmp/deploy/spdx/``
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +This directory contains a Software Bill of Materials (SBOM) in SPDX format,
>
> "a"? I have tens of thousands of them, in various subdirectories,
> though I possibly reused the same build directory for multiple
> builds at different commit hashes for OE-Core and I built that 2
> months ago so maybe things changed since?

  is the question whether the term "SBOM" is singular or plural? here:

https://docs.yoctoproject.org/dev-manual/sbom.html

it's clearly singular. is there a better wording? in that same
section, one reads about generating "SBOM metadata" or generating "an
SBOM document". we should be consistent.

rday

