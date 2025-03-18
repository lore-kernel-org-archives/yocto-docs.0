Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E39C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:08:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.6553.1742285294617434891
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 01:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Je4XaMFr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E01744453;
	Tue, 18 Mar 2025 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742285293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x85YGEGjaiVvhmbW6aV9c+pabal+s76V3gB8+RWBDuY=;
	b=Je4XaMFrmQj2KGcWopJ0I4M5VZZ5h6L61kwJ+tE1CW4T0uLlNlAqahGAwstLS49VneGq9b
	F9i0h5dO3DTG3ZKyTtFnoTgjq7eeHxPm56BKe3xV61P7j64C2kH4x0nBO15Ad5m39fijMv
	PmryKtiDOs+1rz/DnaXddi4VmGWPm9H8eQ+yvCZ7sRP1s1aUzQd8Hu26UOVMwCbprLUQ/i
	H8sEHVTz/Y8ANpfjD0Oltg/xHRIUpBUYAMDyLA+feDihndFVDqoqxXVw5MG7SFtzc6Vzx7
	Qu5LGX0HV58f3KHKTz4qcB0SuvWpC1/lxk0drsonI5cfwwA133yQgTLHDXQ4hA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Mar 2025 09:08:12 +0100
Message-Id: <D8J8L9OJVWQU.2W2AYKHMLC149@bootlin.com>
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: encourage
 patch version changelogs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-30-g1e234577c2bf-dirty
References: <20250318035605.1221-1-twoerner@gmail.com>
In-Reply-To: <20250318035605.1221-1-twoerner@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeduleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtkeekfffffeehtedttedtueegvddvleefffektefgtdeiudekheduhffhledtveenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 08:08:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6590

Hi Trevor,

On Tue Mar 18, 2025 at 4:56 AM CET, Trevor Woerner via lists.yoctoproject.o=
rg wrote:
> Add a section after the 'git format-patch' information encouraging develo=
pers
> to add patch version changelogs to their patch updates.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documen=
tation/contributor-guide/submit-changes.rst
> index 0675aac984cf..5ade6ba5cdef 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -776,6 +776,38 @@ argument to ``git format-patch`` with a version numb=
er::
> =20
>     git format-patch -v2 <ref-branch>
> =20
> +
> +After generating updated patches (v2, v3, and so on) via ``git

s/via/with/? (to use simpler phrasings)

> +format-patch``, ideally developers will add a patch version changelog
> +to each patch that describes what has changed between each revision of
> +the patch. Add patch version changelogs after the ``---`` marker in the
> +patch, indicating that this information is part of this patch, but is no=
t
> +suitable for inclusion in the commit message (i.e. the git history) itse=
lf.
> +Providing a patch version changelog makes it easier for maintainers and
> +reviewers to succinctly understand what changed in all versions of the
> +patch, without having to consult alternate sources of information, such =
as
> +searching through messages on a mailing list. For example::
> +
> +   <patch title>
> +
> +   <commit message>
> +
> +   <SoB/etc lines>

Maybe write "<Signed-off-by/other trailers>" so there is no doubt about the
meaning of SoB?

> +   ---
> +   changes in v4:
> +   - provide a clearer commit message
> +   - fix spelling mistakes
> +
> +   changes in v3:
> +   - replace func() to use other_func() instead
> +
> +   changes in v2:
> +   - added

"added return value check for func"?
to give a more concrete example

I think it would also be nice to also instrict to give the link to the prev=
ious
patch but that might go a bit too far if done manually each time.

> +   ---
> +   <diffstat output>
> +
> +   <unified diff>
> +
>  Lastly please ensure that you also test your revised changes. In particu=
lar
>  please don't just edit the patch file written out by ``git format-patch`=
` and
>  resend it.

Otherwise this looks good to me, these are simply suggestions.

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

