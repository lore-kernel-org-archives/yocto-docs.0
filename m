Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EE9C61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 07:07:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16227.1787641669849370073
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 00:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xsKPzKvx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9E7761A1810;
	Tue, 25 Aug 2026 07:07:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71D25604C4;
	Tue, 25 Aug 2026 07:07:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1510211C79F70;
	Tue, 25 Aug 2026 09:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787641663; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KxyD4gc3SVgun1D35jsd7aAtR890CR8wzm2PQy3Szgc=;
	b=xsKPzKvxz8jP+XXhZM/yBjyWaZZRrAyQsrJ5bwGjT80L0UochMwDKgWaRFQegsZzLTSo7u
	ZkyUd+AMMu6V6Ki08vKkoyzDDXGUDzTt2YYhUqcYgmZ8kJnpHnQ3x6V33FLiq3ItaqL12k
	P/Np0rsqEGkYIm+vDqGwE722rt9qUQJr9eXofY/LsjmFKDzt6xySMbOK34Lx8V9eY6al6u
	AwqtjMbSBZRR5TgRzx52wuuRHBKRTTRcWc5FQwB/mQHA7VuUWjmI6xSrATpFjtDlSwD49Z
	wX80snyN/kbAFCrQlJ3sPjMNbseCQqH5JzHbgrhPhkfkPK9iQkuqwR/ZyE0Vjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 09:07:41 +0200
Message-Id: <DKXU2Y2J3H47.1TSOGHLLAVS2U@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Trevor Woerner"
 <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: request a rebuild to pick up Pygments 2.21.0
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <aozKcnogXKWfOiFA@localhost.localdomain>
 <53235180fe3e221ea8bd27c81afc4a35085226b7.camel@linuxfoundation.org>
In-Reply-To: <53235180fe3e221ea8bd27c81afc4a35085226b7.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 07:07:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10337

Hi,

On Tue Aug 25, 2026 at 8:36 AM CEST, Richard Purdie wrote:
> On Mon, 2026-08-24 at 18:49 -0400, Trevor Woerner wrote:
>> Could someone build buildtools-docs against current master and publish
>> the result?
>>=20
>> scripts/run-docs-build line 29 pins the docs toolchain to the
>> yocto-6.0_M2 tarball, which ships Pygments 2.19.2. The newest
>> published milestone, yocto-6.1_M2, has 2.20.0. OE-Core master carries
>> python3-pygments_2.21.0.bb.
>>=20
>> 2.21.0 is the release that added a BitBake lexer, so it is the first
>> version in which
>>=20
>> 	.. code-block:: bitbake
>>=20
>> does anything at all. I have a conversion of the BitBake snippets
>> in yocto-docs and the BitBake user manual ready to send, but on the
>> current toolchain every block would publish unhighlighted - and since
>> run-docs-build drops the Makefile's -W, silently.
>>=20
>> I've tested the change. run-docs-build feeds every BitBake docs branch
>> through $builddir/buildtools unconditionally, and yocto-docs from
>> scarthgap forward, so I built all of them twice - once with 2.19.2,
>> once with 2.21.0 - applying the same docs-build-patches and master-file
>> checkouts the script does:
>>=20
>> 	bitbake=C2=A0=C2=A0=C2=A0=C2=A0 1.46 through 2.18, and master=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14/14 identical
>> 	yocto-docs=C2=A0 scarthgap styhead walnascar whinlatter=C2=A0=C2=A0 4/4=
 identical
>>=20
>> 36 builds, same exit status, same warning count - zero warnings
>> throughout.
>
> How urgent is this? Could we do this as part of M3 and use the artefact
> from that release build?

I was planning on doing that.

I have a local copy and build setup that has an updated buildtools tarball =
with
the new version of Pygments. Trevor, if you want to send another version of=
 your
patch, I can review and test it locally.

Antonin

