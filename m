Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C097BCCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 12:32:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20468.1792153958153300087
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 05:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LZVMXqiu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72A9F1A1235
	for <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 370166075D;
	Fri, 16 Oct 2026 12:32:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B2B3103281F4;
	Fri, 16 Oct 2026 14:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792153955; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MudojuxkxoYmTw92ZQnIRzCuZHM9g7+yrvmpJ+gwKcY=;
	b=LZVMXqiunOiBChEeLW8IE47kPOoVZx7su43xeBhItwDAae7hk1MPLXwjc53zFEA9DzfjMQ
	+vhERRPyxfEjE45eE3mXB2WcdqXtS1hAUOoKI72vAeJ2r1wMtWTp/Gfr1d6x9TAJ6MXa/M
	6iuwWp2UpEJohRAK5xRwix+cm06fYltMwuDv/soROrSFakbKlzR4NpBIGtd8dtatOdn6mA
	gPHD9ldW2yI8muYo6dTlj7oG6obmKD3cXlQQIjMtqjijrpvqxaq23+ukt1xYvtuQrDKnjk
	jTB1bGiJwR8vtsNM2NV8+pBlaHfHAhKwU5BChJ9DlbM9hiKjJMJoNfzqpMee5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 14:32:35 +0200
Message-Id: <DM69K14H7PHO.1V7232UTXGEQ1@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3 3/4] dev-manual/devtool: add diagrams for the
 ide-sdk workflow and architecture
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20261015200726.2391599-1-adrian.freihofer@siemens.com>
 <20261015200726.2391599-4-adrian.freihofer@siemens.com>
In-Reply-To: <20261015200726.2391599-4-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10693

On Thu Oct 15, 2026 at 10:06 PM CEST, Adrian Freihofer via lists.yoctoproje=
ct.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Add three diagrams to the devtool ide-sdk section: a typical usage
> workflow, the architecture of the SDK/IDE relationship, and a variant
> of the architecture for the --nfs=3Drootfs-dbg mode.
>
> The diagrams are Mermaid (.mmd) flowcharts, kept as the maintainable
> source next to the pre-rendered SVGs that the documentation includes,
> so building the documentation needs no Mermaid tooling. The command to
> regenerate an SVG is documented at the top of each .mmd file. The
> Mermaid configuration in each .mmd follows the documentation SVG
> policy (GNOME HIG colors, Nimbus Roman 10pt text, rounded boxes, no
> shadows).
>
> Colors: blue for the SDK/build environment, purple for devtool-managed
> workspace/NFS directories, brown for the target device, orange for
> entry-point commands and green for editable/source elements.
>
> The images are scaled with the page width but never beyond their
> natural size, which is what the new max-natural-size CSS class is for.
> The text then stays at the intended size.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/dev-manual/devtool.rst          | 27 +++++-
>  .../figures/devtool-ide-sdk-architecture.mmd  | 84 +++++++++++++++++

I don't think it is necessary to keep the mmd files. As I said in v2, you c=
an
probably keep those as comments in the SVG, starting the SVG file with:

  <!--
     <your mmd content here...>
  -->
  <svg...

The problem with keeping the mmd is that some people may modify the SVGs
directly and the two files would become unsynced - and we recommend Inkscap=
e for
editing SVGs.

Also regarding the font, thanks for using Nimbus Roman, it is what the stan=
dards
file say. However I'm not sure why we should be limited to Nimbus *Roman*, =
as
serif fonts clearly don't look good to me in diagrams. I know this contradi=
cts
the standards file, but I think Nimbus Sans would look better here. If that=
's
ok, let's change the font to Nimbus Sans, and I'll adjust the standards.md =
file
later. Otherwise, I can do a pass on your diagrams after they're merged, la=
ter.

>  .../figures/devtool-ide-sdk-architecture.svg  |  1 +

For this diagram there's a typo: "(build directory) build artifacts)"

>  .../devtool-ide-sdk-nfs-architecture.mmd      | 89 +++++++++++++++++++
>  .../devtool-ide-sdk-nfs-architecture.svg      |  1 +
>  .../figures/devtool-ide-sdk-workflow.mmd      | 74 +++++++++++++++
>  .../figures/devtool-ide-sdk-workflow.svg      |  1 +
>  .../sphinx-static/theme_overrides.css         |  5 ++
>  8 files changed, 279 insertions(+), 3 deletions(-)
>  create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-arch=
itecture.mmd
>  create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-arch=
itecture.svg
>  create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-=
architecture.mmd
>  create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-=
architecture.svg
>  create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-work=
flow.mmd
>  create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-work=
flow.svg
>
> diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-man=
ual/devtool.rst
> index e182b427b..ba0435a46 100644
> --- a/documentation/dev-manual/devtool.rst
> +++ b/documentation/dev-manual/devtool.rst
> @@ -480,7 +480,14 @@ directly in the IDE, independently of ``devtool ide-=
sdk`` and without calling
>  configuration that points the IDE directly at the build tool, the
>  cross-toolchain and the debugger provided by the SDK. ``devtool ide-sdk`=
`
>  only needs to be re-run later on, e.g. if a recipe's dependencies or its
> -build configuration change.
> +build configuration change:
> +
> +.. image:: figures/devtool-ide-sdk-workflow.svg

You should do:

.. image:: figures/devtool-ide-sdk-workflow.*

instead as I believe this will make it possible to match other converted im=
age
type for other kinds of builds (ePUB, PDF). Applies throughout this patch.

> +   :width: 100%
> +   :align: center
> +   :class: max-natural-size
> +
> +.. centered:: Typical ``devtool ide-sdk`` use case

You can use the :caption: option of .. image:: I believe, instead. Applies
throughout this patch.

Thanks,
Antonin

