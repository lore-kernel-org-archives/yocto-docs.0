Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.14545.1630314009490230261
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 02:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=fgp/hbmm;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630314009;
  x=1661850009;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pQCcD7/UtDJqClh1wdLmXdycD9AmFhxRqm3Yi7foNyg=;
  b=fgp/hbmmF6dKWNypy1Qipjqsb3+6XFt7xHupnL2M40WNO1PBq9N9vUdC
   BH/GShSiqd4tMXBE/YTY41a9Oo6Qw3AEh8Bdj4DTMo2b366Fa49NIPhBq
   NeckLgXwQY6vNj0VsQyxxnLf/I4t5TmyiVKK7FYTQt5ovADo7iQfnApP2
   YxECp+HSz09rRHbvGB3ML589YlTGgWEaZWEWhEDvc6wk60bCLkRm92AlP
   PPZ3RhKrVTkEm2SLmVVa9+FB+hG9Q8KhygCSuv8jy5zydsysbZs7srRQI
   XWkDkG75xAcpoMT0sqaIgJKURQIL+UfUTuTnsbsAaXvO77PaBpEMq/7kR
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, "Robert P. J. Day"
	<rpjday@crashcourse.ca>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] confusing note in dev manual about search order for layers
Thread-Topic: [docs] confusing note in dev manual about search order for
 layers
Thread-Index: AQHXnNTHjmMO3sEv7UGsDUYIxklopKuLiccAgAAxQJA=
Date: Mon, 30 Aug 2021 09:00:06 +0000
Message-ID: <f9f53d0a5c3f4958be0d9396f11b4a72@axis.com>
References: <ae36061-5fc8-6dde-cf3c-f939fcf983c0@crashcourse.ca>
 <20210830074146.kspdnxugobsuznzn@fedora>
In-Reply-To: <20210830074146.kspdnxugobsuznzn@fedora>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Quentin Schulz
> Sent: den 30 augusti 2021 09:42
> To: Robert P. J. Day <rpjday@crashcourse.ca>
> Cc: YP docs mailing list <docs@lists.yoctoproject.org>
> Subject: Re: [docs] confusing note in dev manual about search order for
> layers
>=20
> Hi Robert,
>=20
> On Sun, Aug 29, 2021 at 08:52:42AM -0400, Robert P. J. Day wrote:
> >
> >   in section 3.1.9 of dev manual:
> >
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__docs.yoctoproject.org_dev-2Dmanual_common-2Dtasks.html-23adding-2Da-
> 2Dlayer-2Dusing-2Dthe-2Dbitbake-2Dlayers-
> 2Dscript&d=3DDwIBAg&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5y=
mA1XTSq
> HGq8yBP6m6qZZ4njZguQhZhkI_-
> 172IIy1t&m=3DmVZiXFV_cVQVdgl1QOxle8X44ftmg_wTdRhHpubvgnI&s=3D5pEBxWBXxmuU=
iL2gZ
> v_9GyOl4bi2YEQSOwhj70Kxt9A&e=3D
> >
> > one reads the note:
> >
> > "During a build, the OpenEmbedded build system looks in the layers
> > from the top of the list down to the bottom in that order."
> >
> > ok, except it's not at all clear what the consequence of that is.
> > looks for what? what is the significance of that search order to the
> > developer?
> >
>=20
> My guess:
> All layer.conf are parsed in the order specified in bblayers.conf. This
> includes specifically BBPATH, to which layers usually append to with .=3D=
.
> This variable defines the layer precedence for classes and conf files (e.=
g.
> distro, machine, others?) selection when there's name conflict.
> Apparently it is used for require/include with "relative-to-layer-root"
> path (as opposed to "relative-to-recipe-file" path) too from what I read
> on IRC.
>=20
> Hope this helps and is not too far from the truth :)
> Cheers,
> Quentin

If you want bitbake to find configuration files etc as per Quentin's=20
description above in the same order as it applies bbappend files, then=20
you need to list the layers in bblayers.conf in reverse priority=20
according to BBFILE_PRIORITY. This is because BBFILES is searched=20
according to BBFILE_PRIORITY, whereas BBPATH is searched from left to=20
right. I.e., the layers in bblayers.conf should look something like this
if you use poky and some openembedded layers:

BBLAYERS ?=3D " \
  .../meta-mylayer \
  .../meta-webserver \
  .../meta-multimedia \
  .../meta-filesystems \
  .../meta-networking \
  .../meta-python \
  .../meta-oe \
  .../meta-poky \
  .../meta \
  "

The only exception to this that I know about is meta-poky, which for=20
unknown reasons uses =3D. instead of .=3D when it adds itself to BBPATH.=20
This makes it very hard to exactly match the ordering, but as long as=20
you don't need to override poky-sanity.bbclass in your own layer, this=20
is normally not a problem.

//Peter

