Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A848C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:36:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.21011.1747910182971004124
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 03:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RrWN2Oui;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso77933045e9.1
        for <docs@lists.yoctoproject.org>; Thu, 22 May 2025 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747910181; x=1748514981; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTFzuzAoRW9V6IAGgeUYg9/aDNzsrfrhxBeOdg/bG8w=;
        b=RrWN2Oui1cmjwZyiJmqejrfNCA1xULo6Euad1x3ePTIikQz1a/F9Y+3ZFAoDy+L8+u
         zxieB7+gz/zp8h0EyK5sl9ZuE/hWWb286nC9Tx9+DgvxpdfuKbIabvKriMInHFJkCBew
         RI1HJNYRYpOGqkMJcQ9/IqHMkYH5ZiXQV609Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747910181; x=1748514981;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aTFzuzAoRW9V6IAGgeUYg9/aDNzsrfrhxBeOdg/bG8w=;
        b=lT6MDFuMg2+QG4pGQmkBikyedNYsniqsvqAHDwvlMoaCMxYnodT2KorHVny50w+Aum
         72yJD4T9uFKhGse+qAiuphpjEv5qB9WQnRfJTNg3o+SkawFbiN78pfu+HG+rXBfzz+iT
         7csuA9Cpw7cl3pgkSRlF2q3FJqBVsgypPz2WyG5jv9ON+vJ20jQGzbWTKCvy+HvWY299
         +GovssRpD1MlRutSok8vnaQUs9Z1pUe89+MdP0ZdN1YVC3hqUZ1onkj8VKnAg8BHDQdR
         4QelsSCXTLlg2wp9ubMRD+qvF/bcgKMr4dRtViJ+MnhPGR0gttyMQAnYJtFm7PiEEUsn
         3ZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUqO9CNQnuuUHcHrSIBTmrHHZEb6wsz9/vY5s3y6rnshJgvL/CTcDpf3QhAezpVz1GlJYiz@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxgjsOFyeqRa+91wpbVbEEUBmY5Qa60uRFxsmtM7fQ4R9sJPdUn
	sWelEPKy0iQLDWZrvFwbN/M2Ri22rDGPo/U8xt0JpzJi6pfjhNgc8bDcMUOTkg+iKvuopJpofFk
	KuZRj
X-Gm-Gg: ASbGncs++TRspwh+XslPKMFPqLqCU14YvDT34GC6e+ztE+CsAL7sh0lKBsXlfrUIEWz
	YlWKOjEM16e3/Q4emhwpTN25wg+Qwu1HwhSalO/hxu2bN6noEuNO0jlmGgHpz5BMHZDmWaqD9vH
	x+mcZsBG788r9X7K4zmJCc+8zoWByN+8gcjcoZUIukPEGVIENjXR944+/vEKr/hkHeoQpx+ZGm3
	gYNTjeZWAA8wEKWv22PeGR+9gsMZPrlUxsds4VmN9XXoNt+cE6BssQ8ZhdeSRs/8Ka45ScXjsMV
	l5Xe0zpJWR2gzeXJNa4elBq3pOZnlfj5lfihihbpaIe68GlQUw56DA9GNLQ/yrNxiv7Xf+vC87F
	M3XKr+jrCFau+7HahPN3P9JYuWPLEqGRBsOjSwRR2
X-Google-Smtp-Source: AGHT+IFY+GfuYSe+gbMnhxk2mV9nminZ+8cFhYjuPujSImtgtl+uXKTUXwD2YH50EfY+h82x72rNBw==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr267699175e9.15.1747910181050;
        Thu, 22 May 2025 03:36:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de? ([2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm102996615e9.22.2025.05.22.03.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:36:20 -0700 (PDT)
Message-ID: <50b432ab211b1634c09e693ea23dfec1872ca383.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 SSTATE_SKIP_CREATION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, ecordonnier@snap.com, 
	docs@lists.yoctoproject.org
Date: Thu, 22 May 2025 11:36:19 +0100
In-Reply-To: <DA2L8QNZB47I.27YDS1YIT9KMZ@bootlin.com>
References: <20250520123955.2341427-1-ecordonnier@snap.com>
	 <DA2L8QNZB47I.27YDS1YIT9KMZ@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 10:36:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6877

On Thu, 2025-05-22 at 11:39 +0200, Antonin Godard via lists.yoctoproject.or=
g wrote:
> Hi,
>=20
> Some suggestions and formatting related suggestions below.
>=20
> On Tue May 20, 2025 at 2:39 PM CEST, Etienne Cordonnier via lists.yoctopr=
oject.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >=20
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> > =C2=A0documentation/ref-manual/variables.rst | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref=
-manual/variables.rst
> > index 643a3e7ae..7d8e257b9 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -9049,6 +9049,12 @@ system and gives an overview of their function a=
nd contents.
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For details on the process, see th=
e :ref:`ref-classes-staging` class.
> > =C2=A0
> > +=C2=A0=C2=A0 :term:`SSTATE_SKIP_CREATION`
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_SKIP_CREATION variable will be u=
sed to skip creation of
>=20
> s/SSTATE_SKIP_CREATION/The :term:`SSTATE_SKIP_CREATION` variable/
> s/will be/can be/
> s/to skip creation/to skip the creation/
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sstate tarball files. It makes sense e.=
g. for image creation tasks as
>=20
> s/sstate/:ref:`shared state <overview-manual/concepts:shared state cache>=
`/
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tarring images and keeping them in ssta=
te would consume a lot of
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disk space.
>=20
> An example would be nice, such as:
>=20
> =C2=A0=C2=A0 SSTATE_SKIP_CREATION:task-image-complete =3D "1"
>=20
> > =C2=A0=C2=A0=C2=A0 :term:`STAGING_BASE_LIBDIR_NATIVE`
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the path to the ``/lib``=
 subdirectory of the sysroot
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directory for the build host.

I've really not wanted this one documented in the past as I've not
wanted people using it. The reason is the implications of it. I see the
use has grown in OE-Core to multiple classes now :(.

If we do add a doc, I'd suggest adding something along the lines of:

"""
In general it is not recommended to use this variable as missing sstate
artefacts adversely impact the build, particularly for entries in the
middle of dependency chains. The case it can make sense is where the
size and time costs of the artefact are similar to just running the
tasks. This generally only applies to end artefact output like images.
"""

Cheers,

Richard

