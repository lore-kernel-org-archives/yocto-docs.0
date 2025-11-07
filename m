Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A43CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:05:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.622.1762527893447885541
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 07:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cLP+/dj2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6EA514E41598;
	Fri,  7 Nov 2025 15:04:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4517B606A6;
	Fri,  7 Nov 2025 15:04:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB50811852873;
	Fri,  7 Nov 2025 16:04:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762527890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tyJGbh5/KAmFjKVWb1gtVa9za8TR+Y0XFMOHeZDgLjE=;
	b=cLP+/dj22ER5MmSzCLbimtRcQbWrMv/Zn5ibiSzbKRfWZsTsG4aIR00Z+W536/zzdSbd9h
	rl9TASq3vWFlLxXB1s7wt/Bp7qvLBKjW3RC56ML/NoNi70SKiK45B6cORBdvKzqMLVa+yG
	kG3keNrvGH3/x9AJHYlXQntSqhVQfnHaJFq9xvKm6+fMVQ4Evdv58No8K9rt0xgCEKIUsF
	FOyRr/VbA+I2gomwab6VtnExHNGA/paNqOInEFXBkeONi+f+FyCaDXA94AyZCKEN+3Fo96
	vjB1H2jsAguVZSm6Jk58/iMKZEUt4KypesZwuLr9HldQeE3pXJ1buFGvUveMEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 16:04:48 +0100
Message-Id: <DE2JZQ0TYUAH.3A1ZWC5RN5WER@bootlin.com>
Subject: Re: [docs] [PATCH RFC 3/3] convert SVGs to PDF and PNG using
 rsvgconverter plugin
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
References: <20251030-fix-make-multi-target-v1-0-213616ed1f0a@cherry.de>
 <20251030-fix-make-multi-target-v1-3-213616ed1f0a@cherry.de>
In-Reply-To: <20251030-fix-make-multi-target-v1-3-213616ed1f0a@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Nov 2025 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8016

Hi,

On Thu Oct 30, 2025 at 4:17 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The rsvgconverter plugin allows to generate a PDF or PNG from an SVG.
> This is what we already do manually via Make targets but it isn't good
> enough.
>
> Sphinx generates a cache upon first parsing and stores it in a doctrees
> directory. Sphinx claims that it can be shared between all builders[1].
> For glob patterns in image or figure directives, Sphinx will look for
> all possible matches in the source tree and store those in a
> "candidates" map for each file, along with the associated mimetype. When
> building, Sphinx will then look in this map to try to find a match in
> the current builder's supported_image_types. If none is found, the build
> will fail.
>
> The latexpdf (using the LaTeXBuilder) target does not support SVGs by
> default[2]. We used Make to generate PDFs from them before generating
> the doc PDF though (see PDFs variable and %.pdf in Makefile) and that
> type is supported by default[2].
>
> The epub (via the Epub3Builder) target does support SVGs by default[3]
> but we disabled their support in commit ff3876ca4910 ("conf.py: use PNG
> first in EPUB output"). We used Make to generate PNGs from them before
> generating the doc epub though (see PNGs variable and %.png in Makefile)
> and that type is supported (c.f. Epub3Builder.supported_image_types in
> our conf.py).
>
> The issue is that this is done transparently from Sphinx. When we
> generate the PDFs or PNGs variants of the SVGs, we put them in-tree
> directly along their source file. Then, when caching, Sphinx will find
> both the source file and the appropriate variant. However, the cache
> isn't updated if there are new files in the tree and the source rST
> files aren't modified. So, the cache will not have its map updated and
> we won't be able to find the new variant when building for a
> non-SVG-compatible builder. Take the following scenario:
>
> - start from a clean source file (fresh clone or git clean -ffdx)
> - build the html target (which supports SVGs by default[4])
> - sphinx will find all the files in the source tree matching the glob
>   pattern in ".. image:: test.*", in our case only an SVG since the PDFs
>   and PNGs are only generated for the latexpdf and epub targets
>   respectively. The cache will only store the path to the SVG file
>   because it is the only source file that matches the glob,
> - attempt to build the epub target (which doesn't support SVGs, only
>   PNGs)
> - Sphinx checks for the file to include for '.. image:: test.*' and
>   finds an SVG in the cache map and then check the list of supported
>   image types for the Epub3Builder and find that it doesn't support
>   that. It cannot find anything satisfying the dependency and thus fails
>   to build.
>
> This scenario can easily be reproduced by running the `make all` command
> since the html builder will be used first, then epub and finally
> latexpdf.
>
> The `make publish` target works by chance, because the epub builder is
> built first and will cache SVG + PNG for each glob, then the latexpdf
> builder is built and supports PNGs so that's fine and then html, which
> supports SVG as well.
>
> To fix this issue, we could simply always generate PDFs and PNGs of all
> SVGs in the source tree, but this isn't ideal.
>
> Instead, let's use an ImageConverter from a Sphinx plugin. This allows
> to map a plugin as being able to generate a file of type Y from a file
> of type X. When Sphinx wants to build an image, it'll try to find the
> image with the type the current builder supports in the cache. If it
> cannot, it's going to try to find an ImageConverter plugin that is able
> to convert one of the image types in cache with one of the image types
> the current builder supports. Then Sphinx will call this plugin to
> generate the file and put it into the build directory (not in the
> source!).
>
> This allows to simplify the Makefile as well and is a much cleaner
> approach.
>
> The epub target is removed as the catch-all target contains the same
> instructions as the epub target we remove in this commit.

So with your patch will the epub target include SVGs or PNGs? Apparently th=
ere
were issues rendering SVGs in EPUBs as per Michael's commit:

    conf.py: use PNG first in EPUB output

    SVG directly included in EPUB output has multiple issues,
    in particular font size and alignment ones (tested on two
    EPUB readers). Instead, using PNG, generated from SVG when available
    as the primary format for images. GIF and JPEG are fine too.

> Ideally, we shouldn't use our in-tree fork but the upstream project
> sphinxcontrib.rsvgconverter, though it currently only supports
> generating PDFs from SVGs and we also need PNGs. A merge request to add
> support for this is pending[5].

Are you willing to send a patch to OE-Core to add a recipe for it?

Otherwise: I'm all for using this instead of our Makefile rules, this is mu=
ch
cleaner.

But I can't say whether BSD / IANAL is fine to include in out repo though. =
I'd
rather have a recipe for it if possible! (possibly with your patch on top, =
if it
doesn't get applied?)

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


