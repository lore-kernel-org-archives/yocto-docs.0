Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9594BE9B26C
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:10:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21095.1771942239400979655
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 06:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pmRyKS5S;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A44124E41080
	for <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 14:10:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73D3C5FD9D;
	Tue, 24 Feb 2026 14:10:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 250E410368F56;
	Tue, 24 Feb 2026 15:10:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771942236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ufbtPkMMFPD9KFrPScJaXG8fI9UMrZv4XumEK67u4FM=;
	b=pmRyKS5SDH1AxHz3s+Mh8NPhTYs01FvcqnqJUZdsaivRmv+5uru51OE1xlX6j0trWXIBKp
	Ujbt+IeTTe0dHjKR3fEx056EBZzIbDtq0TJ+lS8ls8RURpukp017STJHPX0Ai2lEDOvbFz
	ouE78oygMJ/RxBO4omz3O2/f/r2wsV8DwYdxP5wTSD0MDIzbNIRN9j2H2Xyke1Jk06IyKS
	StHuD79LuY1tCA0mb0WM/pOViFmy4vP3v+oAtNaIW2ZMyUTMwiQ5f5f6e5wGJNMWxnwEEi
	pAfS7G238v61XzEYP7MUZvK2OOSs/IIyFp1J+noDSmNcmDo5QtVSr6TI1rZ3CQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 15:10:35 +0100
Message-Id: <DGN93LAGKN33.N7GHO5RYLFNG@bootlin.com>
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] variables.rst: expand explanation of RSUGGESTS
References: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca>
 <DGN78E65FUWN.2BTR1KCHXV2VN@bootlin.com>
 <1b69d976-4159-354d-a283-bd06bedef3b7@crashcourse.ca>
In-Reply-To: <1b69d976-4159-354d-a283-bd06bedef3b7@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 14:10:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8973

Hi,

On Tue Feb 24, 2026 at 1:55 PM CET, Robert P. J. Day wrote:
> On Tue, 24 Feb 2026, Antonin Godard via lists.yoctoproject.org wrote:
>
>> Hi,
>>
>> On Tue Feb 24, 2026 at 1:15 PM CET, Robert P. J. Day wrote:
>> >
>> > Add that the RSUGGESTS variable would be processed only by a
>> > supporting package manager when installing packages from a
>> > package feed.
>> >
>> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> >
>> > ---
>> >
>> > diff --git a/documentation/ref-manual/variables.rst
>> > b/documentation/ref-manual/variables.rst
>> > index 208b5e43d..92476d509 100644
>> > --- a/documentation/ref-manual/variables.rst
>> > +++ b/documentation/ref-manual/variables.rst
>> > @@ -8361,7 +8361,9 @@ system and gives an overview of their function a=
nd contents.
>> >     :term:`RSUGGESTS`
>> >        A list of additional packages that you can suggest for installa=
tion
>> >        by the package manager at the time a package is installed. Not =
all
>> > -      package managers support this functionality.
>> > +      package managers support this functionality. This feature takes=
 effect
>> > +      only when the package manager is being used to install packages=
 on
>> > +      the target system from a package feed.
>>
>> Could you add a link to the section explaining how to enable this?
>>
>> """
>> See the :ref:`dev-manual/packages:Using Runtime Package Management` sect=
ion of
>> the Yocto Project Development Tasks Manual for more information on the
>> package management feature.
>> """
>
>   oh, man, did this just open up a can of worms. if you check that
> section:
>
> https://docs.yoctoproject.org/dev-manual/packages.html#using-runtime-pack=
age-management
>
> it has no reference to RSUGGESTS, so sending readers there might be
> less than useful. so should some explanation of RSUGGESTS be added
> there to provide context?

Let's create a link in the variable definition as a first step, then you ca=
n
follow-up with a patch that improves this section, including the mention of
RSUGGESTS.

>   and when i scroll to the top of that chapter:
>
> https://docs.yoctoproject.org/dev-manual/packages.html#
>
> the first section, "Excluding Package from an Image", mentions
> PACKAGE_EXCLUDE, but does not mention using IMAGE_INSTALL:remove,
> which is definitely used in places i've run across. should that also
> be mentioned as a way to exclude packages?

IIRC, IMAGE_INSTALL acts on the list of packages fed to the package manager=
, while
PACKAGE_EXCLUDE will act on package manager specific options to exclude a
certain package from the image, *even if this package is not explicitly lis=
ted
in IMAGE_INSTALL*. I believe this is the crucial point.

However, this section should probably start by saying something like:

"""
If the IMAGE_INSTALL variable does not contain a package that you want to
exclude from your image, you can use one of the variables below to exclude =
it
from the image: ...
"""

>   and if so, then that operation should also be mentioned in the
> explanation for IMAGE_INSTALL:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-IMAGE_INSTAL=
L

As explained, those act on slightly different places, so not sure I would m=
ix
them up, but if you think it can fit, please propose a patch, I'd be happy =
to
review it.

Thanks,
Antonin

