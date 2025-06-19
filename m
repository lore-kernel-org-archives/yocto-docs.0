Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3D7C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 09:13:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10679.1750324417179290829
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 02:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bnA/4sXA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41CBE43AFB;
	Thu, 19 Jun 2025 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750324415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cg4Dn0XPhNOWf/pMnM6FkP3VEbXn4j3/I6yRpIRTM90=;
	b=bnA/4sXAw+2yJpZcmrMalvWjdKGs/ysuLEVxK9Ee+oYp4tq3nZIl9NKVtjr2SfA3qOqGuT
	2tfPFcAr3kRJlsa5xWfu0fVEa/lX+n48hgTDDGaEmyWQeMreao1ngGlEDkYdKCvOsJoCvq
	ESBkrvsmpG3JVACo/eKvYy6gLNxZuRBePkw5VdFXpJIyvG65Y6TOHENN8WLlYQYHoATo0h
	AqGc9+WcYk8SK/nYD9w7UctJfEKTgKOfIV315OzDW2OXQgKxTW3JdcIxaoz3bO34hJYhro
	BhpDpwPKA/l4SGoGryk6kCTmvexKjYxe48U9mRQ8vEzFSviDHNklF9txEA35ig==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 11:13:34 +0200
Message-Id: <DAQE7ZMJGJP1.17C6FNYGWZM4J@bootlin.com>
Subject: Re: [docs] [PATCH] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <daniel.turull@ericsson.com>, <docs@lists.yoctoproject.org>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
References: <20250619085215.1942667-1-daniel.turull@ericsson.com>
In-Reply-To: <20250619085215.1942667-1-daniel.turull@ericsson.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurheptgffkffuhffvgfggfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelvdekvdeigfelkeevgffgheektdeijeevvddvgefhkedvudffveelfffgteefnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegurghnihgvlhdrthhurhhulhhlsegvrhhitghsshhonhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 09:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7108

On Thu Jun 19, 2025 at 10:52 AM CEST, Daniel Turull via lists.yoctoproject.=
org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Adding documentation for the new feature to store in SPDX
> only the compiled sources.
>
> Merged in Oe-core: c6a2f1fca76fae4c3ea471a0c63d0b453beea968
>  - spdx: add option to include only compiled sources
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  documentation/dev-manual/sbom.rst      |  3 +++
>  documentation/ref-manual/variables.rst | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual=
/sbom.rst
> index e6806ce92..ca0fc8b9d 100644
> --- a/documentation/dev-manual/sbom.rst
> +++ b/documentation/dev-manual/sbom.rst
> @@ -60,6 +60,9 @@ more information in the output :term:`SPDX` data:
>  -  Add a description of the source files used to generate host tools and=
 target
>     packages (:term:`SPDX_INCLUDE_SOURCES`)
> =20
> +-  Add a description of the **compiled** source files used to generate h=
ost tools
> +   and target packages (:term:`SPDX_INCLUDE_COMPILED_SOURCES`)
> +
>  -  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SO=
URCES`).
> =20
>  Though the toplevel :term:`SPDX` output is available in
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 5c18b852d..39a134a09 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8764,6 +8764,19 @@ system and gives an overview of their function and=
 contents.
>        image), compared to just using the :ref:`ref-classes-create-spdx` =
class
>        with no option.
> =20
> +   :term:`SPDX_INCLUDE_COMPILED_SOURCES`
> +      This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but in=
cluding
> +      only the sources used to compiled the host tools and the target pa=
ckages.

s/compiled/compile/

Reading the description of SPDX_INCLUDE_SOURCES:

  This option allows to add a description of the source files used to build
  the host tools and the target packages, to the ``spdx.json`` files in ...

The only difference seems to be "to build". Your description uses "to
compile"... so I don't really get the difference. Maybe bad phrasing in the
description of SPDX_INCLUDE_SOURCES? Can you clarify?

> +
> +      Enable this option as follows::
> +
> +         SPDX_INCLUDE_COMPILED_SOURCES =3D "1"
> +
> +      According to our tests on release master, building

'master' is not really a release. Can you simplify to "According to our tes=
ts,
building..."?

> +      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> +      this option compated with the :term:`SPDX_INCLUDE_SOURCES` reduces=
 the size

s/compated/compared/

> +      of the  ``tmp/deploy/spdx`` directory from 2GB to 1.6GB.
> +
>     :term:`SPDX_NAMESPACE_PREFIX`
>        This option could be used in order to change the prefix of ``spdxD=
ocument``
>        and the prefix of ``documentNamespace``. It is set by default to


Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


