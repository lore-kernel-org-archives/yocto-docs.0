Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3D3D16261
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:28:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.55077.1728912520907832266
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 06:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=boZXCBED;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5E1FFF80C;
	Mon, 14 Oct 2024 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728912519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o/GfHaa3me+o0xdARLjMTs2ZzI57p3AjVUAnX8FTu2Q=;
	b=boZXCBEDZTSAdrVivscDQnCXoDl3ct3tJ/VIz/uCfUbpIq4P7pb2RaFjbpADs5bmrhkj9d
	zRR8Xkvgl4ZlKC87UjmAs150a3Hmiv6/wOEtVC3MzBjdmMYAa6b6lx8gm1K+8bFUDpR8ri
	DclbdQ8UBywh1UV4lPNYawiK5t8pBiC7SabRzYTx8Is+EGKIzKmpaLXM7/P0Rss1sNHIfX
	84kvpv+juWZWiNsngEd8mWeuqb3EsWBC8yoIEx97zMN2piyBZELefw0g1sFY42IkNjbLdp
	XThYIFeyFw9gReMal85qHR2uHnlhPptxWHl6rC47bwOhpAXI57s2ganx+aZeQQ==
Date: Mon, 14 Oct 2024 15:28:38 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: quentin.schulz@cherry.de, docs <docs@lists.yoctoproject.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [docs] Docs build/workers need inkscape?
Message-ID: <jglhemyx5xw7c6oibghwm5lwijb7jqgqirbupjmw5vxtjm56vr@7imisregnwci>
References: <3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
 <6c969fd6-d6b9-41ce-9ed7-a5138414780c@cherry.de>
 <1d9c6e2c2cb42a4127e0eb1c1eefee9adc5de8f0.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9c6e2c2cb42a4127e0eb1c1eefee9adc5de8f0.camel@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 13:28:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5482

On 14/10/2024 11:47:17+0000, Richard Purdie wrote:
> > librsvg is Rust-based IIRC, so that adds up A LOT of build time to
> > generate the buildtools tarball.
>
> I think that ship has sailed...
>
> > For my company's user manual, we use rsvg-convert (which seems to be
> > coming from librsvg :) ).
>
> That could be easier for us to build rather than the whole of inkscape.

I don't think it's Rust-based, I was using librsvg2-2 which provides
rsvg-convert, and has the following dependencies on debian/ubuntu:

  libc6 (>= 2.34), libcairo-gobject2 (>= 1.10.0), libcairo2 (>= 1.15.12),
  libgcc-s1 (>= 4.2), libgdk-pixbuf-2.0-0 (>= 2.31.1), libglib2.0-0 (>= 2.50.0),
  libpango-1.0-0 (>= 1.45.5), libpangocairo-1.0-0 (>= 1.44.0), libxml2 (>= 2.9.0)

So yes, using rsvg-convert from this package would probably a lighter option
compared to inkscape. It's also what Sphinx uses to convert images using the
"sphinx.ext.imgconverter" extension (this would need to be double-checked though
I'm not sure) with its LaTeX builder, I believe.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

