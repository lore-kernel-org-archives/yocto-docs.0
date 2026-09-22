Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626D3C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:20:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8779.1790079607385351879
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AvadevwA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B21BB4E41029;
	Tue, 22 Sep 2026 12:20:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F38760580;
	Tue, 22 Sep 2026 12:20:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E90810329115;
	Tue, 22 Sep 2026 14:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790079600; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ewp+K8HeamjwkqnsIh4OuLoeldAZ4Gq0ac/TMH/ltfs=;
	b=AvadevwAxGcaOEGbmOWAvwOrI6kZhz8O3pgfsOIlqBkfxLohSVrOkiHnrPvy927igVrCrA
	Hdi4RQNDb5rIUU6CISGWHDVbrU9K1jQwfPBuDuLI3YT3I5B9P/P+id3egkL3gEWaP3HSN9
	sfRm/bA89HI//XTLk3ASwpAUC888M/lpi+t8GzzN5YxKeiayOvsCdW60sSbNwNfREqv4p5
	xyyJEenAmLtxJ2aMHP0HUGdXteeCR4MaOleDFZrWg6jEBeCqu8XgB0WYSjhn/LSuFSwlBT
	Z7UqPpGyRGNiDQ4hAvKlZPJ7vP916wiKt91GLw2AehMQFW+tOvJ6TsbY/QF6xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:19:59 +0200
Message-Id: <DLLU9BGBPRP7.2N2XWEQWTHZ7I@bootlin.com>
Subject: Re: [docs] [PATCH 03/10] docs: show a prompt on commands the reader
 is meant to type
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-4-twoerner@gmail.com>
In-Reply-To: <20260922020339.481929-4-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10583

Hi,

On Tue Sep 22, 2026 at 4:03 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> Most command blocks in the manuals start their lines with "$", but a
> scattering of them do not, and those read as a file listing rather than
> as something to run. Give them the prompt the surrounding pages already
> use.
>
> Transcripts take a prompt on their opening line alone. Two things that
> matter only once a line is a command go with that: a bare "$" at the end,
> the prompt returning after the command finished, and a trailing "\" on a
> Windows path, which a shell reads as a continuation into the output.
>
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst  |  2 +-
>  .../contributor-guide/recipe-style-guide.rst  |  2 +-
>  .../contributor-guide/submit-changes.rst      | 60 +++++++++----------
>  .../dev-manual/creating-fragments.rst         |  4 +-
>  documentation/dev-manual/debugging.rst        |  1 -
>  documentation/dev-manual/devtool.rst          |  8 +--
>  documentation/dev-manual/disk-space.rst       |  4 +-
>  documentation/dev-manual/hashequivserver.rst  |  2 +-
>  .../dev-manual/limiting-resources.rst         |  2 +-
>  documentation/dev-manual/new-recipe.rst       |  6 +-
>  documentation/dev-manual/packages.rst         |  2 +-
>  .../dev-manual/python-development-shell.rst   |  1 -
>  documentation/dev-manual/qemu.rst             |  8 +--
>  documentation/dev-manual/start.rst            |  2 +-
>  documentation/dev-manual/wayland.rst          |  6 +-
>  documentation/kernel-dev/common.rst           |  3 -
>  .../migration-guides/migration-2.1.rst        |  4 +-
>  .../migration-guides/migration-2.5.rst        |  4 +-
>  .../migration-guides/migration-4.0.rst        |  2 +-
>  .../migration-guides/migration-5.3.rst        | 10 ++--
>  .../migration-guides/release-notes-4.2.rst    |  2 +-
>  .../migration-guides/release-notes-5.3.rst    |  2 +-
>  documentation/ref-manual/classes.rst          |  8 +--
>  .../ref-manual/devtool-reference.rst          |  2 -
>  documentation/ref-manual/fragments.rst        | 16 ++---
>  documentation/ref-manual/qa-checks.rst        |  4 +-
>  documentation/ref-manual/variables.rst        |  6 +-
>  .../test-manual/reproducible-builds.rst       |  2 +-
>  documentation/test-manual/runtime-testing.rst |  4 +-
>  29 files changed, 86 insertions(+), 93 deletions(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation=
/brief-yoctoprojectqs/index.rst
> index f7e4606f1f7b..e138df6c9351 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -373,7 +373,7 @@ layer>`:
> =20
>      First, clone the layer next to the other layers::
> =20
> -      git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/met=
a-raspberrypi ../layers/meta-raspberrypi
> +      $ git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/m=
eta-raspberrypi ../layers/meta-raspberrypi
> =20
>  #.  **Add Your Layer to the Layer Configuration File:** Before you can u=
se
>      it, you must add the layer and its dependencies to your :ref:`struct=
ure-build-conf-bblayers.conf`
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/doc=
umentation/contributor-guide/recipe-style-guide.rst
> index 84c6bb14e8b0..fe12a8e6d826 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -436,7 +436,7 @@ By default, patches created with ``git format-patch``=
 have a `Git` version signa
>  To avoid having a `Git` signature at the end of generated or updated pat=
ches,
>  you can use `Git` configuration settings::
> =20
> -   git config --global format.signature ""
> +   $ git config --global format.signature ""

I would take the opportunity to use the "console" lexer here, instead of us=
ing
the default one:

.. code-block:: console

   $ git config --global format.signature ""

Applies to patch 01/10 too, this one, and maybe the other patches.

Antonin

