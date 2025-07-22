Return-Path: <pieter.scholtz@kdab.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2412C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 10:44:42 +0000 (UTC)
Subject: 32.1.3 Selecting SystemdbootTarget Documentation incorrect. 
To: docs@lists.yoctoproject.org
From: pieter.scholtz@kdab.com
X-Originating-Location: Johannesburg, Gauteng, ZA (169.1.40.252)
X-Originating-Platform: Linux Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 03:44:37 -0700
Message-ID: <G00F.1753181077132367053.BrKt@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="KMW1wi0CnwQx3cnzvpkP"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Jul 2025 10:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7358

--KMW1wi0CnwQx3cnzvpkP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi ,

I would like to point out a mistake here: https://docs.yoctoproject.org/4.2=
/dev-manual/runtime-testing.html#selecting-systemdboottarget

All references to bitbake core-image-sato
Should actually be
core-image-testcontroller
But in the bigger scheme of things , this is just the tip of the iceberg. (=
 The code around using systemdboot as a target seems to have "rotted" a bit=
 )

--KMW1wi0CnwQx3cnzvpkP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi ,&nbsp;<br /><br />I would like to point out a mistake here: <a hre=
f=3D"https://docs.yoctoproject.org/4.2/dev-manual/runtime-testing.html#sele=
cting-systemdboottarget" target=3D"_blank" rel=3D"noopener">https://docs.yo=
ctoproject.org/4.2/dev-manual/runtime-testing.html#selecting-systemdboottar=
get</a></div>
<div><br />All references to&nbsp;
<pre style=3D"box-sizing: border-box; line-height: 1.4; font-family: SFMono=
-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', Courie=
r, monospace; font-size: 12px; white-space: pre; margin: 0px; padding: 12px=
; display: block; overflow: auto; color: #333333; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration-thickness: initial; text-decoration-style: initial; text=
-decoration-color: initial;">bitbake core-image-sato</pre>
<div>&nbsp;Should actually be&nbsp;<br />
<pre style=3D"box-sizing: border-box; line-height: 1.4; font-family: SFMono=
-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', Courie=
r, monospace; font-size: 12px; white-space: pre; margin: 0px; padding: 12px=
; display: block; overflow: auto; color: #333333; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration-thickness: initial; text-decoration-style: initial; text=
-decoration-color: initial;">core-image-testcontroller</pre>
<br />But in the bigger scheme of things , this is just the tip of the iceb=
erg. ( The code around using systemdboot as a target seems to have "rotted"=
 a bit )</div>
</div>

--KMW1wi0CnwQx3cnzvpkP--

