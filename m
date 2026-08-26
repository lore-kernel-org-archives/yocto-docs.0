Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1683EC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 15:10:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14918.1787757031383067114
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 08:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Brjko66K;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4E72B1A1848;
	Wed, 26 Aug 2026 15:10:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22E42604EC;
	Wed, 26 Aug 2026 15:10:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA68111C78185;
	Wed, 26 Aug 2026 17:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787757028; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yiiWij8K3pK2kHpCLuCfT6Go43ZHm8FlMweU6i3GtBY=;
	b=Brjko66KrIZa/zaqZSjqhkPqdtOluBI9XUaZB6QjYEPArTaY9wRtiGBFw4rcSvfjapKRQZ
	q4nh5eh5vz8KyyIdgSJCrhcM3xXuLByroFFHwrTDUHQiEfT/B+DawEkSruI0zBLt6bU/G9
	lDdMtvtIGM3dIFCOBlVI6oR0/v1h5tm6IY9VgUYdHY1N5LWv/KNbuJi3oxVdaXLNhkDio6
	BhFZSwaUAHKtv7C5Kl0JFJMgjEqf5BISCCDCDUziMAMChnsIcTYBVUBeebUPzZMXjn1gep
	s6Sr28Wk0SukkJdtKqm23JT4qlkbmKc6o06u9BMtSrSGwwKmld3pIXeLibsc1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 17:10:26 +0200
Message-Id: <DKYYZ48110MA.28EKFR3DVIU9C@bootlin.com>
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <twoerner@gmail.com>,
 <docs@lists.yoctoproject.org>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <78a29634-d64c-48ed-a012-71fff5efcb75@cherry.de>
In-Reply-To: <78a29634-d64c-48ed-a012-71fff5efcb75@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 15:10:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10369

Hi,

On Wed Aug 26, 2026 at 4:34 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
>
>
> On 8/26/26 3:09 PM, Antonin Godard wrote:
[...]
>>> I think this is going the wrong direction. We should actually make
>>> explicit the language of every :: that is NOT to be understood as
>>> BitBake code and then make the default highlight language be BitBake.
>>=20
>> But then this might get forgotten? How about having the default highligh=
ted as
>> "none", and make _everything_ use explicit code-blocks?
>>=20
>
> """
> The direct benefit is the ability to still backport whatever needs to be=
=20
> backported without having to care about the highlight language being=20
> explicitly bitbake (which won't be available in every branch but master).
> """
>
> *exactly* the sentence after what you quoted.
>
> It's bound to happen someone will want to backport a patch with
>
> .. code-block:: bitbake
>
> Either we'll forget during review and it'll break the docs build, or we=
=20
> need to adapt each and every patch/commit for stable branches.
>
> I'm usually the one trying to add friction to processes, but I don't=20
> think the above is a good idea.
>
> I'm trying to avoid having code-blocks set to use the bitbake lexer so=20
> we can easily backport without having to care.

Our current active releases where we backport patches are Wrynose and Scart=
hgap.
Both use the same buildtools tarball on the Autobuilder, and contain the sa=
me
version of pygments, so backporting patches that use the bitbake lexer won'=
t be
an issue (from an Autobuilder perspective).

>> Sure, this is more efforts and review time, but also this is how other m=
arkup
>> languages work - like markdown, where by default (when using ```...```) =
no
>> syntax highlighting is done.
>> > This is maybe a more conservative approach but at least it doesn't=20
> leave room
>> for code blocks mistakenly highlighted with the bitbake lexer.
>>=20
>
> It's currently mistakenly highlighted in Python if it looks like Python=
=20
> to pygments (the default).
>
> It's the Yocto/Bitbake documentation, I'm assuming the overwhelming=20
> majority of code-blocks should be BitBake code.
>
> If you really want to require explicit lexers, then set
>
> highlight_language =3D "please_specify_the_highlight_language_for_this_bl=
ock"
>
> in conf.py and then everybody will have to set one.
>
> Again, if you explicitly use the bitbake lexer in master, you won't be=20
> able to backport those patches to stable branches easily. Or you'll need=
=20
> your users to update their build environments to use the new release of=
=20
> pygments.

We can add a requirement on pygments:

diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/docum=
entation/tools/host_packages_scripts/pip3_docs.sh
index 852845783..d7a983731 100644
--- a/documentation/tools/host_packages_scripts/pip3_docs.sh
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -1,3 +1,3 @@
 python3 -m venv --clear ./yocto-docs-venv
 . ./yocto-docs-venv/bin/activate
-python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 's=
phinxcontrib-svg2pdfconverter>=3D2.0.0'
+python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 's=
phinxcontrib-svg2pdfconverter>=3D2.0.0' 'pygments>=3D2.21.0'

And backport it to Wrynose/Scarthgap?

> Or maybe you want to write a custom bitbake lexer for stable=20
> branches that is an alias to the "default" (the default value of=20
> highlight_language) lexer, but only have it if the version of pygments=20
> doesn't contain a bitbake lexer already.

This could be an alternative, yes.

Quoting your other email (https://lore.kernel.org/r/66624f77-ae0d-4670-bd99=
-c6ea9d2b2a54@cherry.de):

> Sphinx explicitly states that Python will be tried and if there are
> highlights warnings, none will be used. c.f.
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.ht=
ml#showing-code-examples

This is interesting! If it behaves the same way with whatever highlight_lan=
guage
you set in conf.py, then this would be less of an issue I guess.

Thanks,
Antonin

