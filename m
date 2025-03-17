Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546B0C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:02:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.58331.1742230920685393051
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 10:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kftdbUp/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84DD44442C;
	Mon, 17 Mar 2025 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742230918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BebqtlOxnwej1g+azOcd5CQg44GIis5H2OPILqYCTn4=;
	b=kftdbUp/Zw8oORY6X/4SCDg1ezxChSDxCPFRThbHA9cu8Fdw8zBCsqM526hWpKW1dcfdYU
	PXbSl9Y5/gzFVSK8qCY7U4oOf+ljbhYwCezCJPBFeOXMcWBBi1skcYB1Lw1MwtiNf5v/KH
	BGuqwP+t6nIidhdCnD0qJZivl7d8RvQClnhx+ZmQ/Rp6kNF3PkprKU0n21B9tuxxSVl+0A
	K+IpRixHaLn7uV5QF8dK0Phqs387KaAxlOu3rEa3DX/76Qvj/kJt8vHiXrSPIisyxYNyrP
	8Godlww8FKxmHhmbOcHx0ZuK1kUKIjdQ4yVA57ATY5vQ4cWByifbEGuNEoHtDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 18:01:58 +0100
Message-Id: <D8IPBEJQM2F1.3PQZI1N1TTMJT@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/4] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-30-g1e234577c2bf-dirty
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
In-Reply-To: <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedttdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhveehhefhgeejkeegudeuiefgudeuuddvtdevvdejtdefveeiudeihfehgfdvkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhop
 hhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 17:02:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6583

On Mon Mar 17, 2025 at 5:03 PM CET, Antonin Godard via lists.yoctoproject.o=
rg wrote:
> These toolchain variables are used in a native context. Some of the
> BUILD_* variables missed documentation. Also, some of the base commands
> were also not there so document them (FC and READELF).
>
> Some of existing BUILD_* variable documentation were missing the note
> about their usage in a native context, so add it too so that all BUILD_*
> variables are documented the same way.
>
> [YOCTO #15719]
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/variables.rst | 107 +++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 861b04eaa..24b3f7db9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -985,6 +985,24 @@ system and gives an overview of their function and c=
ontents.
>        variable is a useful pointer in case a bug in the software being
>        built needs to be manually reported.
> =20
> +   :term:`BUILD_AR`
> +      Specifies the architecture-specific archiver for the build host,
> +      derived in part from :term:`BUILD_PREFIX`::
> +
> +         BUILD_AR =3D "${BUILD_PREFIX}ar"
> +
> +      When building in the ``-native`` context, :term:`AR` is set to the=
 value
> +      of this variable by default.
> +
> +   :term:`BUILD_AS`
> +      Specifies the architecture-specific assembler for the build host,
> +      derived in part from from :term:`BUILD_PREFIX`::
> +
> +         BUILD_AS =3D "${BUILD_PREFIX}ar"

Should be "${BUILD_PREFIX}as", will fix in v2.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

