Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1B3C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:19:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.53139.1747063170607407518
 for <docs@lists.yoctoproject.org>;
 Mon, 12 May 2025 08:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=noN7glDo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 415EB43955;
	Mon, 12 May 2025 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747063168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/0dNEWW/bIrMyaa+xkP2bR/b7LImvq/c8YYqpMrLAqQ=;
	b=noN7glDo4ife5G5k4ezdCioexy3ZrK37rBHBZ/bzjCEjw82p7nI8Hnx/LAs/d3F3xveXH1
	Qp3LKM4HRCQY9SpDBXl4COlMeviVrFzwxJZGq4VGrT+Ds+CmfThcXPtBMdc1tBLjdT3tCV
	aQX6kWKYfbG8+3FCLCAStaxtNUHx2zh2anHSu1pFb946MB0vtPQRX0W3xrxuGlJqi1j7qi
	iockf8gj0Z/rDfeQAE743NkOjJr6Hr8WAfnKjnurVtbqJf2OPvwR7Ek5HbQJU8iHtjlZ4N
	Qe/srD17MWBxrE2kzBmj7SOrjffvEjdE0APd4UZjsug2bN2w3kPEW4Ueafe5Zg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 17:19:27 +0200
Message-Id: <D9UA7FCAZQZK.283OGG31V6VIY@bootlin.com>
Subject: Re: [docs] [PATCH] conf.py: tweak SearchLanguage to be
 hyphen-friendly
Cc: <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250502203501.3364973-1-ejo@pengutronix.de>
In-Reply-To: <20250502203501.3364973-1-ejo@pengutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegvjhhosehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohephihotghtohesphgvn
 hhguhhtrhhonhhigidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6808

Hi Enrico,

On Fri May 2, 2025 at 10:35 PM CEST, Enrico J=C3=B6rns wrote:
> This modifies the default indexer split() and js splitQuery()
> methods to support searching for words with hyphens.
>
> While this might not be an ideal, rock-solid, or fully future-proof
> solution, it at least allows searching for strings that include hyphens,
> such as 'bitbake-layers', 'send-error-report', or 'oe-core'.
>
> Below is a bit more detailed explanation of the two modifications done:
>
> 1) The default split regex in the sphinx-doc SearchLanguage class is:
>
>    | _word_re =3D re.compile(r'\w+')
>
>    which we simply extend to include hyphens '-'.
>
>    This will result in a searchindex.js that contains words with hyphens,
>    too.
>
> 2) The 'searchtool.js' code notes for its splitQuery() implementation:
>
>    | /**
>    |  * Default splitQuery function. Can be overridden in ``sphinx.search=
`` with a
>    |  * custom function per language.
>    |  *
>    |  * The regular expression works by splitting the string on consecuti=
ve characters
>    |  * that are not Unicode letters, numbers, underscores, or emoji char=
acters.
>    |  * This is the same as ``\W+`` in Python, preserving the surrogate p=
air area.
>    |  */
>    | if (typeof splitQuery =3D=3D=3D "undefined") {
>    |   var splitQuery =3D (query) =3D> query
>    |       .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}]+/gu)
>    |       .filter(term =3D> term)  // remove remaining empty strings
>    | }
>
>    The hook for this is documented in the sphinx-docs 'SearchLanguage'
>    class.
>
>    |    .. attribute:: js_splitter_code
>    |
>    |       Return splitter function of JavaScript version.  The function =
should be
>    |       named as ``splitQuery``.  And it should take a string and retu=
rn list of
>    |       strings.
>    |
>    |       .. versionadded:: 3.0
>
>    We use this to define a simplified splitQuery() function with a split
>    argument that splits on empty spaces only.
>
> [YOCTO #14534]
>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  documentation/conf.py | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 2aceeb8e7..02397cd20 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -13,6 +13,7 @@
>  # documentation root, use os.path.abspath to make it absolute, like show=
n here.
>  #
>  import os
> +import re
>  import sys
>  import datetime
>  try:
> @@ -173,6 +174,26 @@ latex_elements =3D {
>      'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
>  }
> =20
> +
> +from sphinx.search import SearchLanguage
> +from sphinx.search import languages
> +class DashFriendlySearchLanguage(SearchLanguage):
> +    lang =3D 'en'
> +
> +    # Accept words that can include hyphens
> +    _word_re =3D re.compile(r'[\w-]+')
> +
> +    def split(self, input: str) -> list[str]:
> +        return self._word_re.findall(input)
> +
> +    js_splitter_code =3D """
> +function splitQuery(query) {
> +    return query.split(/\\s+/g).filter(term =3D> term.length > 0);
> +}
> +"""
> +
> +languages['en'] =3D DashFriendlySearchLanguage
> +
>  # Make the EPUB builder prefer PNG to SVG because of issues rendering In=
kscape SVG
>  from sphinx.builders.epub3 import Epub3Builder
>  Epub3Builder.supported_image_types =3D ['image/png', 'image/gif', 'image=
/jpeg']

This is nice thanks. I've tested it with "bitbake-layers" or "ide-sdk", and=
 it
gives me much better results.

The searchindex.js generated file grows from 936 bytes to 1180 bytes, I thi=
nk we
can live with that though - just an observation.

Also a side-note: last time I checked, the kernel documentation had the sam=
e
problem. Maybe a worthy contribution over there too?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

