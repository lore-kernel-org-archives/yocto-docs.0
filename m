Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B4BD16279
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:55:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.57176.1728917745105864460
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 07:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p1OW7Srl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F37FC0009;
	Mon, 14 Oct 2024 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728917743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIwRLKyl0vRE1+W8GB5tpKverfFx/vx4/e7jYo4Zx04=;
	b=p1OW7SrlW9YSRTNOIOHcOLTmd4OfBJBQPe/tvy+q5SrFl2ZGJY1qL3oJMjyl2g8O3Mm2Oz
	UYklPeEtTd8BKfMJmk2N58h8NRIKKkkynEqjfmLT61lpQjQNL/C7NERD0dSsvAAAaoFbJq
	/LBQyvvHOzryKEBGTsJwaMoT+vnMpZNDDzSoGfXQWWHZPdYW7TRKNDCYUTOnmZAPBGtkQV
	fj4qYejs4gjGsKlCMavSv+vZG0/l5Bm9aftLheeYrpyYdRwGBujla9e/aqo6I+dj9tEJZf
	wriumvOvGgPab2O/OZlLZ/s/RjbOcCRnCZxM3bZlkp1bYcFjzyR1FrIgq8PbUw==
Date: Mon, 14 Oct 2024 16:55:42 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v3 16/16] release-notes-5.1: update release note
 for styhead
Message-ID: <j2olgq2jxltxlguk4vykcjwpw3geuiqbjts37gfgrl3le7dmjf@gmajrxkbabhq>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
 <20241010-release-note-5-1-v3-16-2cef1a58f1ab@bootlin.com>
 <6aa1c0d3-e86a-405f-81af-2c68f3023bd2@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aa1c0d3-e86a-405f-81af-2c68f3023bd2@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 14:55:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5487

Hi Quentin,

Thanks for your reviews :)

On 14/10/2024 14:27:23+0000, Quentin Schulz wrote:
> > +-  wic Image Creator changes:
> > +
> > +   -  Add the ``truncate`` utility in :term:`HOSTTOOLS`, needed by some wic
> > +      commands.
> > +
>
> I think we should add the package that installs `truncate` to the required
> host tools in documentation/poky.yaml.in?
>
> https://pkgs.org/search/?q=truncate&on=files should help figuring out the
> required packages for each distro. I assume it may already been pulled in by
> other packages as a dependency, but better have it explicitly listed than
> relying on a dependency?

I have checked for the supported distro and truncate is always part of
coreutils, which should be shipped by default on these distro - maybe that's the
reason it wasn't added to that list? This should not only apply for truncate but
several programs part of HOSTTOOLS I think.

Doesn't hurt to add it to the list though.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

