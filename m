Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD61C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 19:43:25 +0000 (UTC)
Subject: Re: [PATCH] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
To: docs@lists.yoctoproject.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Linux Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 12:43:18 -0700
References: <8404.1743413076577523364@lists.yoctoproject.org>
In-Reply-To: <8404.1743413076577523364@lists.yoctoproject.org>
Message-ID: <16450.1743536598761017631@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="MMMkiaNFT3M4kTM8WB3e"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Apr 2025 19:43:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6693

--MMMkiaNFT3M4kTM8WB3e
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi Quentin,

when you write "compression is enabled", do you mean that the variable "INI=
TRAMFS_FSTYPES" is set to one of the compression formats (by default is set=
 to cpio.gz)?
If so , then i think that "INITRAMFS_MAXSIZE" applies the compressed image.

Br
Christos

--MMMkiaNFT3M4kTM8WB3e
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">hi<span>&nbsp;</span></span><span style=3D"box-sizing: border-=
box; overflow-wrap: break-word !important; color: #333333; font-size: 16px;=
 font-style: normal; font-variant-ligatures: normal; font-variant-caps: nor=
mal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: star=
t; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; white-space: normal; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initial;=
 font-family: system-ui, Roboto, Arial, sans-serif; background-color: #ffff=
ff; display: inline;">Quentin,</span></div>
<div>&nbsp;</div>
<div><span style=3D"box-sizing: border-box; overflow-wrap: break-word !impo=
rtant; color: #333333; font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: normal; text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial; font-family: system-ui, Roboto, Ari=
al, sans-serif; background-color: #ffffff; display: inline;">when you write=
 "compression is enabled", do you mean that the variable "INITRAMFS_FSTYPES=
" is set to one of the compression formats (by default is set to cpio.gz)?&=
nbsp;</span></div>
<div><span style=3D"box-sizing: border-box; overflow-wrap: break-word !impo=
rtant; color: #333333; font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: normal; text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial; font-family: system-ui, Roboto, Ari=
al, sans-serif; background-color: #ffffff; display: inline;">If so , then i=
 think that "INITRAMFS_MAXSIZE" applies the compressed image.</span></div>
<div>&nbsp;</div>
<div><span style=3D"box-sizing: border-box; overflow-wrap: break-word !impo=
rtant; color: #333333; font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: normal; text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial; font-family: system-ui, Roboto, Ari=
al, sans-serif; background-color: #ffffff; display: inline;">Br</span></div=
>
<div><span style=3D"box-sizing: border-box; overflow-wrap: break-word !impo=
rtant; color: #333333; font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: normal; text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial; font-family: system-ui, Roboto, Ari=
al, sans-serif; background-color: #ffffff; display: inline;">Christos</span=
></div>

--MMMkiaNFT3M4kTM8WB3e--

