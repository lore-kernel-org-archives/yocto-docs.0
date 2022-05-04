Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED71DC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 15:00:28 +0000 (UTC)
Subject: Re: [PATCH V3] Improvements for gdbserver configuration
To: docs@lists.yoctoproject.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Belgaum, Karnataka, IN (103.197.112.41)
X-Originating-Platform: Windows Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 04 May 2022 08:00:19 -0700
References: <f2c79713-d6e6-37a2-7f67-575cf935111a@bootlin.com>
In-Reply-To: <f2c79713-d6e6-37a2-7f67-575cf935111a@bootlin.com>
Message-ID: <11597.1651676419349976877@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="lMpI1Zu15AVUn59QNNEH"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 15:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2912

--lMpI1Zu15AVUn59QNNEH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

The current doc says,
IMAGE_INSTALL:append =3D " gdbserver" to be added in local.conf file or in =
an image recipe. According to yocto doc, the IMAGE_INSTALL should be used w=
ith image recipe and the EXTRA_IMAGE_FEATURES should be used by conf file.

So, the let me know below correction should be OK?

Make the following addition in=C2=A0an image recipe:

IMAGE_INSTALL : append =3D " gdbserver"

The change makes sure the gdbserver package is included.

And, make following addition in local.conf.
EXTRA_IMAGE_FEATURES:append =3D " tools-debug"

Thanks,
Sundeep K.

--lMpI1Zu15AVUn59QNNEH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello&nbsp;<span style=3D"white-space: pre-wrap;">Michael,</span><br /><br =
/><span style=3D"white-space: pre-wrap;">The current doc says,</span><br />=
<span style=3D"white-space: pre-wrap;">IMAGE_INSTALL:append =3D " gdbserver=
" to be added in </span><code class=3D"docutils literal notranslate" style=
=3D"font-family: SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono'=
, 'Courier New', Courier, monospace; font-size: 13.6px; white-space: nowrap=
; max-width: 100%; background-image: inherit; background-position: inherit;=
 background-size: inherit; background-repeat: inherit; background-attachmen=
t: inherit; background-origin: inherit; background-clip: inherit; backgroun=
d-color: #fcfcfc; border: none; padding: unset; color: #333333; overflow-x:=
 auto;"><span class=3D"pre" style=3D"font-size: medium; font-family: Courie=
r, monospace;">local.conf</span></code><span style=3D"font-family: Verdana,=
 Sans, sans-serif; font-size: 16px; background-color: #fcfcfc;">&nbsp;file =
or in an image recipe. According to yocto doc, the&nbsp;</span><span style=
=3D"white-space: pre-wrap;">IMAGE_INSTALL should be used with image recipe =
and the </span><span style=3D"white-space: pre-wrap;">EXTRA_IMAGE_FEATURES =
should be used by conf file.<br /><br /></span>So, the let me know below co=
rrection should be OK?<br /><br />
<p style=3D"line-height: 24px; font-size: 16px; margin-top: 12px; margin-bo=
ttom: 12px; font-family: Verdana, Sans, sans-serif; background-color: #fcfc=
fc;">Make the following addition in&nbsp;an image recipe:</p>
<div class=3D"highlight-default notranslate" style=3D"border: 1px solid #e1=
e4e5; overflow-x: auto; margin: 12px 0px; font-family: Verdana, Sans, sans-=
serif; font-size: 16px; background-color: #fcfcfc;">
<div class=3D"highlight" style=3D"background: #f8f8f8; border: none; overfl=
ow-x: auto; margin: 0px; padding: 0px;">
<pre style=3D"font-family: SFMono-Regular, Menlo, Monaco, Consolas, 'Libera=
tion Mono', 'Courier New', Courier, monospace; font-size: 12px; line-height=
: 1.4; margin-bottom: 0px; padding: 12px;"><span class=3D"n">IMAGE_INSTALL<=
/span><span class=3D"p">:</span><span class=3D"n">append</span> <span class=
=3D"o" style=3D"color: #666666;">=3D</span> <span class=3D"s2" style=3D"col=
or: #ba2121;">" gdbserver"</span>
</pre>
</div>
</div>
<p style=3D"line-height: 24px; font-size: 16px; margin-top: 12px; margin-bo=
ttom: 12px; font-family: Verdana, Sans, sans-serif; background-color: #fcfc=
fc;">The change makes sure the&nbsp;<code class=3D"docutils literal notrans=
late" style=3D"font-family: SFMono-Regular, Menlo, Monaco, Consolas, 'Liber=
ation Mono', 'Courier New', Courier, monospace; font-size: 13.6px; white-sp=
ace: nowrap; max-width: 100%; background: inherit; border: none; padding: u=
nset; color: inherit; overflow-x: auto;"><span class=3D"pre" style=3D"font-=
size: medium; font-family: Courier, monospace;">gdbserver</span></code>&nbs=
p;package is included.<br /><br />And, make following addition in local.con=
f.<br /><span style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, san=
s-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;=
">EXTRA_IMAGE_FEATURES:append =3D " tools-debug"<br /><br /><br />Thanks,<b=
r />Sundeep K.<br /></span></p>

--lMpI1Zu15AVUn59QNNEH--

