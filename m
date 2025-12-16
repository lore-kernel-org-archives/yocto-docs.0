Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36764D5CC8D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:10:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18148.1765876197897402836
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 01:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=10iOOf2+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 96A144E41C28;
	Tue, 16 Dec 2025 09:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A59B6072F;
	Tue, 16 Dec 2025 09:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EB6311942628;
	Tue, 16 Dec 2025 10:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765876194; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=31cGePORtc7JuaRzS4uuIjl/f/ZyTQatjz9tsiZaX4U=;
	b=10iOOf2+RIQjDphTBKhsp+2zPc3Lra/sbxvA7XUT927K0G1UZidwD4IIs6meSU5gPS797U
	wiVYuRjaAWBXoUHy5cEy23so+B7N+Z9BjKJGHP184F07DtdP3gpwb/uIuuNrL9n0JEbZWz
	91By0gN3Vg2NZLdOLFGvkeMG0CKfiIYDlR+IUWgQm1jenMoPylBgoy6KqEQnxr5DNR//HC
	Lj7XvG9uH89ySEhV0hhu+zgsUW7iENtoxhjTiZFIHf6hD6uKu9MqXJi8Pn7ddSI/qgnZFh
	BhdvtFjyfxF2GAz9n8rVCn8GgzVPMYjzblULSfK/PQTuBzZR09Yx9IQv0ERfIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:09:52 +0100
Message-Id: <DEZIV7OT5YSJ.2GQ6UQM0O1Y4O@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss+yocto@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251202-fix-make-multi-target-v2-1-7eea1d64cf6b@cherry.de>
 <b3fedc48-fb69-451d-ab52-f170be87d013@cherry.de>
In-Reply-To: <b3fedc48-fb69-451d-ab52-f170be87d013@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 09:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8277

Hi,

On Mon Dec 15, 2025 at 11:58 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 12/2/25 6:06 PM, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>=20
>> The sphinxcontrib.rsvgconverter plugin allows to generate a PDF or PNG
>> from an SVG.
>> This is what we already do manually via Make targets but it isn't good
>> enough.
>>=20
>> Sphinx generates a cache upon first parsing and stores it in a doctrees
>> directory. Sphinx claims that it can be shared between all builders[1].
>> For glob patterns in image or figure directives, Sphinx will look for
>> all possible matches in the source tree and store those in a
>> "candidates" map for each file, along with the associated mimetype. When
>> building, Sphinx will then look in this map to try to find a match in
>> the current builder's supported_image_types. If none is found, the build
>> will fail.
>>=20
>> The latexpdf (using the LaTeXBuilder) target does not support SVGs by
>> default[2]. We used Make to generate PDFs from them before generating
>> the doc PDF though (see PDFs variable and %.pdf in Makefile) and that
>> type is supported by default[2].
>>=20
>> The epub (via the Epub3Builder) target does support SVGs by default[3]
>> but we disabled their support in commit ff3876ca4910 ("conf.py: use PNG
>> first in EPUB output"). We used Make to generate PNGs from them before
>> generating the doc epub though (see PNGs variable and %.png in Makefile)
>> and that type is supported (c.f. Epub3Builder.supported_image_types in
>> our conf.py).
>>=20
>> The issue is that this is done transparently from Sphinx. When we
>> generate the PDFs or PNGs variants of the SVGs, we put them in-tree
>> directly along their source file. Then, when caching, Sphinx will find
>> both the source file and the appropriate variant. However, the cache
>> isn't updated if there are new files in the tree and the source rST
>> files aren't modified. So, the cache will not have its map updated and
>> we won't be able to find the new variant when building for a
>> non-SVG-compatible builder. Take the following scenario:
>>=20
>> - start from a clean source file (fresh clone or git clean -ffdx)
>> - build the html target (which supports SVGs by default[4])
>> - sphinx will find all the files in the source tree matching the glob
>>    pattern in ".. image:: test.*", in our case only an SVG since the PDF=
s
>>    and PNGs are only generated for the latexpdf and epub targets
>>    respectively. The cache will only store the path to the SVG file
>>    because it is the only source file that matches the glob,
>> - attempt to build the epub target (which doesn't support SVGs, only
>>    PNGs)
>> - Sphinx checks for the file to include for '.. image:: test.*' and
>>    finds an SVG in the cache map and then check the list of supported
>>    image types for the Epub3Builder and find that it doesn't support
>>    that. It cannot find anything satisfying the dependency and thus fail=
s
>>    to build.
>>=20
>> This scenario can easily be reproduced by running the `make all` command
>> since the html builder will be used first, then epub and finally
>> latexpdf.
>>=20
>> The `make publish` target works by chance, because the epub builder is
>> built first and will cache SVG + PNG for each glob, then the latexpdf
>> builder is built and supports PNGs so that's fine and then html, which
>> supports SVG as well.
>>=20
>> To fix this issue, we could simply always generate PDFs and PNGs of all
>> SVGs in the source tree, but this isn't ideal.
>>=20
>> Instead, let's use an ImageConverter from a Sphinx plugin. This allows
>> to map a plugin as being able to generate a file of type Y from a file
>> of type X. When Sphinx wants to build an image, it'll try to find the
>> image with the type the current builder supports in the cache. If it
>> cannot, it's going to try to find an ImageConverter plugin that is able
>> to convert one of the image types in cache with one of the image types
>> the current builder supports. Then Sphinx will call this plugin to
>> generate the file and put it into the build directory (not in the
>> source!).
>>=20
>> This allows to simplify the Makefile as well and is a much cleaner
>> approach.
>>=20
>> The epub target is removed as the catch-all target contains the same
>> instructions as the epub target we remove in this commit.
>>=20
>> sphinxcontrib.rsvgconverter is a plugin from
>> sphinxcontrib-svg2pdfconverter python module. SVGs to PNGs is only
>> supported since 2.0.0.
>>=20
>> [1] https://www.sphinx-doc.org/en/master/man/sphinx-build.html#cmdoption=
-sphinx-build-d
>> [2] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphin=
x.builders.latex.LaTeXBuilder.supported_image_types
>> [3] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphin=
x.builders.epub3.Epub3Builder.supported_image_types
>> [4] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphin=
x.builders.html.StandaloneHTMLBuilder
>>=20
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> This depends on
>> https://lore.kernel.org/openembedded-core/20251202-svg2pdf-v1-0-bf4bd322=
e528@cherry.de/
>> in OE-Core for still being able to build the docs with the
>> buildtools-docs-tarball SDK.
>
> This has merged as far as I could tell, c.f.=20
> https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/m=
eta/buildtools-docs-tarball.bb?id=3D056686eaf1a3a27f5e83537e5a1b7c837bc16fb=
9=20
> so this can now be freely reviewed and/or merged, thanks!

Sadly, I can't merge this until [1] is updated. I was waiting for 5.3 to re=
lease
to update this URL. The closest milestone that will include your new recipe=
 is
6.0M1. This will be available in https://downloads.yoctoproject.org/release=
s/yocto/milestones/.

So we'll have to delay this until this milestone, unless we manually hijack=
 a
custom built tarball before.

[1]: https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run=
-docs-build?id=3D0c0c7b41dea1b4f2da06bdf4cf4f7771ca33bcf7#n29

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


