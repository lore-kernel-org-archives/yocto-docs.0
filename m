Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10D7C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:19:36 +0000 (UTC)
Subject: Re: [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES variable
To: docs@lists.yoctoproject.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (223.233.84.162)
X-Originating-Platform: Windows Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 06:19:33 -0700
References: <DAPOERTPGVZQ.1S2ZZBVVMS1N6@bootlin.com>
In-Reply-To: <DAPOERTPGVZQ.1S2ZZBVVMS1N6@bootlin.com>
Message-ID: <26140.1750252773043231023@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="iiheycoOlOLmP5rmGsCD"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 13:19:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7099

--iiheycoOlOLmP5rmGsCD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 06:30 PM, Antonin Godard wrote:

>=20
> On Wed Jun 18, 2025 at 2:14 PM CEST, Dixit Parmar via
> lists.yoctoproject.org wrote:
>=20
>> Will fix the ref->term typo and the take your suggestion on rewording.
>>=20
>> There seem to be confusion related to the kernel package name, however I
>> feel
>> it was additional information. I shall remove the mention of the kernel
>> package name (keep the variable reference only) for simplicity in next
>> version.
>=20
> Looking forward to it!
>=20
>=20
>> Yes, you would be able to install "all" the kernel-modules without
>> bothering
>> about KERNEL_SPLIT_MODULES. The issue is having autoload .conf file bein=
g
>> installed or not when KERNEL_MODULE_AUTOLOAD is having your modules list=
ed
>> to
>> be autoloader. When KERNEL_SPLIT_MODULES =3D 0 the .conf files for drive=
r
>> autoload and probeconf is not getting generated.
>=20
> This sounds like a bug to me, no? Why would someone expect setting
> KERNEL_SPLIT_MODULES to 0 have the autoload files missing?
>=20
> I ran a some tests. So when I set KERNEL_SPLIT_MODULES to 1, and
> KERNEL_MODULE_AUTOLOAD to "xt_limit", a kernel-module-xt-limit.ipk packag=
e
> is
> generated like so:
>=20
> =E2=94=9C=E2=94=80=E2=94=80 etc
> =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 modules-load.d
> =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 xt_limit.conf
> =E2=94=94=E2=94=80=E2=94=80 lib
> =E2=94=94=E2=94=80=E2=94=80 modules
> =E2=94=94=E2=94=80=E2=94=80 6.12.30-yocto-standard
> =E2=94=94=E2=94=80=E2=94=80 kernel
> =E2=94=94=E2=94=80=E2=94=80 net
> =E2=94=94=E2=94=80=E2=94=80 netfilter
> =E2=94=94=E2=94=80=E2=94=80 xt_limit.ko
>=20
> When KERNEL_SPLIT_MODULES is set to 0, only one kernel-modules.ipk packag=
e
> is
> generated, and does _not_ contain xt_limit.conf, but only xt_limit.ko. To
> me
> this sounds like a bug, what do you think?

Exactly, that's the issue reported https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D15145 ( https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D151=
45 ) and I am fixing it here with this solution https://lists.openembedded.=
org/g/openembedded-core/message/218290.

>=20
> I would _not_ describe that behavior in the documentation for the
> KERNEL_SPLIT_MODULES variables.

True, that's why the documentation does not mention anything about the conf=
 files.

>=20
> The fact that "kernel-modules" is still available when
> KERNEL_SPLIT_MODULES =3D 1
> is simply because a "fake" kernel-modules.ipk package is generated, and
> depends
> on the other kernel-module-* packages - so you can ignore my remark in my
> previous message.

Which remark exactly??

>=20
> Thanks,
> Antonin
>=20
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--iiheycoOlOLmP5rmGsCD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Jun 18, 2025 at 06:30 PM, Antonin Godard wrote:</div>
<div>
<blockquote>On Wed Jun 18, 2025 at 2:14 PM CEST, Dixit Parmar via lists.yoc=
toproject.org wrote:<br />
<blockquote>Will fix the ref-&gt;term typo and the take your suggestion on =
rewording.<br /><br />There seem to be confusion related to the kernel pack=
age name, however I feel<br />it was additional information. I shall remove=
 the mention of the kernel<br />package name (keep the variable reference o=
nly) for simplicity in next<br />version.</blockquote>
Looking forward to it!<br /><br />
<blockquote>Yes, you would be able to install "all" the kernel-modules with=
out bothering<br />about KERNEL_SPLIT_MODULES. The issue is having autoload=
 .conf file being<br />installed or not when KERNEL_MODULE_AUTOLOAD is havi=
ng your modules listed to<br />be autoloader. When KERNEL_SPLIT_MODULES =3D=
 0 the .conf files for driver<br />autoload and probeconf is not getting ge=
nerated.</blockquote>
This sounds like a bug to me, no? Why would someone expect setting<br />KER=
NEL_SPLIT_MODULES to 0 have the autoload files missing?<br /><br />I ran a =
some tests. So when I set KERNEL_SPLIT_MODULES to 1, and<br />KERNEL_MODULE=
_AUTOLOAD to "xt_limit", a kernel-module-xt-limit.ipk package is<br />gener=
ated like so:<br /><br />=E2=94=9C=E2=94=80=E2=94=80 etc<br />=E2=94=82&nbs=
p;&nbsp; =E2=94=94=E2=94=80=E2=94=80 modules-load.d<br />=E2=94=82&nbsp;&nb=
sp; =E2=94=94=E2=94=80=E2=94=80 xt_limit.conf<br />=E2=94=94=E2=94=80=E2=94=
=80 lib<br />=E2=94=94=E2=94=80=E2=94=80 modules<br />=E2=94=94=E2=94=80=E2=
=94=80 6.12.30-yocto-standard<br />=E2=94=94=E2=94=80=E2=94=80 kernel<br />=
=E2=94=94=E2=94=80=E2=94=80 net<br />=E2=94=94=E2=94=80=E2=94=80 netfilter<=
br />=E2=94=94=E2=94=80=E2=94=80 xt_limit.ko<br /><br />When KERNEL_SPLIT_M=
ODULES is set to 0, only one kernel-modules.ipk package is<br />generated, =
and does _not_ contain xt_limit.conf, but only xt_limit.ko. To me<br />this=
 sounds like a bug, what do you think?</blockquote>
</div>
<div>Exactly, that's the issue reported <a href=3D"https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D15145" target=3D"_blank" rel=3D"noopener">https=
://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15145 </a>and I am fixing it=
 here with this solution <a href=3D"https://lists.openembedded.org/g/openem=
bedded-core/message/218290" target=3D"_blank" rel=3D"noopener">https://list=
s.openembedded.org/g/openembedded-core/message/218290</a>.<br />
<blockquote>I would _not_ describe that behavior in the documentation for t=
he<br />KERNEL_SPLIT_MODULES variables.</blockquote>
True, that's why the documentation does not mention anything about the conf=
 files.<br />
<blockquote>The fact that "kernel-modules" is still available when KERNEL_S=
PLIT_MODULES =3D 1<br />is simply because a "fake" kernel-modules.ipk packa=
ge is generated, and depends<br />on the other kernel-module-* packages - s=
o you can ignore my remark in my<br />previous message.</blockquote>
Which remark exactly??<br />
<blockquote>Thanks,<br />Antonin<br /><br />-- <br />Antonin Godard, Bootli=
n<br />Embedded Linux and Kernel engineering<br /><a href=3D"https://bootli=
n.com" target=3D"_blank" rel=3D"noopener">https://bootlin.com</a></blockquo=
te>
</div>

--iiheycoOlOLmP5rmGsCD--

