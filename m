Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB88C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:03:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5118.1783505030600827634
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FiiYlOlU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83ABA1A0EDA
	for <docs@lists.yoctoproject.org>; Wed,  8 Jul 2026 10:03:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58B2360339;
	Wed,  8 Jul 2026 10:03:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B22811BC31A3;
	Wed,  8 Jul 2026 12:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PXlEAaVpuFpHamg54a3rXyFM5iELa/3Ydsu5O92DlOM=;
	b=FiiYlOlU582rqw7Kvm9S9Z/6Qp5rKbbA+z6IDn3zcIdwkEOL67kbGffOMcNLqwuqbduwGJ
	nBZ0YZX894odqyWT1yBL1pKL+yaOsUqusf60kr6WhfTV8rSHxaOfhVFa+RfxowCcBMAgM0
	DBvC6M9jlab0I6IdDImehECM5NI8Btl9dYUKIvqyU/lJNiSHLFtjw/wlJBH/pvb2pHEzV3
	bBL+tBTNe2pW8ZdJZiGHiyftU5m70TDQ7/JHctRQOCbB8yg6MeEt14gXaq9PZTODL0RwaX
	ZPDPNXirWGPjJq3EF+g7ce3yY/eN2Qzu068+5lRo/r0tHr2ajWMNR0gDcTgghQ==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 12:03:46 +0200
Message-Id: <DJT3RMDK1H4Z.2CCWEJB3VWC1L@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH RFC 0/6] Generate documentation links for OE-Core
 (cover letter only)
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
 <d7cfcd90-05b0-4694-9b37-8bd7ac5fa029@cherry.de>
In-Reply-To: <d7cfcd90-05b0-4694-9b37-8bd7ac5fa029@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10041

Hi,

On Mon Jul 6, 2026 at 3:01 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 7/3/26 5:07 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> [I have pushed this here for now:
>>   https://git.yoctoproject.org/yocto-docs/log/?h=3Dcontrib/agodard/b4/ge=
n-doc-links
>>=20
>>   Not sent to mailing list as patches are quite big.]
>>=20
>> The purpose of this series is to make links to yocto-docs accessible
>> from OE-Core through a doclink flag, making the overall documentation
>> more accessible. This link can be shown with:
>>=20
>>    $ bitbake-getvar do_install --value -f doclink
>>    https://docs.yoctoproject.org/blacksail/ref-manual/tasks.html#term-do=
_install
>>    $ bitbake-getvar S --value -f doclink
>>    https://docs.yoctoproject.org/blacksail/ref-manual/variables.html#ter=
m-S
>>=20
>> This is made possible through a file generated automatically, which
>> contains assignments such as:
>>=20
>> S[doclink] =3D 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}=
/ref-manual/variables.html#term-S'
>> do_install[doclink] =3D 'https://docs.yoctoproject.org/${LAYERSERIES_COM=
PAT_core}/ref-manual/tasks.html#term-do_install'
>>=20
>> This can be used in projects that want to point to documentation, like
>> Toaster.
>>=20
>> This could also be included automatically from OE-Core's bitbake.conf wi=
th:
>>=20
>>    # Default path to yocto-docs, assuming it is next to the openembedded=
-core
>>    # repository, as would be provided by bitbake-setup.
>>    YOCTO_DOCS_DIR ??=3D "${COREBASE}/../yocto-docs"
>>=20
>>    include ${YOCTO_DOCS_DIR}/documentation/oecore/doclinks.conf
>>=20
>> The main point for this is to make documentation for variables easily
>> accessible, with the hope that this would also encourage people to
>> contribute to documentation more as it would create a bridge between
>> OE-Core and yocto-docs.
>>=20
>> This is more of an idea than anything though, comments on whether you
>> think this would be useful are welcome!
>>=20
>
> I've barely looked at it but the first question I had when looking at=20
> this was "why a file per variable in the glossary?" and the few commits=
=20
> I had a look at in the RFC branch don't really say. I think you may have=
=20
> wanted to generate a list of variables that are in the glossary and=20
> parsing Sphinx is a bit overkill, so just looking for files in a=20
> specific directory would be easier? There are three issues with this=20
> logic, first, we would need to do this for older releases which is=20
> time-consuming and error-prone (I guess you probably wrote a script to=20
> do it, so maybe not that much), second, it may become outdated, third,=20
> you need access to the docs locally.
>
> Have you considering simply getting the objects.inv file generated by=20
> Sphinx and available at docs.yoctoproject.org/objects.inv?
>
> python -m sphinx.ext.intersphinx https://docs.yoctoproject.org/objects.in=
v
>
> will give you something interesting.

It looks like a great fit for this indeed. My only concern is that this
is built after running a Sphinx build. So depending on this file to generat=
e a
configuration file that we maintain in yocto-docs means we depend on buildi=
ng
the documentation to generate a source file. This is fine, but originally I=
 had
a pre-commit hook that would check whether this doclinks.conf would require
updating, and now this hook would require the documentation to be built to =
run.

Anyway, I did a bit of playing with the inventory and I was able to generat=
e the
same file (doclinks.conf) using it and sphinx.util.inventory's InventoryFil=
e
class (the one used internally by the intersphinx extension).

> With this, you don't need to keep
> updating your docs and be sure it's up to date, you just download what=20
> you need (we have objects.inv for each release I believe), you don't=20
> need to migrate any docs release as we already have it (Dunfell has one=
=20
> for example). The downside is that if you want to do this locally=20
> instead of remotely fetching the file you then need to compile the docs=
=20
> instead of just fetching the source code for the docs. The intersphinx co=
de is
> in the Sphinx source tree, so we can always adapt it to generate whatever=
 we
> need if this isn't 100% matching what you want to do.
>
> You could even add a link to the bitbake docs as well since we also have=
=20
> an objects.inv for it.

Good point, I think what might work is make BitBake's variable definitions
override the ones from yocto-docs, since we generally "document" BitBake
variables in yocto-docs with "See :term:`bitbake:<var>` in the BitBake manu=
al."

> And you could probably also adapt it for other=20
> things, like documentation for a task since we do have links for each=20
> task in the docs. Also qa-checks, etc...

Yes, actually, my branch also covers tasks right now, but QA-checks might b=
e
worth looking into as well.

Thanks!
Antonin

