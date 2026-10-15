Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F219CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 10:22:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36631.1792059750351038642
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 03:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dtO0AT9p;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 224491A1238
	for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 10:22:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAEA560360;
	Thu, 15 Oct 2026 10:22:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0443B10328AF1;
	Thu, 15 Oct 2026 12:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792059746; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FLaAES9hInjO5LcFZEAxAJuhvYWEKTtKH2szJX591hc=;
	b=dtO0AT9pSBhf3zqJsuk10Lk+5iXKcQbMmq5eBMgmiKG89PXdina8SBpQcKUhN00wUlmkh3
	nIjHty5rNrrvzj2Sv0jzdknOWzvZtAzSlUnNit05Lw7T9QKJaOkCUwFFQ+uIcujwpa/9Xn
	ssl3vnDkoRTOIeNbbFP2RZwNjQAdg8hiDGDkmEykIu5/C8jcdtz2rTPHykNP3U4E6P2fsf
	eUaKvu6SnXqPqOfFcvcS/Ua/zaE+bzOG/6sHf0s2874UBb6myZHZGzVMTrZsXReY/55paI
	C0oN0DOci5z6NovJn29EQFfAtPWu8+30dJ6+9k6F2kXiG5SsnC/XLGsQL+H12A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 12:22:24 +0200
Message-Id: <DM5C5TBT30OI.3EQUXP8NURXR@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <adrian.freihofer@gmail.com>, <paul@pbarker.dev>, "AdrianF"
 <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 0/5] dev-manual/devtool: ide-sdk doc rewrite
 and Mermaid diagrams
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260924192929.907566-1-adrian.freihofer@siemens.com>
 <8e8a2198ffc43898045566b07fef83c011ad9697.camel@pbarker.dev>
 <52604c0a16ab13ed6ac8a567d7e22e731d164bf0.camel@gmail.com>
 <3464b875-0c8d-4f18-b2e2-24a333ebc817@cherry.de>
In-Reply-To: <3464b875-0c8d-4f18-b2e2-24a333ebc817@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 10:22:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10676

On Wed Sep 30, 2026 at 5:35 PM CEST, Quentin Schulz wrote:
>
>
> On 9/26/26 3:45 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
>> On Sat, 2026-09-26 at 14:21 +0100, Paul Barker via
>> lists.yoctoproject.org wrote:
>>> On Thu, 2026-09-24 at 21:29 +0200, AdrianF wrote:
>>>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>>>
>>>> Update the "devtool ide-sdk" section to reflect its current
>>>> behavior,
>>>> and fix outdated non-patch local file handling docs (5.1 change).
>>>>
>>>> Add the sphinxcontrib-mermaid Sphinx extension, add workflow/
>>>> architecture diagrams for "devtool ide-sdk", and convert the
>>>> existing
>>>> devtool add/modify/upgrade flow chart PNGs to Mermaid too.
>>>>
>>>> Diagrams render client-side via a CDN-hosted mermaid.js, so the
>>>> build
>>>> server needs no new dependency.
>>>
>>> Hi Adrian,
>>>
>>> Expecting clients to fetch the CDN-hosted mermaid.js breaks the
>>> ability
>>> to render the diagrams offline for local reading. We also generate
>>> PDF
>>> and ePub versions of the docs - would this change require CDN access
>>> to
>>> build those?
>>>
>>> We may be better carrying a minified copy of mermaid.js and setting
>>> mermaid_use_local [1].
>>>
>>> [1]:
>>> https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/#mermaid-us=
e-local
>>=20
>> Hi Paul
>>=20
>> That might be a good idea for the HTML case, but I was unsure how it
>> would work for PDF or EPUB outputs. It=E2=80=99s not possible to embed t=
he
>> dynamic Mermaid rendering engine directly into a PDF or EPUB file.
>>=20
>> For PDF and EPUB cases, the rendering needs to take place at Sphinx
>> build-time, which requires a JavaScript runtime on our build machines.
>> I had a quick chat with Antonin about this, and he mentioned that an
>> infrastructure change like this would need some evaluation.
>>=20
>> We can actually support both formats seamlessly using the
>> sphinxcontrib-mermaid extension along with mermaid-cli (mmdc):
>>=20
>>   * For HTML builds: Sphinx serves client-side JavaScript as planned,
>>     rendering diagrams in the reader's browser without extra build
>>     dependencies.
>
> Do we really want to require the user to run JavaScript to render "images=
"?
>
> I've very quickly checked our docs with NoScript enabled, the search=20
> doesn't work (but it tells you why) and the drop-down menu to select the=
=20
> version of the docs is gone as well but that isn't something essential I=
=20
> believe.
>
> Since it's possible to render images at build time, I think it'd make=20
> more sense to render them also for HTML, and it also gives us=20
> consistency in behavior with PDF/ePUB (and we would detect earlier if=20
> rendering is broken in the HTML variant, the one that I assume most=20
> people consume).

I agree, it would probably be more consistent to convert all mermaid diagra=
ms to
SVGs at build-time and just render them like other SVGs in the documentatio=
n.

>>   * For PDF / EPUB builds: Sphinx automatically uses mermaid-cli
>>     (@mermaid-js/mermaid-cli) behind the scenes during build-time to
>>     rasterize/convert Mermaid blocks into static SVG or PNG images,
>>     embedding them directly into the output document.
>>=20
>> On the infrastructure side, this requires adding Node.js and running
>> npm install -g @mermaid-js/mermaid-cli on the documentation build
>> runners/CI environment. Would this be feasible?
>>=20
> I think this means we need a recipe for mermaid-cli in OE-Core and have=
=20
> it installed in the buildtools-docs. This means we now have a critical=20
> package in OE-Core that uses NodeJS and the npm fetcher. We've recently=
=20
> re-enabled the NPM fetcher but it's been a liability before so not sure=
=20
> if the project would like to depend on that for building the docs. Maybe=
=20
> there are other alternatives (Python would likely be fine as we already=
=20
> depend on it for Sphinx and we already tell the user to install some=20
> packages via pip; for the rest, it would be *very* beneficial to have=20
> packages in *all* distros we support).

I agree, I doubt OE-Core would accept it.

I'm sorry Adrian, this hasn't gone quite as I hoped it would!

Well, I looked at the diagrams anyway and they look good. So, maybe you can
still convert them manually to SVGs for now, and include the mermaid code a=
s a
comment in the SVG itself? Not as fancy as converting them dynamically, but=
 at
least your work isn't lost and this series can make progress.

If possible, please try to follow our standards.md diagram guidelines[1]. A=
t
least the fonts, and possibly colors.

Hopefully this works for you :)

[1]: https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.m=
d#n173

Thanks,
Antonin

