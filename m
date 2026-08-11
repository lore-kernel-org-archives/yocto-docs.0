Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3BCC5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:20:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49676.1786436444176043983
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 01:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VHJHzxGv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso26987505e9.2
        for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 01:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786436442; x=1787041242; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k0AgbK/jcHrma0o9ahbxHFSlo2/9JSK/sNuT686SUHg=;
        b=VHJHzxGvalJ+0R20bvrv72WOiklBMEw+ga7Rs0+TGVCmLDLCaXGFCFAGN4nEWX5c0h
         Ckj+zpycBK8zLobmGUzWvqAOGtbw1MeBcF3JOwT3DHGjeGT4SsGrp8h1LUvNgiWcHRGW
         as3KiEMtk7I3M2KHMXiMn+SKjAZRWx9LKdIQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436442; x=1787041242;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0AgbK/jcHrma0o9ahbxHFSlo2/9JSK/sNuT686SUHg=;
        b=KgB1NtUY5I6Fq5oUXggjSyVlCupvvHw9ntT9dOpNbF9KnYO+SQuL6N+B7blSgJeMHp
         aHN2WBgbUWiBmpz8VUPyl+X6gDQ80YculIvKgAmB/89TugMPAHYl1raZGEmaRAOWINVa
         8OEnfFgj/gxIsOOCnN3HYwBXFcfqgyUrLFMnqq/TEvveRSyZ9Ph3DWL1sp79f6KUR2Dk
         o4bdc4YZnGQ/831l1gMGkAggE8GbgkTFu+NhqInqkfBzSNKBnslhXMgh/7LoHVkPAWyR
         OAFjpxra2+th5/yypvkZvzcCGfUQgpzLVWQDUPXsBl0BBnGWNTATJQaloL7dbYApMtvt
         68cA==
X-Forwarded-Encrypted: i=1; AHgh+Rrb9LO6BQMObKwCZ6ZwNvg6mVyDhTfKbd75xwH8qIJJ9pTK7iq+0M00xjKS8+E+LEXhOrOg@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxHqNJwmw4tVXFdDmB7cFG43cNdEg38anyh2iigv8xuBmSiSPYa
	nFywOSVynHUUZZeUy0vA9hpO9ZMVXsVpGz/gYtBjINLETQgObai2GwR+px6lp6ksqOc=
X-Gm-Gg: AR+sD13K//PxQ7Uu4ez8hnnyTe5btozQj2tejK84qlptLiQlUuACUlcYAtWOtHZ1l47
	IxEQJggX7iH4fyD1ZoksOK1HIZyhFp96mxbfhd3bnVy3BZsACuZ3bDKIosjfuyl8ivIPcPRumvD
	vRtrETk82EcGK8SB6AabBwauFTOxLf42UoCyKy5KKYwNQFhzd1639JxHcgK7GjxcUXDOi4vU0KE
	X9kFRd7cbOoR22l/BfEq3HhikCZYwPuNelyjcRBWn1GdKFnDDa630piFFDZib52hbLsdhh62uKQ
	panW5iP5+whXDF5Youn/fwMtZW+d0Cn/LRrkfb1IZakERc0KNgEXBpnLKrGND0P7ysy4e8v2Dch
	8z8WdVoetbUBA+mEO0JVX61WnreLV+BnidD7zuNGu2Iir/M3y0oDNQLT4QcjX8huQ6rOtED+14j
	zjjzvT9SyL6SSueVr3lno38ywO1WPOPHhhRQY/5mP/Sh8yQwWqhM0v8YVT5OimOMem8ttTbH2Bz
	QXDY8Za2yLL+Jr5if9Oyfk3X+LLqpDUkvv4Sj80H4nu3e16Jb1zFQ==
X-Received: by 2002:a05:600c:35c4:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-49978b37c8bmr28603515e9.11.1786436442216;
        Tue, 11 Aug 2026 01:20:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a? ([2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740c4a87sm48163695e9.5.2026.08.11.01.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:20:41 -0700 (PDT)
Message-ID: <ea4f44a7400e193bf4cd9b65d59e50b0593cf4b7.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] security-manual: Add information about how
 security is handled in builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Date: Tue, 11 Aug 2026 09:20:40 +0100
In-Reply-To: <DKLYGCFI5BZB.27DQCAPM6XT4F@bootlin.com>
References: <20260807164325.4083331-1-richard.purdie@linuxfoundation.org>
	 <DKLYGCFI5BZB.27DQCAPM6XT4F@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:20:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10248

On Tue, 2026-08-11 at 10:01 +0200, Antonin Godard wrote:
> On Fri Aug 7, 2026 at 6:43 PM CEST, Richard Purdie via lists.yoctoproject=
.org wrote:
> > We have no information about how security is handled within the builds
> > themselves. Start to document this.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0.../security-manual/build-security.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 41 +++++++++++++++++++
> > =C2=A0documentation/security-manual/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 42 insertions(+)
> > =C2=A0create mode 100644 documentation/security-manual/build-security.r=
st
> >=20
> > diff --git a/documentation/security-manual/build-security.rst b/documen=
tation/security-manual/build-security.rst
> > new file mode 100644
> > index 000000000..5f15d5f64
> > --- /dev/null
> > +++ b/documentation/security-manual/build-security.rst
> > @@ -0,0 +1,41 @@
> > +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> > +
> > +**************
> > +Build Security
>=20
> I suggest renaming it to "OpenEmbedded Build System Security", as "Build"=
 alone
> could be interpreted in many different ways, including builds for specifi=
c
> software components, etc.

Perhaps "Build Process Security"? I think build system isn't quit the
right thing here.

>=20
> > +**************
> > +
> > +OpenEmbedded is used to run the builds and careful consideration has g=
one into
>=20
> When you say "OpenEmbedded" I guess you mean the community? Or the build =
system?
>=20
> We have a :term:`OpenEmbedded Build System` that could be used here if re=
levant.

That seems like the right thing to use.

> > +how it does this with the aim of being both secure and reproducible. L=
ike any
> > +system, it does need to be used carefully and in keeping with the desi=
gn for
> > +that to be true. Users of the system should consider that:
> > +
> > +-=C2=A0 The builds generally aim for any input into the build process =
being verified in
> > +=C2=A0=C2=A0 some form. For source code tarballs, these would have a c=
hecksum. Git source
> > +=C2=A0=C2=A0 trees would have a specific git revision. Metadata would =
also usually be
> > +=C2=A0=C2=A0 under source control and also have revisions.
>=20
> Add a link to our fetching documentation here?
>=20
> """
> See the :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching` s=
ection
> of the BitBake User Manual for more information.
> """

Sure, I intended this as a first pass and figured it might need some
markup/tweaking. Sorry for the spelling :/.

>=20
> > +
> > +-=C2=A0 Some elements that can influence the build are not verified. I=
t is assumed
> > +=C2=A0=C2=A0 that the operating system running the system is secure an=
d of a known setup and
> > +=C2=A0=C2=A0 version. The system goes to signififant lengths to isolat=
e against host
> > +=C2=A0=C2=A0 contamination of the output but it is certainly possible,=
 especially malicously.
>=20
> typo: maliciously
>=20
> Link to our supported distros here?
>=20
> """
> See the :ref:`system-requirements-supported-distros` section of the Yocto
> Project Reference Manual for more information on supported host distribut=
ions.
> """
>=20
> > +
> > +-=C2=A0 The builds assume DL_DIR is a safe location. Once things enter=
 that location
>=20
> s/DL_DIR/:term:`DL_DIR`/
>=20
> > +=C2=A0=C2=A0 there are not repeatedly re-verified. A user could edit t=
he git trees or
> > +=C2=A0=C2=A0 tarballs there in ways the build might not detect.
>=20
> I guess this will be better detailed with
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16102. Maybe the docu=
mentation
> coming from this bug should be linked here then.

This text was intended to help close 16102 :/. We've not managed to get
anyone else to provide such information. Certainly if any more is
forthcoming, this would be the place to add it. I did want to document
something before we close that bug though.

Cheers,

Richard

