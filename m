Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326B7C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 14:34:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50104.1790001280312821526
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 07:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aEcqkkgd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 189164E40EC4;
	Mon, 21 Sep 2026 14:34:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D666C5FFB2;
	Mon, 21 Sep 2026 14:34:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D512103291AC;
	Mon, 21 Sep 2026 16:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790001277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V9hNNl5DH0urEqWGUxO1pShfCCZB30RCBpfqUYCH+VY=;
	b=aEcqkkgdmOml227vMdc2bXS1ainAfjWP9iUh2hjr5KbqYJaPVLBZA7CcPSMRFGgSw+2Qm4
	za8V5HOjR6qUA5BQjnN05zk85pqF7qkGqiy76KMFLFdzUJ8YbvOPaIHFqYF7ae/LFTVPPq
	FbLPfxvGP9XxyQJSB6Bbi3TUSt89aogamui6JskoQZFLmZx8avPjx96HH81zSSE6DWl6kn
	Ce5vuyRMhX5SrUuPvQJ96naJ+oRD6Oumq3UNmHohSNpYePFWg2/vYF9ad9t8AqotIEVhY6
	G/PevOz+SClcKtxmaYC8MpOsDivHNRGpyvrs/kv4/aLTb+3k8FyKIui3X0dZNA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 16:34:35 +0200
Message-Id: <DLL2HTQFFELI.15X26RE9UVCZF@bootlin.com>
Subject: Re: [docs] [PATCH] docs: document the conventions used in the
 manuals
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
 <apWCaeB2azEgKMlK@localhost.localdomain>
 <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
 <aq4o7Zu-ILYDZnGw@localhost.localdomain>
In-Reply-To: <aq4o7Zu-ILYDZnGw@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 14:34:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10555

Hi,

On Sat Sep 19, 2026 at 8:17 AM CEST, Trevor Woerner wrote:
> On Mon 2026-09-14 @ 06:39:59 PM, Quentin Schulz wrote:
[...]
> having a
> prompt clearly shows what are commands to type and what is output. For
> the sake of uniformity I would rather not have code-block examples that
> have and others that don't have prompts.

I agree.

>
> As for the "what to copy" issue. Every code-block has a "copy" symbol
> that appears in the code-block when you hover over the code-block. If
> the code-block contains things to type with prompts and you click on the
> copy icon of a code-block, the commands are copied and the prompts are
> not. However, if the user highlights what to copy by clicking and
> dragging with the mouse, they will get both the commands as well as the
> prompts. However, that is configurable! It is possible to configure any
> code-block identified as console to not copy the prompts, even when
> clicked-and-dragged with the mouse.

Do you have a working solution for this?

[...]
> Having a "how to use this document" section would explain and codify it
> into our standards, as well as having an author-facing document that
> would give this as an expectation. Review would then be performed
> against these documents for consistency.

Rather than having a document included everywhere, I would rather have a
dedicated section for it in the docs so it is less invasive . It appears in=
 the
sidebar, so a user always sees it too (for HTML docs).

Here's what I have in mind (note the shorter title so it fits in the sideba=
r):

diff --git a/documentation/index.rst b/documentation/index.rst
index 4bfc40bef..72e51a445 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -116,3 +116,10 @@ Release notes and migration guides for the different Y=
octo Project releases.
    :hidden:
=20
    downloads
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Documentation Conventions
+   :hidden:
+
+   conventions
diff --git a/documentation/conventions.rst b/documentation/conventions.rst
new file mode 100644
index 000000000..65061d1a9
--- /dev/null
+++ b/documentation/conventions.rst
@@ -0,0 +1,18 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+Documentation Conventions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+Placeholders
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Text enclosed in angle brackets is a placeholder. Replace it, including th=
e
+brackets, with a value of your own:
+
+.. code-block:: none
+
+   SRCREV:pn-<recipe> =3D "${AUTOREV}"
+
+Here, ``<recipe>`` stands for the name of your recipe. A placeholder is
+never text to be copied as it stands, and an example containing one will
+not work until every placeholder in it has been replaced.
+
+...

Thanks,
Antonin

