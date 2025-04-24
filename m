Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E5DC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 15:18:35 +0000 (UTC)
Subject: Re: [PATCH] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
To: docs@lists.yoctoproject.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Linux Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 24 Apr 2025 08:18:34 -0700
References: <D9EPOGRMN3YJ.2KZRPDOFHCRRS@bootlin.com>
In-Reply-To: <D9EPOGRMN3YJ.2KZRPDOFHCRRS@bootlin.com>
Message-ID: <24329.1745507914289060157@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="2mhxKhrvsXyKMJxrkhTG"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Apr 2025 15:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6782

--2mhxKhrvsXyKMJxrkhTG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi Antonin

my plan was to include text for all the comments from you and Quentin.
I didnt mention the others because are small changes.

Regarding the 2 variables. The values are:
IMAGE_OVERHEAD_FACTOR =3D 1.3
IMAGE_ROOTFS_ALIGNMENT =3D 1
size (initial size of IMAGE_ROOTFS) =3D 120840kb
size (after applying IMAGE_OVERHEAD_FACTOR ) =3D 157092kb
size (after applying IMAGE_ROOTFS_ALIGNMENT ) =3D 157092kb

There are more variables involved in the final calculation like 'IMAGE_ROOT=
FS_SIZE', 'IMAGE_ROOTFS_EXTRA_SPACE' (calc of base_size2).

My suggestion related to variables is to add a sentence like " The variable=
s IMAGE_OVERHEAD_FACTOR, IMAGE_ROOTFS_ALIGNMENT , IMAGE_ROOTFS_SIZE, IMAGE_=
ROOTFS_EXTRA_SPACE
are applied in the final calculation of initramfs size."

Br
Christos

--2mhxKhrvsXyKMJxrkhTG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi Antonin</div>
<div>&nbsp;</div>
<div>my plan was to include text for all the comments from you and Quentin.=
&nbsp;</div>
<div>I didnt mention the others because are small changes.</div>
<div>&nbsp;</div>
<div>Regarding the 2 variables. The values are:</div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">IMAGE_OVERHEAD_FACTOR =3D 1.3</span></div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;">IMAGE_ROOTFS_ALIGNMENT =3D 1</span></span></div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;">size (initial size of IMAGE_ROOTFS) =3D 120840kb</=
span></span><span style=3D"color: #333333; font-family: system-ui, 'Segoe U=
I', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-s=
erif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color=
 Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orp=
hans: 2; text-align: start; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wra=
p; background-color: #ffffff; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;"><span style=3D"color: #333333; font-family: system-ui=
, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', '=
Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; orphans: 2; text-align: start; text-indent: 0px; text-transform: non=
e; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spac=
e: pre-wrap; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;"></span></span></div>
<div>size (after applying <span style=3D"color: #333333; font-family: syste=
m-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans',=
 Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol=
', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: pre-wrap; background-color: #ffffff; text-decoration-thickness: init=
ial; text-decoration-style: initial; text-decoration-color: initial; displa=
y: inline !important; float: none;">IMAGE_OVERHEAD_FACTOR </span>) =3D 1570=
92kb</div>
<div>size (after applying <span style=3D"color: #333333; font-family: syste=
m-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans',=
 Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol=
', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: pre-wrap; background-color: #ffffff; text-decoration-thickness: init=
ial; text-decoration-style: initial; text-decoration-color: initial; displa=
y: inline !important; float: none;"><span style=3D"color: #333333; font-fam=
ily: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberat=
ion Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe=
 UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; white-space: pre-wrap; background-color: #ffffff; text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">IMAGE_ROOTFS_ALIGNMENT </span=
></span>) =3D 157092kb</div>
<div>&nbsp;</div>
<div>There are more variables involved in the final calculation like 'IMAGE=
_ROOTFS_SIZE', 'IMAGE_ROOTFS_EXTRA_SPACE' (calc of base_size2).</div>
<div>&nbsp;</div>
<div>My suggestion related to variables is to add a sentence like " The var=
iables <span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', R=
oboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif,=
 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoj=
i'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; ba=
ckground-color: #ffffff; text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial; display: inline !importan=
t; float: none;">IMAGE_OVERHEAD_FACTOR, <span style=3D"color: #333333; font=
-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Lib=
eration Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'S=
egoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; white-space: pre-wrap; background-color: #ffffff; text-decoration-t=
hickness: initial; text-decoration-style: initial; text-decoration-color: i=
nitial; display: inline !important; float: none;"><span style=3D"color: #33=
3333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto S=
ans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-de=
coration-thickness: initial; text-decoration-style: initial; text-decoratio=
n-color: initial; display: inline !important; float: none;">IMAGE_ROOTFS_AL=
IGNMENT , IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_EXTRA_SPACE</span></span></span><=
/div>
<div>are applied in the final calculation of initramfs size."</div>
<div>&nbsp;</div>
<div>Br</div>
<div>Christos</div>
<div>&nbsp;</div>

--2mhxKhrvsXyKMJxrkhTG--

