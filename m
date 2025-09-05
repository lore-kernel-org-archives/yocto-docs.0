Return-Path: <barne.carstensen@danfoss.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D184CA1015
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 08:20:15 +0000 (UTC)
Subject: Performing Automated Runtime Testing - Exporting tests not described well
To: docs@lists.yoctoproject.org
From: "Barne Carstensen" <barne.carstensen@danfoss.com>
X-Originating-Location: Esbjerg, South Denmark, DK (212.112.152.133)
X-Originating-Platform: Windows Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 01:20:10 -0700
Message-ID: <VMV8.1757060410591652906.CpIm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="pcDxziqPQAtJmjRlPTtj"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Sep 2025 08:20:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7485

--pcDxziqPQAtJmjRlPTtj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I am relative new to Yocto and this is the first time I am reporting someth=
ing. So please forgive me when I am not correctly following any policy/norm=
.
I was trying out the 4 Performing Automated Runtime Testing =E2=80=94 The Y=
octo Project =C2=AE 5.2.999 documentation ( https://docs.yoctoproject.org/t=
est-manual/runtime-testing.html#exporting-tests ) on Scarthgap and especial=
ly the 4.3 Exporting Tests part.

I could reproduce and follow everything fine until the last section " Run t=
he tests outside of the build environment using the following:". Under it i=
s written:

$ cd tmp/testexport/core-image-sato
$ ./runexported.py testdata.json

But first the actual path should be tmp/ testimage /core-image-sato and als=
o there is no script runexported.py at that location or anywhere in the gen=
erated tarball. There is a oe-test script though and I was able to run all =
test via this command:
$ cd tmp/testimage/core-image-sato
$ ./oe-test runtime

But also only after running the image under test manually with QEMU (the --=
target-type qemu flag did not worked for me, because the python scripts wer=
e not passing the target IP address)

Maybe it is worth updating the commands in the document. And also if possib=
le add more description to the oe-test script or at least link to some docu=
mentation of it. I am not able to find anything about it and had to figure =
things out as good as I could via the -h (help) flag.

Best regards and thank you

Barne

--pcDxziqPQAtJmjRlPTtj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>I am relative new to Yocto and this is the first time I am reporting s=
omething. So please forgive me when I am not correctly following any policy=
/norm.<br />I was trying out the&nbsp;<a href=3D"https://docs.yoctoproject.=
org/test-manual/runtime-testing.html#exporting-tests">4 Performing Automate=
d Runtime Testing &mdash; The Yocto Project &reg; 5.2.999 documentation</a>=
 on Scarthgap and especially the 4.3 Exporting Tests part.&nbsp;<br /><br /=
>I could reproduce and follow everything fine until the last section "<span=
 style=3D"color: #333333; font-family: Verdana, Sans, sans-serif; font-size=
: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color:=
 #fcfcfc; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial; display: inline !important; float: none;=
"><span style=3D"color: #333333; font-family: Verdana, Sans, sans-serif; fo=
nt-size: 16px; font-style: normal; font-variant-ligatures: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; te=
xt-align: start; text-indent: 0px; text-transform: none; widows: 2; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background=
-color: #fcfcfc; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial; display: inline !important; float=
: none;">Run the tests outside of the build environment using the following=
:". Under it is written:<br /><br /></span></span>
<pre style=3D"box-sizing: border-box; line-height: 1.4; font-family: SFMono=
-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', Courie=
r, monospace; font-size: 12px; white-space: pre; margin: 0px; padding: 12px=
; display: block; overflow: auto; color: #333333; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial;">$ cd tmp/testexport/core-image-sato
$ ./runexported.py testdata.json</pre>
<div>&nbsp;</div>
<div>But first the actual path should be tmp/<span style=3D"text-decoration=
: underline;">testimage</span>/core-image-sato and also there is no script =
runexported.py at that location or anywhere in the generated tarball. There=
 is a oe-test script though and I was able to run all test via this command=
:</div>
<div>
<pre style=3D"box-sizing: border-box; line-height: 1.4; font-family: SFMono=
-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', Courie=
r, monospace; font-size: 12px; white-space: pre; margin: 0px; padding: 12px=
; display: block; overflow: auto; color: #333333; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial;">$ cd tmp/testimage/core-image-sato
$ ./oe-test runtime</pre>
<div><br />But also only after running the image under test manually with Q=
EMU (the --target-type qemu flag did not worked for me, because the python =
scripts were not passing the target IP address)</div>
<div>&nbsp;</div>
<div>Maybe it is worth updating the commands in the document. And also if p=
ossible add more description to the oe-test script or at least link to some=
 documentation of it. I am not able to find anything about it and had to fi=
gure things out as good as I could via the -h (help) flag.&nbsp;<br /><br /=
></div>
<div>Best regards and thank you</div>
<div>&nbsp;</div>
<div>Barne</div>
</div>
</div>

--pcDxziqPQAtJmjRlPTtj--

