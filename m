Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051D1C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 16:47:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.635.1743180445477486671
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 09:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ifcy/Bv7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso16744625e9.0
        for <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743180443; x=1743785243; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FTJNxhvmyUFtzH/2wTNpTUxlfb8Xd2Rw0f0Vk6PVoAE=;
        b=Ifcy/Bv7NT6l728btZSDYtMEDw0ktxJmFItfXyyIlyI9ihVLy6k0Kgbn3TB37nvzBQ
         HZwC+qpz6iOaDs9q8UMoBtvMyQL86Oh2Zy3TzdZ2E8s7QsCs9nBtf9GDMRdUQlHQbLQ5
         3/9yNn+ob/K8IcCPinMJdbLebiw5Nlwhp5sJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743180443; x=1743785243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTJNxhvmyUFtzH/2wTNpTUxlfb8Xd2Rw0f0Vk6PVoAE=;
        b=krq5uUXryoQTYm2AWQLMCQ213EBSn0KrI2ZI7HnA/Xi3Q279ZG5lz9y7cgmUI0JCmy
         hq4FwziAt8aumD9ksQdig5WfCuTwRpDadbP3UnwpSGnAF0hN1Cf1LRC/TqfvljbX+ugF
         WLbm9t1C3/thuSxrVpsAJiRaXUxWYmjbjse6hp5IT6kaKt5ICyXJn+5FYenQy/WXBYn8
         7BYngyzgHfQVRvlz6HC8xow6FDAV2I9pT1Deu6ydTYyk/iaKsst4ucNPTnpsVfXwwTXn
         V/1EIZoucrW35RThvmHfT6CfS+xk5StUTNp7g8Oh70761ZdAlWeNJszguJ8AthBlnLzn
         oxRw==
X-Forwarded-Encrypted: i=1; AJvYcCVSFHYDAo4v0lOwrViqJJHII484ZUpNL3r6MXw2hVsf9uKthikDQ5S8uE1//oOemxX86hnC@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx5OgEbohX129XQwne5d2L2hEJ5I1+ZY+zrM24U+NwmYDXJYw0L
	GWbecVcB03QSpMLcYRU/3DW6KqWYzok8A7/+VW+pTg3K/S9cuoOcDwdMFbDiqhs=
X-Gm-Gg: ASbGncuhGvearMVrKqD0dyvIT2T/Po3OCJOY0gRcPnw/qK8SnchWo4lfQXlWheMY/pm
	W2FVFqy0vd28YvYy8eLbW8WwlJhZUIBodMKZIiy8RNLgrPoaliacuFNMBuwLpsnUgxdcBvWtKeT
	sovxELT/C30F5YvghzXwY3FLN7zLwvOldnu3DjLCGMYNigBbW4POI/oOnH2de7nte57L0yTSmOJ
	m7thu6aETTLovXXluTm4mBlj3VVXidEev1ahN6SSaMBC0LNDFRQY5WNhtn4RtK2x5VXtdKKCDYk
	fl3uaCRTfw3ZqS/N7uFmAtm6IWMeAsnzvIEjnac3WoFMj+H+UwKCmlK+u2tkc/YlDgD2L42koff
	G/5NrAZfrmfVPF266WUaNNz863vrWhPboOpXCJXqrWQUo
X-Google-Smtp-Source: AGHT+IE3fBD4tduddAmfthQjJaEn5/ynnv+vbO6pUh8dJhn/2aB/Q60QIziHdFY4vhsoQ/0RTJAM/g==
X-Received: by 2002:a05:600c:1d1f:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43db6246ff4mr1796205e9.14.1743180443436;
        Fri, 28 Mar 2025 09:47:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d57:ea33:89bd:8b22? ([2001:8b0:aba:5f3c:8d57:ea33:89bd:8b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aeaasm3142145f8f.53.2025.03.28.09.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 09:47:22 -0700 (PDT)
Message-ID: <69ce733f89c726b7e673d399f215b8b6020deb15.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 11/11]
 migration-guides/{migration,release-note}-5.2: update for 5.2 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, antonin.godard@bootlin.com, 
	docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Mar 2025 16:47:22 +0000
In-Reply-To: <83f27b97-7352-469b-a6d2-975a32f59335@cherry.de>
References: 
	<20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
	 <20250328-release-note-5-2-updates-2-v1-11-c913513e9140@bootlin.com>
	 <83f27b97-7352-469b-a6d2-975a32f59335@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 16:47:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6680

On Fri, 2025-03-28 at 17:03 +0100, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> Hi Antonin,
>=20
> On 3/28/25 2:07 PM, Antonin Godard via lists.yoctoproject.org wrote:
> > Document changes between 0e91a1dabf27 ("adwaita-icon-theme: upgrade 47.=
0
> > -> 48.0") up to b3c21a23ad3a ("migration-guides/release-notes-5.2:
> > update for upcoming 5.2 release") in Poky.
> >=20
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> > =C2=A0 documentation/migration-guides/migration-5.2.rst=C2=A0=C2=A0 | 2=
6 ++++++++++++++++++++++
> > =C2=A0 .../migration-guides/release-notes-5.2.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 ++++++++++++++++++
> > =C2=A0 2 files changed, 48 insertions(+)
> >=20
> > diff --git a/documentation/migration-guides/migration-5.2.rst b/documen=
tation/migration-guides/migration-5.2.rst
> > index 59a2782f2..c54f054c7 100644
> > --- a/documentation/migration-guides/migration-5.2.rst
> > +++ b/documentation/migration-guides/migration-5.2.rst
> > @@ -178,6 +178,32 @@ This should now be replaced by::
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 UBOOT_ENTRYPOINT ?=3D "0x20008000"
> > =C2=A0=20
> > +
> > +Git fetcher: support for multiple revisions per URL removed
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The support for having multiple Git revisions per URL in :term:`SRC_UR=
I` was
> > +removed from BitBake, which means the following syntax is not supporte=
d
> > +anymore::
> > +
> > +=C2=A0=C2=A0 SRC_URI =3D "git://some.host/somepath;branch=3DbranchX,br=
anchY;name=3DnameX,nameY"
> > +=C2=A0=C2=A0 SRCREV_nameX =3D "xxxxxxxxxxxxxxxxxxxx"
> > +=C2=A0=C2=A0 SRCREV_nameY =3D "yyyyyyyyyyyyyyyyyyyy"
> > +
> > +This was rarely used in the core repositories, and this removal simpli=
fies the
> > +code logic in several places.
> > +
>=20
> Can we suggest the user how to transition away from that? What was this=
=20
> even supposed to do?

It would only have ever been useful with bare clones where there wasn't
a checkout. The only user I know of used to be the kernel recipe but
that no longer does this.

Cheers,

Richard

