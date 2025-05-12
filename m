Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84117C3ABCC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 20:16:47 +0000 (UTC)
Subject: Re: [PATCH v2] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
To: docs@lists.yoctoproject.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Mac Safari 18.4
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 12 May 2025 13:16:46 -0700
References: <D9U1JLD1015R.24479GHMULBH7@bootlin.com>
In-Reply-To: <D9U1JLD1015R.24479GHMULBH7@bootlin.com>
Message-ID: <1013.1747081006592263512@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="BUPl2aNg9oqVXFQkcnaI"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 20:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6810

--BUPl2aNg9oqVXFQkcnaI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi Antonin,

I guess it makes sense what you are suggesting.
I will make all the fixes based on your comments.

You mean a new patch for IMAGE_ROOTFS_MAXSIZE ( and not for IMAGE_ROOTFS_SI=
ZE), right?

Also I will prepare a v3 for INITRAMFS_MAXSIZE.

Thank you
Christos

--BUPl2aNg9oqVXFQkcnaI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi Antonin,</div>
<div>&nbsp;</div>
<div>I guess it makes sense what you are suggesting.</div>
<div>I will make all the fixes based on your comments.</div>
<div>&nbsp;</div>
<div>You mean a new patch for IMAGE_ROOTFS_MAXSIZE ( and not for IMAGE_ROOT=
FS_SIZE), right?</div>
<div>&nbsp;</div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;">Also I will prepare a v3 for <span style=3D"caret-color: #333333; =
color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue=
', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', =
'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; f=
ont-style: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: auto; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; background-color: #ffffff; text-decoration: none; =
display: inline !important; float: none;">INITRAMFS_MAXSIZE.</span></span><=
/div>
<div>&nbsp;</div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;"><span style=3D"caret-color: #333333; color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: #ffffff; text-decoration: none; display: inline !important; f=
loat: none;">Thank you </span></span></div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;"><span style=3D"caret-color: #333333; color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: #ffffff; text-decoration: none; display: inline !important; f=
loat: none;">Christos</span></span></div>

--BUPl2aNg9oqVXFQkcnaI--

