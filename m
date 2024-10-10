Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6650ECF07DD
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:12:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.39148.1728551567616629120
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 02:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YCEy36TH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB4B71C0014;
	Thu, 10 Oct 2024 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728551565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CTbAQUh186g3q9RiYRF0hwsW47g+X7wu03iZeepICM=;
	b=YCEy36THbnDoBZB0A5CzqotOlxjRkcgMGXsScAMnNQXRYLXP1aSZRm0huIQ8rdTEil3o8C
	EirEQZ7Sk8lTv5RZmj/kNVDJ1ajZz/Zl1yZDLuC1RSdUokppsLOkxt7UCqwQbIEoYRE/Pv
	M8Dk6kF/BewBjt6Gxrzp/Q+CdpP84pr+ex+wUmZHQJifPGU2CDgJjDxHwyF6ajw1Gr9qX7
	MWjrsYWi146PZ+MlGsoWkAe82ng1+8jcgyV7Q6cXFLNqgDBBY9q+id64+FUFPBRsIZSbc5
	j7ELZHgnKAK6i0u4DUd0tSisRvfTHPIgmZWQ+yrVTasTuDDUb6UMspmcmuXyKg==
Date: Thu, 10 Oct 2024 11:12:44 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	docs@lists.yoctoproject.org
Cc: ross.burton@arm.com, paul.eggleton@microsoft.com, 
	Lee Chee Yang <chee.yang.lee@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [docs] [PATCH 15/16] release-notes-5.1: update for several
 section
Message-ID: <dfrj5cf4ou6pobu6b4dz2ackrz2gx7ht4xyxponnu3nrsuebtn@2awb6a77kbqc>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-16-antonin.godard@bootlin.com>
 <e6f6bc70-2dea-4e51-9288-ff11ee8e89e7@rootcommit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6f6bc70-2dea-4e51-9288-ff11ee8e89e7@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 09:12:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5452

Hi Michael,

Thanks a lot for this review and the others, I'm currently editing a v3 that
takes your remarks into account.

On 09/10/2024 16:18:13+0000, Michael Opdenacker wrote:
> See the style guide for project names:
> https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n79
> I know that the style is not very strictly enforced in release notes. This
> is not exactly like formal documentation.
>
> It's up to you. It's not a big deal if you don't change these. The same
> applies to the following lines...

Even if not enforced in the release note, I believe it's a good thing to take
the habit of following the standards… I will probably write more docs elsewhere,
so thanks for your reviews, they're really valuable :)

> > +   -  New :ref:`nospdx` class that allows recipes to opt out of generating SPDX.
>
> Are you sure this works? Looking at your earlier patch, shouldn't it be
> :ref:`ref-classes-nospdx` instead?
>
> > +
> > +   -  New :ref:`Vex` class generates the minimum information that is necessary
> > +      for VEX generation by an external CVE checking tool.
> > +
> > +   -  New :ref:`retain` class creates a tarball of the work directory for a recipe
> > +      when one of its tasks fails, or any other nominated directories.
> > +
> > +   -  New :ref:`localpkgfeed` class in meta-selftest to create a subset of the
> > +      package feed that just contain the packages depended on by this recipe.
>
>
> Same comment for the above three items.
> That's all here ;)

Actually, this is a bit misleading because I did in fact fix this in the next
commit - otherwise no, it wouldn't work. This should've been part of the first
one from Chee Lee Yang (amended by myself). Will do in v3.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

