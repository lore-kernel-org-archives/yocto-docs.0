Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8445C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:30:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50090.1786437013193397061
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 01:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QAv5Suo4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 75A684E411B1;
	Tue, 11 Aug 2026 08:30:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45D266033C;
	Tue, 11 Aug 2026 08:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77F7611C4BBDF;
	Tue, 11 Aug 2026 10:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786436995; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rb62YebVkImFehjLccxwkffkpXNiZKyBC9cg4uRWEYI=;
	b=QAv5Suo46nqXncyhrvkydaRjw0WswP+KLYul/8GyWKKTlngBGO/baGBbGc4OLiFENVMje3
	wt9OpQJI4qPY+feJecI4m+FUSBpM70ye62fAqjdReF+0LxfP+L7ucPbcBgAdweJsfpe7fT
	MByx7EdvLap1C05SNGtmOfqc2hzaAnp3lGNp+fi9BMQN09r8eytf10yWq48dByC6RMQmeA
	O3km9J6rjv7+w9OXRNNldq7UxtGY5kHaUBrM8P7MS4ThQBIDjVm0c2zlr387YETvT5UFQz
	tNAYAt8a0vdATscfA3/u33g6WRVS8ai0lBesZeEALfNG0MvhV+39EPsEJbsOHw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 10:29:55 +0200
Message-Id: <DKLZ2A06Y7H5.1UDITK0RTXIS0@bootlin.com>
Subject: Re: [docs] [PATCH] security-manual: Add information about how
 security is handled in builds
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <docs@lists.yoctoproject.org>
References: <20260807164325.4083331-1-richard.purdie@linuxfoundation.org>
 <DKLYGCFI5BZB.27DQCAPM6XT4F@bootlin.com>
 <ea4f44a7400e193bf4cd9b65d59e50b0593cf4b7.camel@linuxfoundation.org>
In-Reply-To: <ea4f44a7400e193bf4cd9b65d59e50b0593cf4b7.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10250

Hi,

On Tue Aug 11, 2026 at 10:20 AM CEST, Richard Purdie wrote:
> On Tue, 2026-08-11 at 10:01 +0200, Antonin Godard wrote:
>> On Fri Aug 7, 2026 at 6:43 PM CEST, Richard Purdie via lists.yoctoprojec=
t.org wrote:
>> > We have no information about how security is handled within the builds
>> > themselves. Start to document this.
>> >=20
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>> > =C2=A0.../security-manual/build-security.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 41 +++++++++++++++++++
>> > =C2=A0documentation/security-manual/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
>> > =C2=A02 files changed, 42 insertions(+)
>> > =C2=A0create mode 100644 documentation/security-manual/build-security.=
rst
>> >=20
>> > diff --git a/documentation/security-manual/build-security.rst b/docume=
ntation/security-manual/build-security.rst
>> > new file mode 100644
>> > index 000000000..5f15d5f64
>> > --- /dev/null
>> > +++ b/documentation/security-manual/build-security.rst
>> > @@ -0,0 +1,41 @@
>> > +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> > +
>> > +**************
>> > +Build Security
>>=20
>> I suggest renaming it to "OpenEmbedded Build System Security", as "Build=
" alone
>> could be interpreted in many different ways, including builds for specif=
ic
>> software components, etc.
>
> Perhaps "Build Process Security"? I think build system isn't quit the
> right thing here.

Works for me :)

>>=20
>> > +**************
>> > +
>> > +OpenEmbedded is used to run the builds and careful consideration has =
gone into
>>=20
>> When you say "OpenEmbedded" I guess you mean the community? Or the build=
 system?
>>=20
>> We have a :term:`OpenEmbedded Build System` that could be used here if r=
elevant.
>
> That seems like the right thing to use.
>
>> > +how it does this with the aim of being both secure and reproducible. =
Like any
>> > +system, it does need to be used carefully and in keeping with the des=
ign for
>> > +that to be true. Users of the system should consider that:
>> > +
>> > +-=C2=A0 The builds generally aim for any input into the build process=
 being verified in
>> > +=C2=A0=C2=A0 some form. For source code tarballs, these would have a =
checksum. Git source
>> > +=C2=A0=C2=A0 trees would have a specific git revision. Metadata would=
 also usually be
>> > +=C2=A0=C2=A0 under source control and also have revisions.
>>=20
>> Add a link to our fetching documentation here?
>>=20
>> """
>> See the :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching` =
section
>> of the BitBake User Manual for more information.
>> """
>
> Sure, I intended this as a first pass and figured it might need some
> markup/tweaking. Sorry for the spelling :/.

No problem :)

>>=20
>> > +
>> > +-=C2=A0 Some elements that can influence the build are not verified. =
It is assumed
>> > +=C2=A0=C2=A0 that the operating system running the system is secure a=
nd of a known setup and
>> > +=C2=A0=C2=A0 version. The system goes to signififant lengths to isola=
te against host
>> > +=C2=A0=C2=A0 contamination of the output but it is certainly possible=
, especially malicously.
>>=20
>> typo: maliciously
>>=20
>> Link to our supported distros here?
>>=20
>> """
>> See the :ref:`system-requirements-supported-distros` section of the Yoct=
o
>> Project Reference Manual for more information on supported host distribu=
tions.
>> """
>>=20
>> > +
>> > +-=C2=A0 The builds assume DL_DIR is a safe location. Once things ente=
r that location
>>=20
>> s/DL_DIR/:term:`DL_DIR`/
>>=20
>> > +=C2=A0=C2=A0 there are not repeatedly re-verified. A user could edit =
the git trees or
>> > +=C2=A0=C2=A0 tarballs there in ways the build might not detect.
>>=20
>> I guess this will be better detailed with
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16102. Maybe the doc=
umentation
>> coming from this bug should be linked here then.
>
> This text was intended to help close 16102 :/. We've not managed to get
> anyone else to provide such information. Certainly if any more is
> forthcoming, this would be the place to add it. I did want to document
> something before we close that bug though.

Ah I see, ok, I guess that's already something and if someone comes up with=
 more
information about the subject then there's already a place in the docs wher=
e
that can be added.

Thanks,
Antonin

