Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC7BC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:14:56 +0000 (UTC)
Subject: Re: [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES variable
To: docs@lists.yoctoproject.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (223.233.84.162)
X-Originating-Platform: Windows Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 05:14:48 -0700
References: <DAIQQ2J2C0BT.2USP6INDRV4P6@bootlin.com>
In-Reply-To: <DAIQQ2J2C0BT.2USP6INDRV4P6@bootlin.com>
Message-ID: <9960.1750248888618731264@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="Who7l28fruFJDxxEwUhk"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 12:14:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7096

--Who7l28fruFJDxxEwUhk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Will fix the ref->term typo and the take your suggestion on rewording.

There seem to be confusion related to the kernel package name, however I fe=
el it was additional information. I shall remove the mention of the kernel =
package name (keep the variable reference only) for simplicity in next vers=
ion.

Another side question: in my experience I never had to set KERNEL_SPLIT_MOD=
ULES
to be able to install *all* kernel modules. Whatever the value of
KERNEL_SPLIT_MODULES, installing the package "kernel-modules" would just in=
stall
the modules. So what is the difference after setting this variable?

Yes, you would be able to install "all" the kernel-modules without botherin=
g about KERNEL_SPLIT_MODULES. The issue is having autoload .conf file being=
 installed or not when KERNEL_MODULE_AUTOLOAD is having your modules listed=
 to be autoloader. When KERNEL_SPLIT_MODULES =3D 0 the .conf files for driv=
er autoload and probeconf is not getting generated.

--Who7l28fruFJDxxEwUhk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Will fix the ref-&gt;term typo and the take your suggestion on rewordi=
ng.</div>
<div>&nbsp;</div>
<div>There seem to be confusion related to the kernel package name, however=
 I feel it was additional information. I shall remove the mention of the ke=
rnel package name (keep the variable reference only) for simplicity in next=
 version.</div>
<div>&nbsp;</div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">Another side question: in my experience I never had to set K=
ERNEL_SPLIT_MODULES</span><br style=3D"box-sizing: border-box; overflow-wra=
p: break-word !important; color: #333333; font-family: system-ui, 'Segoe UI=
', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-se=
rif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color =
Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: normal=
; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orph=
ans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: =
2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;" /><span style=3D"col=
or: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', =
'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Se=
goe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff; =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial; display: inline !important; float: none;">to be ab=
le to install *all* kernel modules. Whatever the value of</span><br style=
=3D"box-sizing: border-box; overflow-wrap: break-word !important; color: #3=
33333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto =
Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI=
 Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-ind=
ent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-d=
ecoration-thickness: initial; text-decoration-style: initial; text-decorati=
on-color: initial;" /><span style=3D"color: #333333; font-family: system-ui=
, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', '=
Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; orphans: 2; text-align: start; text-indent: 0px; text-transform: non=
e; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spac=
e: pre-wrap; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">KERNEL_SPLIT_MODULES, installing the packag=
e "kernel-modules" would just install</span><br style=3D"box-sizing: border=
-box; overflow-wrap: break-word !important; color: #333333; font-family: sy=
stem-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation San=
s', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Sym=
bol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whi=
te-space: pre-wrap; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial;" />=
<span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, =
'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple=
 Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; fon=
t-size: 16px; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial; display: inline !important; floa=
t: none;">the modules. So what is the difference after setting this variabl=
e?</span></div>
<div>&nbsp;</div>
<div>Yes, you would be able to install "all" the kernel-modules without bot=
hering about KERNEL_SPLIT_MODULES. The issue is having autoload .conf file =
being installed or not when KERNEL_MODULE_AUTOLOAD is having your modules l=
isted to be autoloader. When KERNEL_SPLIT_MODULES =3D 0 the .conf files for=
 driver autoload and probeconf is not getting generated.</div>

--Who7l28fruFJDxxEwUhk--

