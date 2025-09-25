Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09864CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:56:01 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.13988.1758812153829079510
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 07:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RkjynjQS;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: bhstalel@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3edaa784f6dso41483f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758812152; x=1759416952; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4yakklfCh0xz8YTWgRRWbXtnO5CtBxA16ooQzG0uNII=;
        b=RkjynjQScd4ov1oX/3hcQEhefooDEU7+05UaqfTJTvZhOp+DiXeJIdMBNcMXGhltvq
         unaNZpIMJpOns96leqxYi4qK9u/3mkEivCdRkId6/R8o2fhFbBBCBcW5PlRwx6vtNEiK
         HPhY7kmO0zBtfZnikII53wv0Cas9/sJUcDsriUMj4FNk8Q9W6jdsGZcgq5Ilo+e4EScH
         BfwQIQnDw3m3Am07jGtvF8KzsipFaJ1U+D+s96qzSKpWTJkUnBroDUto9OmCKU6E+PAv
         iq9aEdVRLWt8u+vqzehMP3fbdyZVsE9vkMiuvb6kIGFc9yCt/PNC0EqVRhU3dHz0MJdT
         V01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758812152; x=1759416952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yakklfCh0xz8YTWgRRWbXtnO5CtBxA16ooQzG0uNII=;
        b=PduQfE46gCb6XNh/Yi/oddZUplioOeWfSPpN4X93TngLUgWWPEfW7wVX4cBXF7JoKV
         87CKaSBJpNSdxJ/ciI/+1yj8rolvIYTMG/c5uhAPdn6f4+9PwdUR1zk4vh/l5DwCiYCE
         Hr8RwXjkXzwg6uWtEo4vOtFnpHjzihX6DeKTRJ6FkQ+hyo7BVxIAJKPHXfko55AT+jid
         4wAz7O9g2NVaq4qF1lbXGl9gn1QEMo+taxRGQazGaFjbeCwyqO4HDA89/pjIknX0wB7Q
         OQZ923bx2SeajgElsR0jzQqErdPXUggeuKB7oxKp5UPp+IAWYBAdwuBFqVLMyGN0pt2t
         ldlg==
X-Gm-Message-State: AOJu0Yznz14qyvcAfDYb/J/BUQnC16MGIkxKAJNu/T9QX6e3fqhHUSuJ
	QgBcklSqTR4dDpkFgfRvdFrfcN8Ew82WCW+85GSVDchc/kDa31u5xE8wqgpFC+lB
X-Gm-Gg: ASbGnctHbtAPnnz+vnn+vTEzCz65JEIvPMu66Y4hPwmEMcS/Bo8uHZxpFfDaYJ2qyFO
	VJ0kK/5qYI3eDys5w9dIGRr7Ur+lHfyq5iFmiXrC35IAsqvyIpeH8zj766MW2HOtJRjH0mNYTEQ
	FxtwQaJRQmvx4cvtKV1QTvHaXEb5nGGdg11f2qXgM4LzZtEoXwzbYtQ/u+9pD5Sl2WW3zZvhrQ/
	hoDfK1ue4XdKOcu3ZPvPGN+VEXoxKiTdmYtUnx5pn+GIKUyHz7E/u0yrifYqv9THyELLplqUNv2
	LrUe6DCObqK9NGvhXSyAekb/zPnFAB13LMzGSs22R55NmRAoflSrb5wUWZCu8vRubsB6Kwi34kV
	V2NybGU7fgwDIMKZw
X-Google-Smtp-Source: AGHT+IGJnAdLeiSRr/VzL3ZG3csQfkg084OUe8MppeUGqByxD+MK6SWwNn1H1xJZL2MIz2v/2O0Oqg==
X-Received: by 2002:a05:6000:2798:b0:3f5:d7c0:8e17 with SMTP id ffacd0b85a97d-40e483a6f12mr1185726f8f.5.1758812149842;
        Thu, 25 Sep 2025 07:55:49 -0700 (PDT)
Received: from techleef ([196.176.49.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fbb27sm3235493f8f.4.2025.09.25.07.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:55:49 -0700 (PDT)
From: Talel BELHAJ SALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJ SALEM <bhstalel@gmail.com>
Subject: [docs][PATCH v2] ref-manual/classes.rst: add diagram for classes used by base.bbclass
Date: Thu, 25 Sep 2025 15:55:38 +0100
Message-ID: <20250925145538.14771-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 14:56:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7602

Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/classes.rst           |   6 ++++++
 .../figures/base_bbclass_inherits.png          | Bin 0 -> 100819 bytes
 .../ref-manual/svg/base_bbclass_inherits.svg   |   4 ++++
 3 files changed, 10 insertions(+)
 create mode 100644 documentation/ref-manual/figures/base_bbclass_inherits.=
png
 create mode 100644 documentation/ref-manual/svg/base_bbclass_inherits.svg

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index 662121ed9..7854d8173 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -183,6 +183,12 @@ The class also contains some commonly used functions s=
uch as
 :term:`EXTRA_OEMAKE` variable as well as the
 arguments passed directly to ``oe_runmake``.
=20
+The following diagram
+shows how :ref:`ref-classes-base` is related to other classes:
+
+.. image:: figures/base_bbclass_inherits.png
+   :align: center
+
 .. _ref-classes-bash-completion:
=20
 ``bash-completion``
diff --git a/documentation/ref-manual/figures/base_bbclass_inherits.png b/d=
ocumentation/ref-manual/figures/base_bbclass_inherits.png
new file mode 100644
index 0000000000000000000000000000000000000000..77381ff241c15683cc21995bb03=
960120d4d0c85
GIT binary patch
literal 100819
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
NHDxWOTt)MM{|o$_MjikF

literal 0
HcmV?d00001

diff --git a/documentation/ref-manual/svg/base_bbclass_inherits.svg b/docum=
entation/ref-manual/svg/base_bbclass_inherits.svg
new file mode 100644
index 000000000..43c686677
--- /dev/null
+++ b/documentation/ref-manual/svg/base_bbclass_inherits.svg
@@ -0,0 +1,4 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<!-- Do not edit this file with editors other than draw.io -->
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics=
/SVG/1.1/DTD/svg11.dtd">
+<svg xmlns=3D"http://www.w3.org/2000/svg" style=3D"background: transparent=
; background-color: transparent; color-scheme: light dark;" xmlns:xlink=3D"=
http://www.w3.org/1999/xlink" version=3D"1.1" width=3D"782px" height=3D"111=
2px" viewBox=3D"-0.5 -0.5 782 1112" content=3D"&lt;mxfile host=3D&quot;Elec=
tron&quot; agent=3D&quot;Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36=
 (KHTML, like Gecko) draw.io/28.1.2 Chrome/138.0.7204.243 Electron/37.4.0 S=
afari/537.36&quot; version=3D&quot;28.1.2&quot; scale=3D&quot;1.5&quot; bor=
der=3D&quot;0&quot;&gt;&#10;  &lt;diagram name=3D&quot;Page-1&quot; id=3D&q=
uot;IDLP5ZLUoRp329NTn5vf&quot;&gt;&#10;    &lt;mxGraphModel dx=3D&quot;1426=
&quot; dy=3D&quot;1975&quot; grid=3D&quot;1&quot; gridSize=3D&quot;10&quot;=
 guides=3D&quot;1&quot; tooltips=3D&quot;1&quot; connect=3D&quot;1&quot; ar=
rows=3D&quot;1&quot; fold=3D&quot;1&quot; page=3D&quot;1&quot; pageScale=3D=
&quot;1&quot; pageWidth=3D&quot;850&quot; pageHeight=3D&quot;1100&quot; mat=
h=3D&quot;0&quot; shadow=3D&quot;0&quot;&gt;&#10;      &lt;root&gt;&#10;   =
     &lt;mxCell id=3D&quot;0&quot; /&gt;&#10;        &lt;mxCell id=3D&quot;=
1&quot; parent=3D&quot;0&quot; /&gt;&#10;        &lt;mxCell id=3D&quot;mLbx=
TJ1KFCbuQVyReQDL-33&quot; value=3D&quot;&amp;lt;div&amp;gt;&amp;lt;br&amp;g=
t;&amp;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D0;whiteSpace=3Dwrap;ht=
ml=3D1;fillColor=3Dnone;strokeColor=3D#36393d;fontFamily=3DNimbus Roman;fon=
tSize=3D10;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;   =
       &lt;mxGeometry x=3D&quot;190&quot; y=3D&quot;520&quot; width=3D&quot=
;130&quot; height=3D&quot;210&quot; as=3D&quot;geometry&quot; /&gt;&#10;   =
     &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL=
-13&quot; value=3D&quot;&amp;lt;div&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/div&a=
mp;gt;&quot; style=3D&quot;rounded=3D0;whiteSpace=3Dwrap;html=3D1;fillColor=
=3Dnone;strokeColor=3D#36393d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot=
; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeo=
metry x=3D&quot;40&quot; y=3D&quot;200&quot; width=3D&quot;280&quot; height=
=3D&quot;310&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&=
gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-3&quot; style=3D=
&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettyS=
ize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;endArrow=3D=
blockThin;endFill=3D0;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=
=3D&quot;1&quot; source=3D&quot;mLbxTJ1KFCbuQVyReQDL-1&quot; target=3D&quot=
;mLbxTJ1KFCbuQVyReQDL-2&quot; edge=3D&quot;1&quot;&gt;&#10;          &lt;mx=
Geometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#10;     =
   &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-1=
3&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogona=
lLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=
=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DblockThin;e=
ndFill=3D0;&quot; parent=3D&quot;1&quot; source=3D&quot;mLbxTJ1KFCbuQVyReQD=
L-1&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL-22&quot; edge=3D&quot;1&quot;=
&gt;&#10;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geome=
try&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&qu=
ot;mLbxTJ1KFCbuQVyReQDL-1&quot; value=3D&quot;&amp;lt;div&amp;gt;&amp;lt;fo=
nt&amp;gt;meta&amp;lt;/font&amp;gt;&amp;lt;/div&amp;gt;&quot; style=3D&quot=
;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DNimbus Roman;fontSize=
=3D10;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;        =
  &lt;mxGeometry x=3D&quot;140&quot; y=3D&quot;-10&quot; width=3D&quot;80&q=
uot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &l=
t;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-5&quot=
; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=
=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;=
entryX=3D0.25;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DblockThin;endFi=
ll=3D0;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot=
; source=3D&quot;mLbxTJ1KFCbuQVyReQDL-2&quot; target=3D&quot;mLbxTJ1KFCbuQV=
yReQDL-13&quot; edge=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry relat=
ive=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell=
&gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-2&quot; value=
=3D&quot;&amp;lt;div&amp;gt;&amp;lt;font&amp;gt;classes-global&amp;lt;/font=
&amp;gt;&amp;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dw=
rap;html=3D1;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;=
1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;7=
0&quot; y=3D&quot;70&quot; width=3D&quot;80&quot; height=3D&quot;40&quot; a=
s=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;=
mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-44&quot; style=3D&quot;edgeStyle=3Do=
rthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1=
;entryX=3D0.5;entryY=3D1;entryDx=3D0;entryDy=3D0;endArrow=3DblockThin;endFi=
ll=3D0;dashed=3D1;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&=
quot;1&quot; source=3D&quot;mLbxTJ1KFCbuQVyReQDL-6&quot; target=3D&quot;KqB=
Vfwb0AsbTkkaLkWwC-15&quot; edge=3D&quot;1&quot;&gt;&#10;          &lt;mxGeo=
metry relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#10;          =
  &lt;mxPoint x=3D&quot;370&quot; y=3D&quot;190&quot; as=3D&quot;targetPoin=
t&quot; /&gt;&#10;          &lt;/mxGeometry&gt;&#10;        &lt;/mxCell&gt;=
&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-6&quot; value=3D&qu=
ot;&amp;lt;div&amp;gt;patch.bbclass&amp;lt;/div&amp;gt;&quot; style=3D&quot=
;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;strokeColor=3D#=
36393d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot=
; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;200&quo=
t; y=3D&quot;210&quot; width=3D&quot;110&quot; height=3D&quot;40&quot; as=
=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;m=
xCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-8&quot; value=3D&quot;&amp;lt;div&amp=
;gt;staging.bbclass&amp;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D1;whi=
teSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;strokeColor=3D#36393d;fontFamil=
y=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot; vertex=3D&quot=
;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;200&quot; y=3D&quot;260=
&quot; width=3D&quot;110&quot; height=3D&quot;40&quot; as=3D&quot;geometry&=
quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;m=
LbxTJ1KFCbuQVyReQDL-9&quot; value=3D&quot;&amp;lt;div&amp;gt;mirrors.bbclas=
s&amp;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;htm=
l=3D1;fillColor=3D#eeeeee;strokeColor=3D#36393d;fontFamily=3DNimbus Roman;f=
ontSize=3D10;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10; =
         &lt;mxGeometry x=3D&quot;200&quot; y=3D&quot;310&quot; width=3D&qu=
ot;110&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;  =
      &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQD=
L-10&quot; value=3D&quot;&amp;lt;div&amp;gt;utils.bbclass&amp;lt;/div&amp;g=
t;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#=
eeeeee;strokeColor=3D#36393d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot;=
 parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeom=
etry x=3D&quot;200&quot; y=3D&quot;360&quot; width=3D&quot;110&quot; height=
=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&g=
t;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-11&quot; value=3D=
&quot;&amp;lt;div&amp;gt;utility-tasks.bbclass&amp;lt;/div&amp;gt;&quot; st=
yle=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;stro=
keColor=3D#36393d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&=
quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&q=
uot;200&quot; y=3D&quot;410&quot; width=3D&quot;110&quot; height=3D&quot;40=
&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;    =
    &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-12&quot; value=3D&quot;&amp;=
lt;div&amp;gt;logging.bbclass&amp;lt;/div&amp;gt;&quot; style=3D&quot;round=
ed=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;strokeColor=3D#36393d=
;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot; vert=
ex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;200&quot; y=
=3D&quot;460&quot; width=3D&quot;110&quot; height=3D&quot;40&quot; as=3D&qu=
ot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell =
id=3D&quot;mLbxTJ1KFCbuQVyReQDL-21&quot; value=3D&quot;&amp;lt;div&amp;gt;i=
nherit&amp;lt;/div&amp;gt;&quot; style=3D&quot;text;html=3D1;align=3Dcenter=
;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;strokeColor=
=3Dnone;fillColor=3Dnone;fontFamily=3DNimbus Roman;fontSize=3D10;rotation=
=3D-90;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;       =
   &lt;mxGeometry x=3D&quot;140&quot; y=3D&quot;330&quot; width=3D&quot;50&=
quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &=
lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-14&qu=
ot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoo=
p=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0=
;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DblockThin;endFi=
ll=3D0;&quot; parent=3D&quot;1&quot; source=3D&quot;mLbxTJ1KFCbuQVyReQDL-22=
&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL-24&quot; edge=3D&quot;1&quot;&gt=
;&#10;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry=
&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;=
KqBVfwb0AsbTkkaLkWwC-16&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle=
;rounded=3D0;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=
=3D1;exitDx=3D0;exitDy=3D0;endArrow=3DblockThin;endFill=3D0;&quot; parent=
=3D&quot;1&quot; source=3D&quot;mLbxTJ1KFCbuQVyReQDL-22&quot; target=3D&quo=
t;KqBVfwb0AsbTkkaLkWwC-15&quot; edge=3D&quot;1&quot;&gt;&#10;          &lt;=
mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#10;   =
     &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC=
-17&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogo=
nalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exit=
Dy=3D0;endArrow=3DblockThin;endFill=3D0;&quot; parent=3D&quot;1&quot; sourc=
e=3D&quot;mLbxTJ1KFCbuQVyReQDL-22&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL=
-27&quot; edge=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry relative=3D=
&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#=
10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-22&quot; value=3D&quo=
t;&amp;lt;div&amp;gt;classes&amp;lt;/div&amp;gt;&quot; style=3D&quot;rounde=
d=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DNimbus Roman;fontSize=3D10;&q=
uot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mx=
Geometry x=3D&quot;200&quot; y=3D&quot;70&quot; width=3D&quot;110&quot; hei=
ght=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCel=
l&gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-24&quot; value=
=3D&quot;&amp;lt;div&amp;gt;metadata_scm.bbclass&amp;lt;/div&amp;gt;&quot; =
style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;st=
rokeColor=3D#36393d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=
=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=
=3D&quot;200&quot; y=3D&quot;150&quot; width=3D&quot;110&quot; height=3D&qu=
ot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10=
;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-34&quot; style=3D&quot;=
edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettySize=3D=
auto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;endArrow=3DblockT=
hin;endFill=3D0;entryX=3D1;entryY=3D0.5;entryDx=3D0;entryDy=3D0;fontFamily=
=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot; source=3D&quot;=
mLbxTJ1KFCbuQVyReQDL-27&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL-33&quot; =
edge=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry relative=3D&quot;1&qu=
ot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;       =
 &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-27&quot; value=3D&quot;&amp;lt;=
div&amp;gt;toolchain&amp;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D1;wh=
iteSpace=3Dwrap;html=3D1;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; par=
ent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry=
 x=3D&quot;450&quot; y=3D&quot;150&quot; width=3D&quot;110&quot; height=3D&=
quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#=
10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-29&quot; value=3D&quo=
t;&amp;lt;div&amp;gt;gcc.bbclass&amp;lt;/div&amp;gt;&quot; style=3D&quot;ro=
unded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;strokeColor=3D#363=
93d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot; v=
ertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;200&quot; =
y=3D&quot;530&quot; width=3D&quot;110&quot; height=3D&quot;40&quot; as=3D&q=
uot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell=
 id=3D&quot;mLbxTJ1KFCbuQVyReQDL-30&quot; value=3D&quot;&amp;lt;div&amp;gt;=
gcc-native.bbclass&amp;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D1;whit=
eSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;strokeColor=3D#36393d;fontFamily=
=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot; vertex=3D&quot;=
1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;200&quot; y=3D&quot;580&=
quot; width=3D&quot;110&quot; height=3D&quot;40&quot; as=3D&quot;geometry&q=
uot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;mL=
bxTJ1KFCbuQVyReQDL-31&quot; value=3D&quot;&amp;lt;div&amp;gt;clang.bbclass&=
amp;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=
=3D1;fillColor=3D#eeeeee;strokeColor=3D#36393d;fontFamily=3DNimbus Roman;fo=
ntSize=3D10;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;  =
        &lt;mxGeometry x=3D&quot;200&quot; y=3D&quot;630&quot; width=3D&quo=
t;110&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;   =
     &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL=
-32&quot; value=3D&quot;&amp;lt;div&amp;gt;clang-native.bbclass&amp;lt;/div=
&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillCol=
or=3D#eeeeee;strokeColor=3D#36393d;fontFamily=3DNimbus Roman;fontSize=3D10;=
&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;=
mxGeometry x=3D&quot;200&quot; y=3D&quot;680&quot; width=3D&quot;110&quot; =
height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mx=
Cell&gt;&#10;        &lt;mxCell id=3D&quot;mLbxTJ1KFCbuQVyReQDL-45&quot; va=
lue=3D&quot;&amp;lt;div&amp;gt;inherit_defer&amp;lt;/div&amp;gt;&quot; styl=
e=3D&quot;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0=
;points=3D[];autosize=3D1;strokeColor=3Dnone;fillColor=3Dnone;rotation=3D-9=
0;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&quot; ver=
tex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;60&quot; y=
=3D&quot;330&quot; width=3D&quot;70&quot; height=3D&quot;30&quot; as=3D&quo=
t;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell i=
d=3D&quot;mLbxTJ1KFCbuQVyReQDL-46&quot; value=3D&quot;&amp;lt;div&amp;gt;in=
herit&amp;lt;/div&amp;gt;&quot; style=3D&quot;text;html=3D1;align=3Dcenter;=
verticalAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;strokeColor=
=3Dnone;fillColor=3Dnone;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; par=
ent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry=
 x=3D&quot;330&quot; y=3D&quot;230&quot; width=3D&quot;50&quot; height=3D&q=
uot;30&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#1=
0;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-3&quot; style=3D&quot;=
edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettySize=3D=
auto;html=3D1;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=3D0;entryX=3D0;entryY=
=3D0.5;entryDx=3D0;entryDy=3D0;endArrow=3DblockThin;endFill=3D0;dashed=3D1;=
&quot; parent=3D&quot;1&quot; source=3D&quot;KqBVfwb0AsbTkkaLkWwC-2&quot; t=
arget=3D&quot;mLbxTJ1KFCbuQVyReQDL-6&quot; edge=3D&quot;1&quot;&gt;&#10;   =
       &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&=
gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0A=
sbTkkaLkWwC-4&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=
=3D0;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D1;exitY=3D0.5;exi=
tDx=3D0;exitDy=3D0;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;dashed=
=3D1;endArrow=3DblockThin;endFill=3D0;&quot; parent=3D&quot;1&quot; source=
=3D&quot;KqBVfwb0AsbTkkaLkWwC-2&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL-2=
4&quot; edge=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry relative=3D&q=
uot;1&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10=
;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-5&quot; style=3D&quot;e=
dgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettySize=3Da=
uto;html=3D1;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=3D0;entryX=3D0;entryY=
=3D0.5;entryDx=3D0;entryDy=3D0;endArrow=3DblockThin;endFill=3D0;dashed=3D1;=
&quot; parent=3D&quot;1&quot; source=3D&quot;KqBVfwb0AsbTkkaLkWwC-2&quot; t=
arget=3D&quot;mLbxTJ1KFCbuQVyReQDL-8&quot; edge=3D&quot;1&quot;&gt;&#10;   =
       &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&=
gt;&#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0A=
sbTkkaLkWwC-6&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=
=3D0;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D1;exitY=3D0.5;exi=
tDx=3D0;exitDy=3D0;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;endArrow=
=3DblockThin;endFill=3D0;dashed=3D1;&quot; parent=3D&quot;1&quot; source=3D=
&quot;KqBVfwb0AsbTkkaLkWwC-2&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL-9&qu=
ot; edge=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry relative=3D&quot;=
1&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;   =
     &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-7&quot; style=3D&quot;edgeS=
tyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettySize=3Dauto;=
html=3D1;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=3D0;entryX=3D0;entryY=3D0.=
5;entryDx=3D0;entryDy=3D0;endArrow=3DblockThin;endFill=3D0;dashed=3D1;&quot=
; parent=3D&quot;1&quot; source=3D&quot;KqBVfwb0AsbTkkaLkWwC-2&quot; target=
=3D&quot;mLbxTJ1KFCbuQVyReQDL-10&quot; edge=3D&quot;1&quot;&gt;&#10;       =
   &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&=
#10;        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTk=
kaLkWwC-8&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;o=
rthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D1;exitY=3D0.5;exitDx=3D=
0;exitDy=3D0;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;endArrow=3Dblo=
ckThin;endFill=3D0;dashed=3D1;&quot; parent=3D&quot;1&quot; source=3D&quot;=
KqBVfwb0AsbTkkaLkWwC-2&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL-11&quot; e=
dge=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry relative=3D&quot;1&quo=
t; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        =
&lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-9&quot; style=3D&quot;edgeStyle=
=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettySize=3Dauto;html=
=3D1;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=3D0;entryX=3D0;entryY=3D0.5;en=
tryDx=3D0;entryDy=3D0;endArrow=3DblockThin;endFill=3D0;dashed=3D1;&quot; pa=
rent=3D&quot;1&quot; source=3D&quot;KqBVfwb0AsbTkkaLkWwC-2&quot; target=3D&=
quot;mLbxTJ1KFCbuQVyReQDL-12&quot; edge=3D&quot;1&quot;&gt;&#10;          &=
lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#10;=
        &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLk=
WwC-10&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orth=
ogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;e=
xitDy=3D0;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;dashed=3D1;endArr=
ow=3DblockThin;endFill=3D0;&quot; parent=3D&quot;1&quot; source=3D&quot;KqB=
Vfwb0AsbTkkaLkWwC-2&quot; target=3D&quot;mLbxTJ1KFCbuQVyReQDL-29&quot; edge=
=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry relative=3D&quot;1&quot; =
as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;        &lt=
;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-11&quot; style=3D&quot;edgeStyle=3D=
orthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;jettySize=3Dauto;html=3D=
1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;entryX=3D0;entryY=3D0.5;entry=
Dx=3D0;entryDy=3D0;dashed=3D1;endArrow=3DblockThin;endFill=3D0;&quot; paren=
t=3D&quot;1&quot; source=3D&quot;KqBVfwb0AsbTkkaLkWwC-2&quot; target=3D&quo=
t;mLbxTJ1KFCbuQVyReQDL-30&quot; edge=3D&quot;1&quot;&gt;&#10;          &lt;=
mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#10;   =
     &lt;/mxCell&gt;&#10;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC=
-2&quot; value=3D&quot;&amp;lt;div&amp;gt;base.bbclass&amp;lt;/div&amp;gt;&=
quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eee=
eee;strokeColor=3D#36393d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; pa=
rent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometr=
y x=3D&quot;50&quot; y=3D&quot;210&quot; width=3D&quot;110&quot; height=3D&=
quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#=
10;        &lt;mxCell id=3D&quot;KqBVfwb0AsbTkkaLkWwC-15&quot; value=3D&quo=
t;&amp;lt;div&amp;gt;terminal.bbclass&amp;lt;/div&amp;gt;&quot; style=3D&qu=
ot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;strokeColor=
=3D#36393d;fontFamily=3DNimbus Roman;fontSize=3D10;&quot; parent=3D&quot;1&=
quot; vertex=3D&quot;1&quot;&gt;&#10;          &lt;mxGeometry x=3D&quot;330=
&quot; y=3D&quot;150&quot; width=3D&quot;110&quot; height=3D&quot;40&quot; =
as=3D&quot;geometry&quot; /&gt;&#10;        &lt;/mxCell&gt;&#10;      &lt;/=
root&gt;&#10;    &lt;/mxGraphModel&gt;&#10;  &lt;/diagram&gt;&#10;&lt;/mxfi=
le&gt;&#10;"><defs/><g><g data-cell-id=3D"0"><g data-cell-id=3D"1"><g data-=
cell-id=3D"mLbxTJ1KFCbuQVyReQDL-33"><g><rect x=3D"225" y=3D"795" width=3D"1=
95" height=3D"315" fill=3D"none" stroke=3D"#36393d" stroke-width=3D"1.5" po=
inter-events=3D"all" style=3D"stroke: rgb(54, 57, 61);"/></g><g><g transfor=
m=3D"scale(1.5)"><switch><foreignObject style=3D"overflow: visible; text-al=
ign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 128px; height: 1px; padding-=
top: 635px; margin-left: 151px;"><div style=3D"box-sizing: border-box; font=
-size: 0; text-align: center; color: #000000; "><div style=3D"display: inli=
ne-block; font-size: 10px; font-family: &quot;Nimbus Roman&quot;; color: li=
ght-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-sp=
ace: normal; word-wrap: normal; "><div><br /></div></div></div></div></fore=
ignObject><text x=3D"215" y=3D"638" fill=3D"light-dark(#000000, #ffffff)" f=
ont-family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anchor=3D"m=
iddle">&#xa;</text></switch></g></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyR=
eQDL-13"><g><rect x=3D"0" y=3D"315" width=3D"420" height=3D"465" fill=3D"no=
ne" stroke=3D"#36393d" stroke-width=3D"1.5" pointer-events=3D"all" style=3D=
"stroke: rgb(54, 57, 61);"/></g><g><g transform=3D"scale(1.5)"><switch><for=
eignObject style=3D"overflow: visible; text-align: left;" pointer-events=3D=
"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org=
/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml=
" style=3D"display: flex; align-items: unsafe center; justify-content: unsa=
fe center; width: 278px; height: 1px; padding-top: 365px; margin-left: 1px;=
"><div style=3D"box-sizing: border-box; font-size: 0; text-align: center; c=
olor: #000000; "><div style=3D"display: inline-block; font-size: 10px; font=
-family: &quot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff); lin=
e-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal;=
 "><div><br /></div></div></div></div></foreignObject><text x=3D"140" y=3D"=
368" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roma=
n&quot;" font-size=3D"10px" text-anchor=3D"middle">&#xa;</text></switch></g=
></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-3"><g><path d=3D"M 210 60 =
L 210 90 L 105 90 L 105 107.82" fill=3D"none" stroke=3D"#000000" stroke-wid=
th=3D"1.5" stroke-miterlimit=3D"10" pointer-events=3D"stroke" style=3D"stro=
ke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/><path d=3D"M 105 118.32=
 L 101.5 107.82 L 108.5 107.82 Z" fill=3D"none" stroke=3D"#000000" stroke-w=
idth=3D"1.5" stroke-miterlimit=3D"10" pointer-events=3D"all" style=3D"strok=
e: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/></g></g><g data-cell-id=
=3D"KqBVfwb0AsbTkkaLkWwC-13"><g><path d=3D"M 210 60 L 210 90 L 322.5 90 L 3=
22.5 107.82" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-m=
iterlimit=3D"10" pointer-events=3D"stroke" style=3D"stroke: light-dark(rgb(=
0, 0, 0), rgb(255, 255, 255));"/><path d=3D"M 322.5 118.32 L 319 107.82 L 3=
26 107.82 Z" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-m=
iterlimit=3D"10" pointer-events=3D"all" style=3D"stroke: light-dark(rgb(0, =
0, 0), rgb(255, 255, 255));"/></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQ=
DL-1"><g><rect x=3D"150" y=3D"0" width=3D"120" height=3D"60" rx=3D"9" ry=3D=
"9" fill=3D"#ffffff" stroke=3D"#000000" stroke-width=3D"1.5" pointer-events=
=3D"all" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212));=
 stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/></g><g><g transfor=
m=3D"scale(1.5)"><switch><foreignObject style=3D"overflow: visible; text-al=
ign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 78px; height: 1px; padding-t=
op: 20px; margin-left: 101px;"><div style=3D"box-sizing: border-box; font-s=
ize: 0; text-align: center; color: #000000; "><div style=3D"display: inline=
-block; font-size: 10px; font-family: &quot;Nimbus Roman&quot;; color: ligh=
t-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-spac=
e: normal; word-wrap: normal; "><div><font>meta</font></div></div></div></d=
iv></foreignObject><text x=3D"140" y=3D"23" fill=3D"light-dark(#000000, #ff=
ffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anc=
hor=3D"middle">meta</text></switch></g></g></g><g data-cell-id=3D"mLbxTJ1KF=
CbuQVyReQDL-5"><g><path d=3D"M 105 180 L 105 302.82" fill=3D"none" stroke=
=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" pointer-events=
=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"=
/><path d=3D"M 105 313.32 L 101.5 302.82 L 108.5 302.82 Z" fill=3D"none" st=
roke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" pointer-even=
ts=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/=
></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-2"><g><rect x=3D"45" y=3D"=
120" width=3D"120" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#ffffff" stroke=
=3D"#000000" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"fill: lig=
ht-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, =
0, 0), rgb(255, 255, 255));"/></g><g><g transform=3D"scale(1.5)"><switch><f=
oreignObject style=3D"overflow: visible; text-align: left;" pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 78px; height: 1px; padding-top: 100px; margin-left: 31=
px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: center=
; color: #000000; "><div style=3D"display: inline-block; font-size: 10px; f=
ont-family: &quot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff); =
line-height: 1.2; pointer-events: all; white-space: normal; word-wrap: norm=
al; "><div><font>classes-global</font></div></div></div></div></foreignObje=
ct><text x=3D"70" y=3D"103" fill=3D"light-dark(#000000, #ffffff)" font-fami=
ly=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anchor=3D"middle">c=
lasses-global</text></switch></g></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVy=
ReQDL-44"><g><path d=3D"M 405 360 L 517.5 360 L 517.5 312.18" fill=3D"none"=
 stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" stroke-da=
sharray=3D"4.5 4.5" pointer-events=3D"stroke" style=3D"stroke: light-dark(r=
gb(0, 0, 0), rgb(255, 255, 255));"/><path d=3D"M 517.5 301.68 L 521 312.18 =
L 514 312.18 Z" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" strok=
e-miterlimit=3D"10" pointer-events=3D"all" style=3D"stroke: light-dark(rgb(=
0, 0, 0), rgb(255, 255, 255));"/></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVy=
ReQDL-6"><g><rect x=3D"240" y=3D"330" width=3D"165" height=3D"60" rx=3D"9" =
ry=3D"9" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"1.5" pointer-e=
vents=3D"all" style=3D"fill: rgb(238, 238, 238); stroke: rgb(54, 57, 61);"/=
></g><g><g transform=3D"scale(1.5)"><switch><foreignObject style=3D"overflo=
w: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" heigh=
t=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibi=
lity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; a=
lign-items: unsafe center; justify-content: unsafe center; width: 108px; he=
ight: 1px; padding-top: 240px; margin-left: 161px;"><div style=3D"box-sizin=
g: border-box; font-size: 0; text-align: center; color: #000000; "><div sty=
le=3D"display: inline-block; font-size: 10px; font-family: &quot;Nimbus Rom=
an&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-ev=
ents: all; white-space: normal; word-wrap: normal; "><div>patch.bbclass</di=
v></div></div></div></foreignObject><text x=3D"215" y=3D"243" fill=3D"light=
-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=
=3D"10px" text-anchor=3D"middle">patch.bbclass</text></switch></g></g></g><=
g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-8"><g><rect x=3D"240" y=3D"405" widt=
h=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" stroke=3D"#36393=
d" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"fill: rgb(238, 238,=
 238); stroke: rgb(54, 57, 61);"/></g><g><g transform=3D"scale(1.5)"><switc=
h><foreignObject style=3D"overflow: visible; text-align: left;" pointer-eve=
nts=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.=
w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999=
/xhtml" style=3D"display: flex; align-items: unsafe center; justify-content=
: unsafe center; width: 108px; height: 1px; padding-top: 290px; margin-left=
: 161px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: c=
enter; color: #000000; "><div style=3D"display: inline-block; font-size: 10=
px; font-family: &quot;Nimbus Roman&quot;; color: light-dark(#000000, #ffff=
ff); line-height: 1.2; pointer-events: all; white-space: normal; word-wrap:=
 normal; "><div>staging.bbclass</div></div></div></div></foreignObject><tex=
t x=3D"215" y=3D"293" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"=
&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anchor=3D"middle">staging=
.bbclass</text></switch></g></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL=
-9"><g><rect x=3D"240" y=3D"480" width=3D"165" height=3D"60" rx=3D"9" ry=3D=
"9" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"1.5" pointer-events=
=3D"all" style=3D"fill: rgb(238, 238, 238); stroke: rgb(54, 57, 61);"/></g>=
<g><g transform=3D"scale(1.5)"><switch><foreignObject style=3D"overflow: vi=
sible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"=
100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"=
><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-=
items: unsafe center; justify-content: unsafe center; width: 108px; height:=
 1px; padding-top: 340px; margin-left: 161px;"><div style=3D"box-sizing: bo=
rder-box; font-size: 0; text-align: center; color: #000000; "><div style=3D=
"display: inline-block; font-size: 10px; font-family: &quot;Nimbus Roman&qu=
ot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events:=
 all; white-space: normal; word-wrap: normal; "><div>mirrors.bbclass</div><=
/div></div></div></foreignObject><text x=3D"215" y=3D"343" fill=3D"light-da=
rk(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=3D=
"10px" text-anchor=3D"middle">mirrors.bbclass</text></switch></g></g></g><g=
 data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-10"><g><rect x=3D"240" y=3D"555" widt=
h=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" stroke=3D"#36393=
d" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"fill: rgb(238, 238,=
 238); stroke: rgb(54, 57, 61);"/></g><g><g transform=3D"scale(1.5)"><switc=
h><foreignObject style=3D"overflow: visible; text-align: left;" pointer-eve=
nts=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.=
w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999=
/xhtml" style=3D"display: flex; align-items: unsafe center; justify-content=
: unsafe center; width: 108px; height: 1px; padding-top: 390px; margin-left=
: 161px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: c=
enter; color: #000000; "><div style=3D"display: inline-block; font-size: 10=
px; font-family: &quot;Nimbus Roman&quot;; color: light-dark(#000000, #ffff=
ff); line-height: 1.2; pointer-events: all; white-space: normal; word-wrap:=
 normal; "><div>utils.bbclass</div></div></div></div></foreignObject><text =
x=3D"215" y=3D"393" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&q=
uot;Nimbus Roman&quot;" font-size=3D"10px" text-anchor=3D"middle">utils.bbc=
lass</text></switch></g></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-11"=
><g><rect x=3D"240" y=3D"630" width=3D"165" height=3D"60" rx=3D"9" ry=3D"9"=
 fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"1.5" pointer-events=3D=
"all" style=3D"fill: rgb(238, 238, 238); stroke: rgb(54, 57, 61);"/></g><g>=
<g transform=3D"scale(1.5)"><switch><foreignObject style=3D"overflow: visib=
le; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100=
%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><d=
iv xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-ite=
ms: unsafe center; justify-content: unsafe center; width: 108px; height: 1p=
x; padding-top: 440px; margin-left: 161px;"><div style=3D"box-sizing: borde=
r-box; font-size: 0; text-align: center; color: #000000; "><div style=3D"di=
splay: inline-block; font-size: 10px; font-family: &quot;Nimbus Roman&quot;=
; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: al=
l; white-space: normal; word-wrap: normal; "><div>utility-tasks.bbclass</di=
v></div></div></div></foreignObject><text x=3D"215" y=3D"443" fill=3D"light=
-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=
=3D"10px" text-anchor=3D"middle">utility-tasks.bbclass</text></switch></g><=
/g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-12"><g><rect x=3D"240" y=3D"=
705" width=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" stroke=
=3D"#36393d" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"fill: rgb=
(238, 238, 238); stroke: rgb(54, 57, 61);"/></g><g><g transform=3D"scale(1.=
5)"><switch><foreignObject style=3D"overflow: visible; text-align: left;" p=
ointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"h=
ttp://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w=
3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justi=
fy-content: unsafe center; width: 108px; height: 1px; padding-top: 490px; m=
argin-left: 161px;"><div style=3D"box-sizing: border-box; font-size: 0; tex=
t-align: center; color: #000000; "><div style=3D"display: inline-block; fon=
t-size: 10px; font-family: &quot;Nimbus Roman&quot;; color: light-dark(#000=
000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; =
word-wrap: normal; "><div>logging.bbclass</div></div></div></div></foreignO=
bject><text x=3D"215" y=3D"493" fill=3D"light-dark(#000000, #ffffff)" font-=
family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anchor=3D"middl=
e">logging.bbclass</text></switch></g></g></g><g data-cell-id=3D"mLbxTJ1KFC=
buQVyReQDL-21"><g><rect x=3D"150" y=3D"510" width=3D"75" height=3D"45" fill=
=3D"none" stroke=3D"none" transform=3D"rotate(-90,187.5,532.5)" pointer-eve=
nts=3D"all"/></g><g><g transform=3D"scale(1.5)rotate(-90 125 355)"><switch>=
<foreignObject style=3D"overflow: visible; text-align: left;" pointer-event=
s=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3=
.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/x=
html" style=3D"display: flex; align-items: unsafe center; justify-content: =
unsafe center; width: 1px; height: 1px; padding-top: 355px; margin-left: 12=
5px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cente=
r; color: #000000; "><div style=3D"display: inline-block; font-size: 10px; =
font-family: &quot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff);=
 line-height: 1.2; pointer-events: all; white-space: nowrap; "><div>inherit=
</div></div></div></div></foreignObject><text x=3D"125" y=3D"358" fill=3D"l=
ight-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-=
size=3D"10px" text-anchor=3D"middle">inherit</text></switch></g></g></g><g =
data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-14"><g><path d=3D"M 322.5 180 L 322.5 =
227.82" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterl=
imit=3D"10" pointer-events=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0,=
 0), rgb(255, 255, 255));"/><path d=3D"M 322.5 238.32 L 319 227.82 L 326 22=
7.82 Z" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterl=
imit=3D"10" pointer-events=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0)=
, rgb(255, 255, 255));"/></g></g><g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-16=
"><g><path d=3D"M 322.5 180 L 322.5 210 L 517.5 210 L 517.5 227.82" fill=3D=
"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" poi=
nter-events=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 2=
55, 255));"/><path d=3D"M 517.5 238.32 L 514 227.82 L 521 227.82 Z" fill=3D=
"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" poi=
nter-events=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255,=
 255));"/></g></g><g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-17"><g><path d=3D=
"M 322.5 180 L 322.5 210 L 697.5 210 L 697.5 227.82" fill=3D"none" stroke=
=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" pointer-events=
=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"=
/><path d=3D"M 697.5 238.32 L 694 227.82 L 701 227.82 Z" fill=3D"none" stro=
ke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" pointer-events=
=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/><=
/g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-22"><g><rect x=3D"240" y=3D"=
120" width=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#ffffff" stroke=
=3D"#000000" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"fill: lig=
ht-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, =
0, 0), rgb(255, 255, 255));"/></g><g><g transform=3D"scale(1.5)"><switch><f=
oreignObject style=3D"overflow: visible; text-align: left;" pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 108px; height: 1px; padding-top: 100px; margin-left: 1=
61px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cent=
er; color: #000000; "><div style=3D"display: inline-block; font-size: 10px;=
 font-family: &quot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff)=
; line-height: 1.2; pointer-events: all; white-space: normal; word-wrap: no=
rmal; "><div>classes</div></div></div></div></foreignObject><text x=3D"215"=
 y=3D"103" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbu=
s Roman&quot;" font-size=3D"10px" text-anchor=3D"middle">classes</text></sw=
itch></g></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-24"><g><rect x=3D"=
240" y=3D"240" width=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#eeeee=
e" stroke=3D"#36393d" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"=
fill: rgb(238, 238, 238); stroke: rgb(54, 57, 61);"/></g><g><g transform=3D=
"scale(1.5)"><switch><foreignObject style=3D"overflow: visible; text-align:=
 left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeat=
ures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"htt=
p://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cent=
er; justify-content: unsafe center; width: 108px; height: 1px; padding-top:=
 180px; margin-left: 161px;"><div style=3D"box-sizing: border-box; font-siz=
e: 0; text-align: center; color: #000000; "><div style=3D"display: inline-b=
lock; font-size: 10px; font-family: &quot;Nimbus Roman&quot;; color: light-=
dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space:=
 normal; word-wrap: normal; "><div>metadata_scm.bbclass</div></div></div></=
div></foreignObject><text x=3D"215" y=3D"183" fill=3D"light-dark(#000000, #=
ffffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-a=
nchor=3D"middle">metadata_scm.bbclass</text></switch></g></g></g><g data-ce=
ll-id=3D"mLbxTJ1KFCbuQVyReQDL-34"><g><path d=3D"M 697.5 300 L 697.5 952.5 L=
 432.18 952.5" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke=
-miterlimit=3D"10" pointer-events=3D"stroke" style=3D"stroke: light-dark(rg=
b(0, 0, 0), rgb(255, 255, 255));"/><path d=3D"M 421.68 952.5 L 432.18 949 L=
 432.18 956 Z" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke=
-miterlimit=3D"10" pointer-events=3D"all" style=3D"stroke: light-dark(rgb(0=
, 0, 0), rgb(255, 255, 255));"/></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyR=
eQDL-27"><g><rect x=3D"615" y=3D"240" width=3D"165" height=3D"60" rx=3D"9" =
ry=3D"9" fill=3D"#ffffff" stroke=3D"#000000" stroke-width=3D"1.5" pointer-e=
vents=3D"all" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #1212=
12)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/></g><g><g tra=
nsform=3D"scale(1.5)"><switch><foreignObject style=3D"overflow: visible; te=
xt-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" req=
uiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xml=
ns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: un=
safe center; justify-content: unsafe center; width: 108px; height: 1px; pad=
ding-top: 180px; margin-left: 411px;"><div style=3D"box-sizing: border-box;=
 font-size: 0; text-align: center; color: #000000; "><div style=3D"display:=
 inline-block; font-size: 10px; font-family: &quot;Nimbus Roman&quot;; colo=
r: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; whi=
te-space: normal; word-wrap: normal; "><div>toolchain</div></div></div></di=
v></foreignObject><text x=3D"465" y=3D"183" fill=3D"light-dark(#000000, #ff=
ffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anc=
hor=3D"middle">toolchain</text></switch></g></g></g><g data-cell-id=3D"mLbx=
TJ1KFCbuQVyReQDL-29"><g><rect x=3D"240" y=3D"810" width=3D"165" height=3D"6=
0" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"1.=
5" pointer-events=3D"all" style=3D"fill: rgb(238, 238, 238); stroke: rgb(54=
, 57, 61);"/></g><g><g transform=3D"scale(1.5)"><switch><foreignObject styl=
e=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"disp=
lay: flex; align-items: unsafe center; justify-content: unsafe center; widt=
h: 108px; height: 1px; padding-top: 560px; margin-left: 161px;"><div style=
=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #00000=
0; "><div style=3D"display: inline-block; font-size: 10px; font-family: &qu=
ot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff); line-height: 1.=
2; pointer-events: all; white-space: normal; word-wrap: normal; "><div>gcc.=
bbclass</div></div></div></div></foreignObject><text x=3D"215" y=3D"563" fi=
ll=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&quot;=
" font-size=3D"10px" text-anchor=3D"middle">gcc.bbclass</text></switch></g>=
</g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-30"><g><rect x=3D"240" y=3D=
"885" width=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" stroke=
=3D"#36393d" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"fill: rgb=
(238, 238, 238); stroke: rgb(54, 57, 61);"/></g><g><g transform=3D"scale(1.=
5)"><switch><foreignObject style=3D"overflow: visible; text-align: left;" p=
ointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"h=
ttp://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w=
3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justi=
fy-content: unsafe center; width: 108px; height: 1px; padding-top: 610px; m=
argin-left: 161px;"><div style=3D"box-sizing: border-box; font-size: 0; tex=
t-align: center; color: #000000; "><div style=3D"display: inline-block; fon=
t-size: 10px; font-family: &quot;Nimbus Roman&quot;; color: light-dark(#000=
000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; =
word-wrap: normal; "><div>gcc-native.bbclass</div></div></div></div></forei=
gnObject><text x=3D"215" y=3D"613" fill=3D"light-dark(#000000, #ffffff)" fo=
nt-family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anchor=3D"mi=
ddle">gcc-native.bbclass</text></switch></g></g></g><g data-cell-id=3D"mLbx=
TJ1KFCbuQVyReQDL-31"><g><rect x=3D"240" y=3D"960" width=3D"165" height=3D"6=
0" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"1.=
5" pointer-events=3D"all" style=3D"fill: rgb(238, 238, 238); stroke: rgb(54=
, 57, 61);"/></g><g><g transform=3D"scale(1.5)"><switch><foreignObject styl=
e=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"disp=
lay: flex; align-items: unsafe center; justify-content: unsafe center; widt=
h: 108px; height: 1px; padding-top: 660px; margin-left: 161px;"><div style=
=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #00000=
0; "><div style=3D"display: inline-block; font-size: 10px; font-family: &qu=
ot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff); line-height: 1.=
2; pointer-events: all; white-space: normal; word-wrap: normal; "><div>clan=
g.bbclass</div></div></div></div></foreignObject><text x=3D"215" y=3D"663" =
fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&quo=
t;" font-size=3D"10px" text-anchor=3D"middle">clang.bbclass</text></switch>=
</g></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-32"><g><rect x=3D"240" =
y=3D"1035" width=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" s=
troke=3D"#36393d" stroke-width=3D"1.5" pointer-events=3D"all" style=3D"fill=
: rgb(238, 238, 238); stroke: rgb(54, 57, 61);"/></g><g><g transform=3D"sca=
le(1.5)"><switch><foreignObject style=3D"overflow: visible; text-align: lef=
t;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 108px; height: 1px; padding-top: 710=
px; margin-left: 161px;"><div style=3D"box-sizing: border-box; font-size: 0=
; text-align: center; color: #000000; "><div style=3D"display: inline-block=
; font-size: 10px; font-family: &quot;Nimbus Roman&quot;; color: light-dark=
(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space: nor=
mal; word-wrap: normal; "><div>clang-native.bbclass</div></div></div></div>=
</foreignObject><text x=3D"215" y=3D"713" fill=3D"light-dark(#000000, #ffff=
ff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-ancho=
r=3D"middle">clang-native.bbclass</text></switch></g></g></g><g data-cell-i=
d=3D"mLbxTJ1KFCbuQVyReQDL-45"><g><rect x=3D"30" y=3D"510" width=3D"105" hei=
ght=3D"45" fill=3D"none" stroke=3D"none" transform=3D"rotate(-90,82.5,532.5=
)" pointer-events=3D"all"/></g><g><g transform=3D"scale(1.5)rotate(-90 55 3=
55)"><switch><foreignObject style=3D"overflow: visible; text-align: left;" =
pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"=
http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.=
w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; just=
ify-content: unsafe center; width: 1px; height: 1px; padding-top: 355px; ma=
rgin-left: 55px;"><div style=3D"box-sizing: border-box; font-size: 0; text-=
align: center; color: #000000; "><div style=3D"display: inline-block; font-=
size: 10px; font-family: &quot;Nimbus Roman&quot;; color: light-dark(#00000=
0, #ffffff); line-height: 1.2; pointer-events: all; white-space: nowrap; ">=
<div>inherit_defer</div></div></div></div></foreignObject><text x=3D"55" y=
=3D"358" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus =
Roman&quot;" font-size=3D"10px" text-anchor=3D"middle">inherit_defer</text>=
</switch></g></g></g><g data-cell-id=3D"mLbxTJ1KFCbuQVyReQDL-46"><g><rect x=
=3D"435" y=3D"360" width=3D"75" height=3D"45" fill=3D"none" stroke=3D"none"=
 pointer-events=3D"all"/></g><g><g transform=3D"scale(1.5)"><switch><foreig=
nObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"no=
ne" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR=
/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" s=
tyle=3D"display: flex; align-items: unsafe center; justify-content: unsafe =
center; width: 1px; height: 1px; padding-top: 255px; margin-left: 315px;"><=
div style=3D"box-sizing: border-box; font-size: 0; text-align: center; colo=
r: #000000; "><div style=3D"display: inline-block; font-size: 10px; font-fa=
mily: &quot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff); line-h=
eight: 1.2; pointer-events: all; white-space: nowrap; "><div>inherit</div><=
/div></div></div></foreignObject><text x=3D"315" y=3D"258" fill=3D"light-da=
rk(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=3D=
"10px" text-anchor=3D"middle">inherit</text></switch></g></g></g><g data-ce=
ll-id=3D"KqBVfwb0AsbTkkaLkWwC-3"><g><path d=3D"M 180 360 L 227.82 360" fill=
=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" =
stroke-dasharray=3D"4.5 4.5" pointer-events=3D"stroke" style=3D"stroke: lig=
ht-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/><path d=3D"M 238.32 360 L 227.=
82 363.5 L 227.82 356.5 Z" fill=3D"none" stroke=3D"#000000" stroke-width=3D=
"1.5" stroke-miterlimit=3D"10" pointer-events=3D"all" style=3D"stroke: ligh=
t-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/></g></g><g data-cell-id=3D"KqBV=
fwb0AsbTkkaLkWwC-4"><g><path d=3D"M 180 360 L 210 360 L 210 270 L 227.82 27=
0" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=
=3D"10" stroke-dasharray=3D"4.5 4.5" pointer-events=3D"stroke" style=3D"str=
oke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/><path d=3D"M 238.32 27=
0 L 227.82 273.5 L 227.82 266.5 Z" fill=3D"none" stroke=3D"#000000" stroke-=
width=3D"1.5" stroke-miterlimit=3D"10" pointer-events=3D"all" style=3D"stro=
ke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/></g></g><g data-cell-id=
=3D"KqBVfwb0AsbTkkaLkWwC-5"><g><path d=3D"M 180 360 L 210 360 L 210 435 L 2=
27.82 435" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-mit=
erlimit=3D"10" stroke-dasharray=3D"4.5 4.5" pointer-events=3D"stroke" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/><path d=3D"M 23=
8.32 435 L 227.82 438.5 L 227.82 431.5 Z" fill=3D"none" stroke=3D"#000000" =
stroke-width=3D"1.5" stroke-miterlimit=3D"10" pointer-events=3D"all" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/></g></g><g data=
-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-6"><g><path d=3D"M 180 360 L 210 360 L 210=
 510 L 227.82 510" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" st=
roke-miterlimit=3D"10" stroke-dasharray=3D"4.5 4.5" pointer-events=3D"strok=
e" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/><path d=
=3D"M 238.32 510 L 227.82 513.5 L 227.82 506.5 Z" fill=3D"none" stroke=3D"#=
000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" pointer-events=3D"all=
" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/></g></g>=
<g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-7"><g><path d=3D"M 180 360 L 210 36=
0 L 210 585 L 227.82 585" fill=3D"none" stroke=3D"#000000" stroke-width=3D"=
1.5" stroke-miterlimit=3D"10" stroke-dasharray=3D"4.5 4.5" pointer-events=
=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"=
/><path d=3D"M 238.32 585 L 227.82 588.5 L 227.82 581.5 Z" fill=3D"none" st=
roke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" pointer-even=
ts=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"/=
></g></g><g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-8"><g><path d=3D"M 180 360=
 L 210 360 L 210 660 L 227.82 660" fill=3D"none" stroke=3D"#000000" stroke-=
width=3D"1.5" stroke-miterlimit=3D"10" stroke-dasharray=3D"4.5 4.5" pointer=
-events=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, =
255));"/><path d=3D"M 238.32 660 L 227.82 663.5 L 227.82 656.5 Z" fill=3D"n=
one" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10" point=
er-events=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 2=
55));"/></g></g><g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-9"><g><path d=3D"M =
180 360 L 210 360 L 210 735 L 227.82 735" fill=3D"none" stroke=3D"#000000" =
stroke-width=3D"1.5" stroke-miterlimit=3D"10" stroke-dasharray=3D"4.5 4.5" =
pointer-events=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255));"/><path d=3D"M 238.32 735 L 227.82 738.5 L 227.82 731.5 Z" fi=
ll=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10=
" pointer-events=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255,=
 255, 255));"/></g></g><g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-10"><g><path=
 d=3D"M 97.5 390 L 97.5 840 L 227.82 840" fill=3D"none" stroke=3D"#000000" =
stroke-width=3D"1.5" stroke-miterlimit=3D"10" stroke-dasharray=3D"4.5 4.5" =
pointer-events=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255));"/><path d=3D"M 238.32 840 L 227.82 843.5 L 227.82 836.5 Z" fi=
ll=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10=
" pointer-events=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255,=
 255, 255));"/></g></g><g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-11"><g><path=
 d=3D"M 97.5 390 L 97.5 915 L 227.82 915" fill=3D"none" stroke=3D"#000000" =
stroke-width=3D"1.5" stroke-miterlimit=3D"10" stroke-dasharray=3D"4.5 4.5" =
pointer-events=3D"stroke" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255));"/><path d=3D"M 238.32 915 L 227.82 918.5 L 227.82 911.5 Z" fi=
ll=3D"none" stroke=3D"#000000" stroke-width=3D"1.5" stroke-miterlimit=3D"10=
" pointer-events=3D"all" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255,=
 255, 255));"/></g></g><g data-cell-id=3D"KqBVfwb0AsbTkkaLkWwC-2"><g><rect =
x=3D"15" y=3D"330" width=3D"165" height=3D"60" rx=3D"9" ry=3D"9" fill=3D"#e=
eeeee" stroke=3D"#36393d" stroke-width=3D"1.5" pointer-events=3D"all" style=
=3D"fill: rgb(238, 238, 238); stroke: rgb(54, 57, 61);"/></g><g><g transfor=
m=3D"scale(1.5)"><switch><foreignObject style=3D"overflow: visible; text-al=
ign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 108px; height: 1px; padding-=
top: 240px; margin-left: 11px;"><div style=3D"box-sizing: border-box; font-=
size: 0; text-align: center; color: #000000; "><div style=3D"display: inlin=
e-block; font-size: 10px; font-family: &quot;Nimbus Roman&quot;; color: lig=
ht-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-spa=
ce: normal; word-wrap: normal; "><div>base.bbclass</div></div></div></div><=
/foreignObject><text x=3D"65" y=3D"243" fill=3D"light-dark(#000000, #ffffff=
)" font-family=3D"&quot;Nimbus Roman&quot;" font-size=3D"10px" text-anchor=
=3D"middle">base.bbclass</text></switch></g></g></g><g data-cell-id=3D"KqBV=
fwb0AsbTkkaLkWwC-15"><g><rect x=3D"435" y=3D"240" width=3D"165" height=3D"6=
0" rx=3D"9" ry=3D"9" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"1.=
5" pointer-events=3D"all" style=3D"fill: rgb(238, 238, 238); stroke: rgb(54=
, 57, 61);"/></g><g><g transform=3D"scale(1.5)"><switch><foreignObject styl=
e=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"disp=
lay: flex; align-items: unsafe center; justify-content: unsafe center; widt=
h: 108px; height: 1px; padding-top: 180px; margin-left: 291px;"><div style=
=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #00000=
0; "><div style=3D"display: inline-block; font-size: 10px; font-family: &qu=
ot;Nimbus Roman&quot;; color: light-dark(#000000, #ffffff); line-height: 1.=
2; pointer-events: all; white-space: normal; word-wrap: normal; "><div>term=
inal.bbclass</div></div></div></div></foreignObject><text x=3D"345" y=3D"18=
3" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Nimbus Roman&=
quot;" font-size=3D"10px" text-anchor=3D"middle">terminal.bbclass</text></s=
witch></g></g></g></g></g></g></svg>
\ No newline at end of file
--=20
2.51.0


