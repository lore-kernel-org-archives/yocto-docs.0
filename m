Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22828C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 09:42:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.49489.1740994919849644866
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 01:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QlK91XVw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAE6643400;
	Mon,  3 Mar 2025 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740994918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMNrO637E1PBi0ssk2veiZk9KXYzBSfi9B3hL3NbKqQ=;
	b=QlK91XVw6K7wxKCwUoqtVfNgHAt/uVvL7oj6WR9ovavHyp4yFCv7dwnPB2G5g2oxsBtrdU
	OKVXIuWw8orCuu2qj5dRN2SXqqgSptDuSBrGzkLqdhkV+SKS0ITUqHl0MQBKWDVNGKgBPc
	aSgYAI5oqBrcW2uKXrhpdi7ZABlYkEZ8cU/Nfw0yxic/W6vhHparXfVZMWe3iWxX448WZj
	cnocbxiRnOpQ0LdczFuZ6+wAiOKdOpAhlIMhzBes3Koaz/XdK3aUCdnK44N5BU+w0FV9Xw
	FImvhhnPIDehk9tGdXLMOOe7fycltdq1NymAjr94Q45+TWSt9BRPzfC+Y53W3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Mar 2025 10:41:57 +0100
Message-Id: <D86J6VLG4A33.1ZMP03TCPVK7O@bootlin.com>
Subject: Re: [docs] [PATCH] release-notes-5.2.rst: add information about
 autotools changes
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ross.burton@arm.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250227143418.3523136-1-ross.burton@arm.com>
In-Reply-To: <20250227143418.3523136-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdekkeffffefheettdettdeugedvvdelfeffkeetgfdtiedukeehudfhhfeltdevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 09:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6474

Hi Ross,

On Thu Feb 27, 2025 at 3:34 PM CET, Ross Burton via lists.yoctoproject.org =
wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/migration-guides/release-notes-5.2.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docum=
entation/migration-guides/release-notes-5.2.rst
> index 417b202cd..75d860aff 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -299,6 +299,16 @@ New Features / Enhancements in |yocto-ver|
>        currently prints warning message for every unpatched CVE the
>        :ref:`ref-classes-cve-check` class finds.
> =20
> +-  :ref:`ref-classes-autotools` changes:
> +
> +   - Changes to how ``aclocal`` is invoked means that ``ACLOCALDIR`` and
> +     ``ACLOCALEXTRAPATH`` are no longer used.

Nit: this bullet and the next would need to be indented by 2.

> +
> +   - Directories containing m4 files are no longer found automatically a=
nd
> +     passed to ``autoreconf``. If a recipe fails to configure because it=
 cannot find
> +     m4 macros, then usually the solution is to set ``EXTRA_AUTORECONF +=
=3D "-I
> +     path/to/m4"`` in the recipe.
> +
>  -  New :term:`PACKAGECONFIG` options for individual recipes:
> =20
>        -  ``perf``: ``zstd``

I think this would fit better in the migration guide since this is potentia=
lly a
breaking change (documentation/migration-guides/migration-5.2.rst).

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

