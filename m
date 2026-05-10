Return-Path: <mw.choi@telica.co.kr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F343BCD37AF
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 09:05:03 +0000 (UTC)
Received: from smtp4.hiworks.co.kr (smtp4.hiworks.co.kr [121.254.168.203])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26912.1778403899317920294
 for <docs@lists.yoctoproject.org>;
 Sun, 10 May 2026 02:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: telica.co.kr, ip: 121.254.168.203, mailfrom: mw.choi@telica.co.kr)
Received: from hi-smtp-node4 (unknown [172.18.0.4])
	by smtp4.hiworks.co.kr (Postfix) with ESMTPS id 4gCxky0Sm3zKRxjj
	for <docs@lists.yoctoproject.org>; Sun, 10 May 2026 18:04:58 +0900 (KST)
Received: from hi-smtp-node1 (unknown [192.168.71.167])
	by hi-smtp-node4 (Postfix) with ESMTP id 4gCxkx6YVyzQL3F5
	for <docs@lists.yoctoproject.org>; Sun, 10 May 2026 18:04:57 +0900 (KST)
Received: from split.smtp.hiworks.com (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node1 with ESMTP id iihncp7dddohuiwx;
 	Sun, 10 May 2026 18:04:57 +0900 (KST)
Received: from hiworks-k8s (EHLO mail-api-v2-prod-569c5b596f-gpg6h) (10.251.216.0) 	by 0 (smtp-channel-split) with SMTP; 	Sun, 10 May 2026 18:04:57 +0900
Date: Sun, 10 May 2026 18:04:56 +0900 (KST)
From: =?UTF-8?B?7LWc66+87Jqw?= <mw.choi@telica.co.kr>
Reply-To: =?UTF-8?B?7LWc66+87Jqw?= <mw.choi@telica.co.kr>
To: docs@lists.yoctoproject.org
Message-ID: <gab162622225.0.1778403896896@telica.co.kr>
Subject: [PATCH] ref-manual/variables: document the 'dynamic layer' concept
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1357523_1932020906.1778403896896"
X-Priority: 3
X-Authinfo: HIWORKS WEB authenticated <mw.choi@telica.co.kr|1.225.216.91>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 10 May 2026 09:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9430

------=_Part_1357523_1932020906.1778403896896
Content-Type: multipart/related; 
	boundary="----=_Part_1357524_1369121205.1778403896896"

------=_Part_1357524_1369121205.1778403896896
Content-Type: multipart/alternative; 
	boundary="----=_Part_1357525_50261028.1778403896903"

------=_Part_1357525_50261028.1778403896903
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8swqBJIGhhdmUgYXR0YWNoZWQgYSBwYXRjaCB0byBkb2N1bWVudCB0aGUgQkJGSUxFU19E
WU5BTUlDIHZhcmlhYmxlIGluIHRoZSByZWZlcmVuY2UgbWFudWFsLsKgCkJlc3QgcmVnYXJkcyzC
oE1pbndvbyBDaG9pCgoo7KO8Ke2FlOumrOy5tMKgRlftjIAg7LWc66+87JqwIOyjvOyehO+9nE1p
bndvbyBDaG9pTW9iaWxlLiArODIgMTAtNDg0NS0zMjkzRS1tYWlsLsKgbXcuY2hvaUB0ZWxpY2Eu
Y28ua3Lso7zshowuwqAoMTYwMDYpwqDqsr3quLDrj4TCoOydmOyZleyLnMKg7J2066+466GcNDDC
oOyduOuNleybkMKgSVTCoOuwuOumrMKgQeuPmcKgNDEx7Zi4Cg==
------=_Part_1357525_50261028.1778403896903
Content-Type: text/html;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"se-contents" role=3D"textbox" style=3D"box-sizing: content-bo=
x; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-siz=
e: 16px; line-height: 1.6;" data-document-fixed-width=3D"false"><p style=3D=
"margin: 0px; display: block; overflow-wrap: break-word;"><span>Hello,&nbsp=
;</span></p><p style=3D"margin: 0px; display: block; overflow-wrap: break-w=
ord;"><span>I have attached a patch to document the BBFILES_DYNAMIC variabl=
e in the reference manual.&nbsp;</span></p><p style=3D"margin: 0px; display=
: block; overflow-wrap: break-word;"><br></p><p style=3D"margin: 0px; displ=
ay: block; overflow-wrap: break-word;"><span>Best regards,&nbsp;</span></p>=
<p style=3D"margin: 0px; display: block; overflow-wrap: break-word;"><span>=
Minwoo Choi</span></p><p style=3D"margin: 0px; display: block; overflow-wra=
p: break-word;"><br></p><div id=3D"sign_body" class=3D"se-div"><div class=
=3D"se-div" style=3D"box-sizing: content-box; font-family: &quot;=EB=A7=91=
=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 16px; line-height: 1.6;"><p =
style=3D"font-variant-ligatures: normal; font-variant-caps: normal; orphans=
: 2; text-transform: none; widows: 2; -webkit-text-stroke-width: 0px; font-=
style: normal; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quo=
t;; font-size: 16px; color: rgb(0, 0, 0); font-weight: 400; text-indent: 0p=
x; margin: 0px; word-spacing: 0px; white-space: normal;"><span class=3D"se-=
drawing-object-wrapper se-image" style=3D"text-indent: 0px; vertical-align:=
 baseline; display: inline-block;"><img style=3D"vertical-align: bottom; wi=
dth: 98.0372px; height: 41.6658px;" src=3D"https://mail-api.office.hiworks.=
com/v2/signatures/images/652286_12169_20250108161242364" width=3D"98.0372" =
height=3D"41.6658"></span><span style=3D"background: rgb(255, 255, 255); fo=
nt-family: &quot;Arial Nova&quot;, sans-serif; font-size: 10pt; color: rgb(=
34, 34, 34);" class=3D"se-zws-run"><br></span></p><p style=3D"font-variant-=
ligatures: normal; font-variant-caps: normal; orphans: 2; text-transform: n=
one; widows: 2; -webkit-text-stroke-width: 0px; font-style: normal; font-fa=
mily: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 16px; c=
olor: rgb(0, 0, 0); font-weight: 400; text-indent: 0px; margin: 0px; word-s=
pacing: 0px; white-space: normal;"><span style=3D"background: rgb(255, 255,=
 255); font-style: normal; font-family: &quot;Arial Nova&quot;, sans-serif;=
 font-size: 10pt; color: rgb(34, 34, 34); font-weight: 400;">(</span><span =
style=3D"background: rgb(255, 255, 255); font-style: normal; font-family: &=
quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 10pt; color: r=
gb(34, 34, 34); font-weight: 400;">=EC=A3=BC</span><span style=3D"backgroun=
d: rgb(255, 255, 255); font-style: normal; font-family: &quot;Arial Nova&qu=
ot;, sans-serif; font-size: 10pt; color: rgb(34, 34, 34); font-weight: 400;=
">)</span><span style=3D"background: rgb(255, 255, 255); font-style: normal=
; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size=
: 10pt; color: rgb(34, 34, 34); font-weight: 400;">=ED=85=94=EB=A6=AC=EC=B9=
=B4</span><span style=3D"background: rgb(255, 255, 255); font-style: normal=
; font-family: &quot;Arial Nova&quot;, sans-serif; font-size: 10pt; color: =
rgb(34, 34, 34); font-weight: 400;">&nbsp;FW=ED=8C=80 =EC=B5=9C=EB=AF=BC=EC=
=9A=B0 =EC=A3=BC=EC=9E=84</span><span style=3D"background: rgb(255, 255, 25=
5); font-style: normal; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=
=94=95&quot;; font-size: 10pt; color: rgb(34, 34, 34); font-weight: 400;">=
=EF=BD=9CMinwoo Choi</span></p><p style=3D"font-variant-ligatures: normal; =
font-variant-caps: normal; orphans: 2; text-transform: none; widows: 2; -we=
bkit-text-stroke-width: 0px; font-style: normal; font-family: &quot;=EB=A7=
=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 16px; color: rgb(0, 0, 0)=
; font-weight: 400; text-indent: 0px; margin: 0px; word-spacing: 0px; white=
-space: normal;"><span style=3D"background: rgb(255, 255, 255); font-style:=
 normal; font-family: &quot;Arial Nova&quot;, sans-serif; font-size: 10pt; =
color: rgb(34, 34, 34); font-weight: 400;">Mobile. +82 10-4845-3293</span><=
/p><p style=3D"font-variant-ligatures: normal; font-variant-caps: normal; o=
rphans: 2; text-transform: none; widows: 2; -webkit-text-stroke-width: 0px;=
 font-style: normal; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=
=95&quot;; font-size: 16px; color: rgb(0, 0, 0); font-weight: 400; text-ind=
ent: 0px; margin: 0px; word-spacing: 0px; white-space: normal;"><span style=
=3D"background: rgb(255, 255, 255); font-style: normal; font-family: &quot;=
Arial Nova&quot;, sans-serif; font-size: 10pt; color: rgb(34, 34, 34); font=
-weight: 400;">E-mail.&nbsp;mw.choi</span><span style=3D"background: rgb(25=
5, 255, 255); font-style: normal; font-family: &quot;Arial Nova&quot;, sans=
-serif; font-size: 10pt; color: rgb(34, 34, 34); font-weight: 400;">@telica=
.co.kr</span></p><p style=3D"font-variant-ligatures: normal; font-variant-c=
aps: normal; orphans: 2; text-transform: none; widows: 2; -webkit-text-stro=
ke-width: 0px; font-style: normal; font-family: &quot;=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95&quot;; font-size: 16px; color: rgb(0, 0, 0); font-weight=
: 400; text-indent: 0px; margin: 0px; word-spacing: 0px; white-space: norma=
l;"><span style=3D"background: rgb(255, 255, 255); font-style: normal; font=
-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 10pt=
; color: rgb(34, 34, 34); font-weight: 400;">=EC=A3=BC=EC=86=8C</span><span=
 style=3D"background: rgb(255, 255, 255); font-style: normal; font-family: =
&quot;Arial Nova&quot;, sans-serif; font-size: 10pt; color: rgb(34, 34, 34)=
; font-weight: 400;">.&nbsp;</span><span style=3D"font-style: normal; font-=
family: &quot;Arial Nova&quot;, sans-serif; font-size: 10pt; color: rgb(0, =
0, 0); font-weight: 400;">(16006)&nbsp;</span><span style=3D"font-style: no=
rmal; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-=
size: 10pt; color: rgb(0, 0, 0); font-weight: 400;">=EA=B2=BD=EA=B8=B0=EB=
=8F=84</span><span style=3D"font-style: normal; font-family: &quot;Arial No=
va&quot;, sans-serif; font-size: 10pt; color: rgb(0, 0, 0); font-weight: 40=
0;">&nbsp;</span><span style=3D"font-style: normal; font-family: &quot;=EB=
=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 10pt; color: rgb(0, 0,=
 0); font-weight: 400;">=EC=9D=98=EC=99=95=EC=8B=9C</span><span style=3D"fo=
nt-style: normal; font-family: &quot;Arial Nova&quot;, sans-serif; font-siz=
e: 10pt; color: rgb(0, 0, 0); font-weight: 400;">&nbsp;</span><span style=
=3D"font-style: normal; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=
=94=95&quot;; font-size: 10pt; color: rgb(0, 0, 0); font-weight: 400;">=EC=
=9D=B4=EB=AF=B8=EB=A1=9C</span><span style=3D"font-style: normal; font-fami=
ly: &quot;Arial Nova&quot;, sans-serif; font-size: 10pt; color: rgb(0, 0, 0=
); font-weight: 400;">40&nbsp;</span><span style=3D"font-style: normal; fon=
t-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 10p=
t; color: rgb(0, 0, 0); font-weight: 400;">=EC=9D=B8=EB=8D=95=EC=9B=90&nbsp=
;</span><span style=3D"font-style: normal; font-family: &quot;Arial Nova&qu=
ot;, sans-serif; font-size: 10pt; color: rgb(0, 0, 0); font-weight: 400;">I=
T&nbsp;</span><span style=3D"font-style: normal; font-family: &quot;=EB=A7=
=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; font-size: 10pt; color: rgb(0, 0, 0)=
; font-weight: 400;">=EB=B0=B8=EB=A6=AC&nbsp;</span><span style=3D"font-sty=
le: normal; font-family: &quot;Arial Nova&quot;, sans-serif; font-size: 10p=
t; color: rgb(0, 0, 0); font-weight: 400;">A</span><span style=3D"font-styl=
e: normal; font-family: &quot;=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95&quot;; =
font-size: 10pt; color: rgb(0, 0, 0); font-weight: 400;">=EB=8F=99&nbsp;</s=
pan><span style=3D"font-style: normal; font-family: &quot;Arial Nova&quot;,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0); font-weight: 400;">411</=
span><span style=3D"font-style: normal; font-family: &quot;=EB=A7=91=EC=9D=
=80 =EA=B3=A0=EB=94=95&quot;; font-size: 10pt; color: rgb(0, 0, 0); font-we=
ight: 400;">=ED=98=B8</span></p></div></div><p style=3D"margin: 0px;"><br><=
/p></div>
<table style=3D"display:none"><tbody><tr><td><img gabiamail src=3D"https://=
mail-api.office.hiworks.com/v2/office/652286/receipt-confirm/20260510060456=
_829007661_telica.co.kr_mw.choi/email/docs@lists.yoctoproject.org" width=3D"0=
" height=3D"0" style=3D"display:none;" border=3D"0" loading=3D"eager"></td>=
</tr></tbody></table>

------=_Part_1357525_50261028.1778403896903--

------=_Part_1357524_1369121205.1778403896896--

------=_Part_1357523_1932020906.1778403896896
Content-Type: application/octet-stream; 
	name=0001-ref-manual-variables-document-the-dynamic-layer-conc.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; 
	filename=0001-ref-manual-variables-document-the-dynamic-layer-conc.patch

RnJvbSA1NDU3ZmY4MmQ3YTM5NjdmZTcxZmMwN2M2Zjc2NTU3YzUxOTAzYzRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaW53b28gQ2hvaSA8bXcuY2hvaUB0ZWxpY2EuY28ua3I+CkRh
dGU6IFN1biwgMTAgTWF5IDIwMjYgMTc6NTE6MTcgKzA5MDAKU3ViamVjdDogW1BBVENIXSByZWYt
bWFudWFsL3ZhcmlhYmxlczogZG9jdW1lbnQgdGhlICdkeW5hbWljIGxheWVyJyBjb25jZXB0CgpT
aWduZWQtb2ZmLWJ5OiBNaW53b28gQ2hvaSA8bXcuY2hvaUB0ZWxpY2EuY28ua3I+Ci0tLQogZG9j
dW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgfCA1ICsrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3Vt
ZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0IGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFu
dWFsL3ZhcmlhYmxlcy5yc3QKaW5kZXggYThjYmI4N2NmLi43NTU5Mjk5NDcgMTAwNjQ0Ci0tLSBh
L2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0CisrKyBiL2RvY3VtZW50YXRp
b24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0CkBAIC04NDEsOCArODQxLDkgQEAgc3lzdGVtIGFu
ZCBnaXZlcyBhbiBvdmVydmlldyBvZiB0aGVpciBmdW5jdGlvbiBhbmQgY29udGVudHMuCiAgICAg
ICBwcmV2aW91cyBsaW5rLgogCiAgICA6dGVybTpgQkJGSUxFU19EWU5BTUlDYAotICAgICAgQWN0
aXZhdGVzIGNvbnRlbnQgd2hlbiBpZGVudGlmaWVkIGxheWVycyBhcmUgcHJlc2VudC4gWW91IGlk
ZW50aWZ5Ci0gICAgICB0aGUgbGF5ZXJzIGJ5IHRoZSBjb2xsZWN0aW9ucyB0aGF0IHRoZSBsYXll
cnMgZGVmaW5lLgorICAgICAgQWN0aXZhdGVzIGNvbnRlbnQgd2hlbiBpZGVudGlmaWVkIGxheWVy
cyBhcmUgcHJlc2VudC4gVGhpcyBtZWNoYW5pc20KKyAgICAgIGlzIGNvbW1vbmx5IHJlZmVycmVk
IHRvIGFzICJkeW5hbWljIGxheWVycyIuIFlvdSBpZGVudGlmeSB0aGUgbGF5ZXJzCisgICAgICBi
eSB0aGUgY29sbGVjdGlvbnMgdGhhdCB0aGUgbGF5ZXJzIGRlZmluZS4KIAogICAgICAgVXNlIHRo
ZSA6dGVybTpgQkJGSUxFU19EWU5BTUlDYCB2YXJpYWJsZSB0byBhdm9pZCBgYC5iYmFwcGVuZGBg
IGZpbGVzCiAgICAgICB3aG9zZSBjb3JyZXNwb25kaW5nIGBgLmJiYGAgZmlsZSBpcyBpbiBhIGxh
eWVyIHRoYXQgYXR0ZW1wdHMgdG8KLS0gCjIuNDMuMAoK
------=_Part_1357523_1932020906.1778403896896--

