Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDF4C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 06:48:11 +0000 (UTC)
Subject: Re: [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES variable
To: docs@lists.yoctoproject.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (223.233.84.84)
X-Originating-Platform: Linux Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 23:48:03 -0700
References: <DAPPBO0JXU6C.38BKO55VAYW0G@bootlin.com>
In-Reply-To: <DAPPBO0JXU6C.38BKO55VAYW0G@bootlin.com>
Message-ID: <15419.1750488483008609101@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="XmikYUcZi6tE6uE7fxpa"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 21 Jun 2025 06:48:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7128

--XmikYUcZi6tE6uE7fxpa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 07:12 PM, Antonin Godard wrote:

>=20
> On Wed Jun 18, 2025 at 3:19 PM CEST, Dixit Parmar via
> lists.yoctoproject.org wrote:
>=20
>> On Wed, Jun 18, 2025 at 06:30 PM, Antonin Godard wrote:
>>=20
>>=20
>>> On Wed Jun 18, 2025 at 2:14 PM CEST, Dixit Parmar via
>>> lists.yoctoproject.org wrote:
>>>=20
>>>=20
>>>> Will fix the ref->term typo and the take your suggestion on rewording.
>>>>=20
>>>> There seem to be confusion related to the kernel package name, however=
 I
>>>> feel
>>>> it was additional information. I shall remove the mention of the kerne=
l
>>>> package name (keep the variable reference only) for simplicity in next
>>>> version.
>>>=20
>>> Looking forward to it!
>>>=20
>>>=20
>>>=20
>>>> Yes, you would be able to install "all" the kernel-modules without
>>>> bothering
>>>> about KERNEL_SPLIT_MODULES. The issue is having autoload .conf file be=
ing
>>>> installed or not when KERNEL_MODULE_AUTOLOAD is having your modules li=
sted
>>>>=20
>>>> to
>>>> be autoloader. When KERNEL_SPLIT_MODULES =3D 0 the .conf files for dri=
ver
>>>> autoload and probeconf is not getting generated.
>>>=20
>>> This sounds like a bug to me, no? Why would someone expect setting
>>> KERNEL_SPLIT_MODULES to 0 have the autoload files missing?
>>>=20
>>> I ran a some tests. So when I set KERNEL_SPLIT_MODULES to 1, and
>>> KERNEL_MODULE_AUTOLOAD to "xt_limit", a kernel-module-xt-limit.ipk pack=
age
>>>=20
>>> is
>>> generated like so:
>>>=20
>>> =E2=94=9C=E2=94=80=E2=94=80 etc
>>> =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 modules-load.d
>>> =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 xt_limit.conf
>>> =E2=94=94=E2=94=80=E2=94=80 lib
>>> =E2=94=94=E2=94=80=E2=94=80 modules
>>> =E2=94=94=E2=94=80=E2=94=80 6.12.30-yocto-standard
>>> =E2=94=94=E2=94=80=E2=94=80 kernel
>>> =E2=94=94=E2=94=80=E2=94=80 net
>>> =E2=94=94=E2=94=80=E2=94=80 netfilter
>>> =E2=94=94=E2=94=80=E2=94=80 xt_limit.ko
>>>=20
>>> When KERNEL_SPLIT_MODULES is set to 0, only one kernel-modules.ipk pack=
age
>>>=20
>>> is
>>> generated, and does _not_ contain xt_limit.conf, but only xt_limit.ko. =
To
>>> me
>>> this sounds like a bug, what do you think?
>>=20
>> Exactly, that's the issue reported https://bugzilla.yoctoproject.org/sho=
w_bug.cgi?id=3D15145
>> ( https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15145 ) and I am f=
ixing
>> it here with this solution https://lists.openembedded.org/g/openembedded=
-core/message/218290
>> .
>>=20
>>=20
>>> I would _not_ describe that behavior in the documentation for the
>>> KERNEL_SPLIT_MODULES variables.
>>=20
>> True, that's why the documentation does not mention anything about the
>> conf files.
>>=20
>>=20
>>> The fact that "kernel-modules" is still available when
>>> KERNEL_SPLIT_MODULES =3D 1
>>> is simply because a "fake" kernel-modules.ipk package is generated, and
>>> depends
>>> on the other kernel-module-* packages - so you can ignore my remark in =
my
>>> previous message.
>>=20
>> Which remark exactly??
>=20
> About the possibility to install "kernel-modules" both when
> KERNEL_SPLIT_MODULES
> is 0 or 1. I guess it doesn't hurt to add a note about that at the end of
> the
> definition:
>=20
> """
> .. note::
>=20
> If :term:`KERNEL_SPLIT_MODULES` is set to 0, it is still possible to
> install
> all kernel modules at once by adding ``kernel-modules`` to
> :term:`IMAGE_INSTALL`. The way it works is that a placeholder
> "kernel-modules" package will be created and will depend on every other
> individual kernel module packages.
> """
>=20
> So there's no confusion. What do you think?

That sounds good to me. I will append this note. Thanks for suggestion.

>=20
>=20
> Antonin
>=20
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--XmikYUcZi6tE6uE7fxpa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Jun 18, 2025 at 07:12 PM, Antonin Godard wrote:</div>
<div>
<blockquote>On Wed Jun 18, 2025 at 3:19 PM CEST, Dixit Parmar via lists.yoc=
toproject.org wrote:<br />
<blockquote>On Wed, Jun 18, 2025 at 06:30 PM, Antonin Godard wrote:<br /><b=
r />
<blockquote>On Wed Jun 18, 2025 at 2:14 PM CEST, Dixit Parmar via<br />list=
s.yoctoproject.org wrote:<br /><br />
<blockquote>Will fix the ref-&gt;term typo and the take your suggestion on =
rewording.<br /><br />There seem to be confusion related to the kernel pack=
age name, however I<br />feel<br />it was additional information. I shall r=
emove the mention of the kernel<br />package name (keep the variable refere=
nce only) for simplicity in next<br />version.</blockquote>
Looking forward to it!<br /><br /><br />
<blockquote>Yes, you would be able to install "all" the kernel-modules with=
out<br />bothering<br />about KERNEL_SPLIT_MODULES. The issue is having aut=
oload .conf file being<br />installed or not when KERNEL_MODULE_AUTOLOAD is=
 having your modules listed<br />to<br />be autoloader. When KERNEL_SPLIT_M=
ODULES =3D 0 the .conf files for driver<br />autoload and probeconf is not =
getting generated.</blockquote>
This sounds like a bug to me, no? Why would someone expect setting<br />KER=
NEL_SPLIT_MODULES to 0 have the autoload files missing?<br /><br />I ran a =
some tests. So when I set KERNEL_SPLIT_MODULES to 1, and<br />KERNEL_MODULE=
_AUTOLOAD to "xt_limit", a kernel-module-xt-limit.ipk package<br />is<br />=
generated like so:<br /><br />=E2=94=9C=E2=94=80=E2=94=80 etc<br />=E2=94=
=82&nbsp;&nbsp; =E2=94=94=E2=94=80=E2=94=80 modules-load.d<br />=E2=94=82&n=
bsp;&nbsp; =E2=94=94=E2=94=80=E2=94=80 xt_limit.conf<br />=E2=94=94=E2=94=
=80=E2=94=80 lib<br />=E2=94=94=E2=94=80=E2=94=80 modules<br />=E2=94=94=E2=
=94=80=E2=94=80 6.12.30-yocto-standard<br />=E2=94=94=E2=94=80=E2=94=80 ker=
nel<br />=E2=94=94=E2=94=80=E2=94=80 net<br />=E2=94=94=E2=94=80=E2=94=80 n=
etfilter<br />=E2=94=94=E2=94=80=E2=94=80 xt_limit.ko<br /><br />When KERNE=
L_SPLIT_MODULES is set to 0, only one kernel-modules.ipk package<br />is<br=
 />generated, and does _not_ contain xt_limit.conf, but only xt_limit.ko. T=
o<br />me<br />this sounds like a bug, what do you think?</blockquote>
Exactly, that's the issue reported <a href=3D"https://bugzilla.yoctoproject=
.org/show_bug.cgi?id=3D15145" target=3D"_blank" rel=3D"noopener">https://bu=
gzilla.yoctoproject.org/show_bug.cgi?id=3D15145</a> ( <a href=3D"https://bu=
gzilla.yoctoproject.org/show_bug.cgi?id=3D15145" target=3D"_blank" rel=3D"n=
oopener">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15145</a> ) an=
d I am fixing it here with this solution <a href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/218290" target=3D"_blank" rel=3D"noopen=
er">https://lists.openembedded.org/g/openembedded-core/message/218290</a>.<=
br /><br />
<blockquote>I would _not_ describe that behavior in the documentation for t=
he<br />KERNEL_SPLIT_MODULES variables.</blockquote>
True, that's why the documentation does not mention anything about the conf=
 files.<br /><br />
<blockquote>The fact that "kernel-modules" is still available when<br />KER=
NEL_SPLIT_MODULES =3D 1<br />is simply because a "fake" kernel-modules.ipk =
package is generated, and<br />depends<br />on the other kernel-module-* pa=
ckages - so you can ignore my remark in my<br />previous message.</blockquo=
te>
Which remark exactly??</blockquote>
About the possibility to install "kernel-modules" both when KERNEL_SPLIT_MO=
DULES<br />is 0 or 1. I guess it doesn't hurt to add a note about that at t=
he end of the<br />definition:<br /><br />"""<br />.. note::<br /><br />If =
:term:`KERNEL_SPLIT_MODULES` is set to 0, it is still possible to install<b=
r />all kernel modules at once by adding ``kernel-modules`` to<br />:term:`=
IMAGE_INSTALL`. The way it works is that a placeholder<br />"kernel-modules=
" package will be created and will depend on every other<br />individual ke=
rnel module packages.<br />"""<br /><br />So there's no confusion. What do =
you think?</blockquote>
That sounds good to me. I will append this note. Thanks for suggestion.<br =
/>
<blockquote><br />Antonin<br /><br />-- <br />Antonin Godard, Bootlin<br />=
Embedded Linux and Kernel engineering<br /><a href=3D"https://bootlin.com" =
target=3D"_blank" rel=3D"noopener">https://bootlin.com</a></blockquote>
</div>

--XmikYUcZi6tE6uE7fxpa--

