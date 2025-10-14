Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09835CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:27:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.11202.1760434054450350435
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 02:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RPL/xsDY;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A053DC09F80;
	Tue, 14 Oct 2025 09:27:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D06C606EC;
	Tue, 14 Oct 2025 09:27:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66B56102F225D;
	Tue, 14 Oct 2025 11:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760434051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ydLvGi4QBcWIFZTT4Vgb5rAEuhLaZ1AR4EbludEQUBs=;
	b=RPL/xsDYsH1udYLwJ07ELi7+ovMzrqgQP26f2baYq1Azurde3o2NdzcIdNq+NhBllE07wC
	mQKnSYoaLAdJYVFjeCLRVBY7Aa7B3RkxXRIQtGuNtvNnGk0BMhsb+aFi62Cobs4X5MR0dh
	ZVlJhM5nFNv94VQTDfvee/Wwj75w9GgTIMx6Cq7yg46I7YtW4X6ww6WqT43nLLTSGislqo
	kQfuz4PpDKXfGD4bG/PqSFRtSGKBBpJcM5mMdcUlc4IhczHmEE4lMffcGEcB0pRYPh6djG
	wpPYVMDquWzbWLBe8JhCi9IPWgHxNagQSIFedCbsKTXcSJAygUTq9zZmLhCmeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 11:27:28 +0200
Message-Id: <DDHXSDDQ1EBG.5IL8Q984MU8S@bootlin.com>
Subject: Re: [docs] [PATCH v2 3/3] tools/build-docs-container: build in
 separate directory for each distro
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
References: <20251009-iid-file-v2-0-715d527457f0@cherry.de>
 <20251009-iid-file-v2-3-715d527457f0@cherry.de>
In-Reply-To: <20251009-iid-file-v2-3-715d527457f0@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Oct 2025 09:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7698

On Thu Oct 9, 2025 at 12:24 PM CEST, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> This allows to compare build output from different distros if necessary
> and make it easier to make sure we start building from a clean slate.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  documentation/tools/build-docs-container | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/documentation/tools/build-docs-container b/documentation/too=
ls/build-docs-container
> index 831d357fb..47320e182 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -60,6 +60,7 @@ main ()
>    fi
> =20
>    local image=3D"$1"
> +  local orig_image=3D$image
>    shift
> =20
>    OCI=3D$(which "$CONTAINERCMD")
> @@ -159,6 +160,7 @@ main ()
>      --volume=3D"$DOCS_DIR:/docs:rw"
>      --workdir=3D/docs
>      --security-opt label=3Ddisable
> +    --env BUILDDIR=3D"_build-$orig_image-$image_sha"

I think the idea is good for improving concurrency, however I think for
development it would be nice to keep _build the default. What about having
the following default behavior:

- Build in "_build-$orig_image-$image_sha"
- If "_build" does not exist _or_ is a symlink, create or replace a symlink=
 to
  "_build-$orig_image-$image_sha" from the previous step, named "_build"

    _build -> _build-$orig_image-$image_sha"

- If "_build" exists and is a directory, leave it untouched as it may be
  originating from another "regular" build.

Then:

- `make clean` removes "_build" and "_build-$orig_image-$image_sha" (when
  "_build-$orig_image-$image_sha" exists and _build is a symlink to it)

- We could maybe also have a "cleanall" (or name alike) that removes all th=
e
  _build* it finds, to clean everything up.

With this, additional runs with different SHAs will just stack next to this=
,
re-creating the symlink only when it is not a directory. This way, I know t=
hat
for any previous run of build-docs-container, I can open the "_build" symli=
nk
to get the latest output. Of course I need to be careful when running concu=
rrent
builds, but that is another use-case, a bit different from day-to-day
development IMO.

What do you think?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


