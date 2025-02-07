Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFF8C0219B
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:41:44 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.74069.1738946496680217779
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 08:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dPP8KiWE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9546443DB;
	Fri,  7 Feb 2025 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738946494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LJMdNTe3IYrjSVfcGH1kUUZ+3mFmlUDTlFb/zf5XzY8=;
	b=dPP8KiWEtA7axofQbsVT3LFLMWOpL7r4m6wtZ+dLl05+inQJ7o8NjZC7HAAIRPxUDTy2pO
	ZpX44CWwUuI+H3xd4pUP/KdMKUdeUvIW/4J1LTdEbBfSDu75znT8MiXXR86MeszH7wgrhG
	YBs03Gr8UjZgWnWYqMtxTsvTtcMBhZQ+GcugPyfF3x6+G/aERz7dGG1N9BqvK48G1Em6Sl
	VxShMBV9HtYU+haukXIShV/svx+52qVCqONiDM6toH9/SyoQauIRvDjpwcXP/eOy1g74LZ
	qIkR4UMLnstFiu1OHyNKDZ8l4S2R4zmKcKx4MJDLB3Xa86/Dw2rDAMlS4QT7oQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 17:41:27 +0100
Subject: [PATCH] Add favicon for the documentation html
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-favicon-v1-1-d7ce8c097c87@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALY3pmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNz3bTEsszk/Dxd89Qk48Tk5DTzNMsUJaDqgqLUtMwKsEnRsbW1AGg
 X8wdZAAAA
X-Change-ID: 20241227-favicon-7eb3accf7f9d
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MJgbtImz5vYJnE0RqdcX64sPLp604JhkeJDJQXwnKFc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpje+tsO9JJE4J+3vC8nIA+344cS+mmDNtHwp2
 b9bNGhd0T+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6Y3vgAKCRDRgEFAKaOo
 Nlw7EACkhuEDcvtv2075pAqdXbZJmcUi67+kVubu/qlg0ya5eo2hQ+vVg7FL9v9Su/UXBM3cbZA
 fN0RbC2JzE8flj7Z8fIdwgTk7YIPVctHGZV1Bo67+cSy8qM9L8sSjmPZOQAF3YxjYehojdBmp5L
 C6BeYkkAAYLjHtwkOZ2J3QefsrkG3Ei7XguqUVnsiflrFgFiegFsM18hHrJm4UslV4vkJ16qVFW
 rC2OH2wh/W10U03hB4RyBU53dL0LOJmXw3HIehivqN1zOUtH4bcyZLAYDzScafo2MOkWj7PZz7J
 QJH8Ti7BX0YK3k07eDtyJG3QY+aKSwq8uh6Hk1uhXjpamAszeCLEQbLVHdrdSpiNrHPDR2safbi
 uxyVysoL8HHoQsTIfrM7bXL6EeRyr05gu/udRayjWNdu/iby8G7Yy2tX3I4Vx14eHP+NEtzPPtF
 7p2sY9XqOWfyfEF/7uxv7o4+0xSQGYnlQ2dwGLNlsNepxadWiGmHDKuOeX3AkF4bJWFFc8UAhOZ
 UbE3GUzS6wYFJIrbaW7jWuNh/miCcPXs51++RYJLWDSZCBs0GlyhpBof/TY2fC4Vzh3r0o/u+cm
 vRlY1CfIt7xkfLRIY2bs6i1DN0ri4dQfFX311Xg1v0/7J5QdUAZ3ghk7cKFoHg6Ta4D3DV7lP+u
 RCol0SL8vAzpdTw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueduudehgefggeduueduheefueeltdegvedvjefgueefgfetuedthfeuuefhudejnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpshhphhhinhigqdguohgtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 16:41:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6308

Import the favicon from https://www.yoctoproject.org/, convert it to
16x16 (as per the Sphinx documentation) to make a 1291B image of the
Yocto logo.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Sphinx doc: https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-html_favicon
---
 documentation/conf.py                   |   1 +
 documentation/sphinx-static/favicon.ico | Bin 0 -> 1291 bytes
 2 files changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index b0e7c91eb..477e75112 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -136,6 +136,7 @@ except ImportError:
     sys.exit(1)
 
 html_logo = 'sphinx-static/YoctoProject_Logo_RGB.jpg'
+html_favicon = 'sphinx-static/favicon.ico'
 
 # Add any paths that contain custom static files (such as style sheets) here,
 # relative to this directory. They are copied after the builtin static files,
diff --git a/documentation/sphinx-static/favicon.ico b/documentation/sphinx-static/favicon.ico
new file mode 100644
index 0000000000000000000000000000000000000000..85a921e3ef368a361f06b60a4e43382fd3ac31a3
GIT binary patch
literal 1291
zcmeAS@N?(olHy`uVBq!ia0vp^0wB!61SBU+%rIkMV7ihT;hE;?sl~tn6ys!IVB}<A
zgsNjiVhcgpAUP>0+XKj!Mq+C~*&x%67?~JEfOHiQ3o}8?1nJFeX91hv2V~y?Vj}}1
zQ!4`_D+6-{Lvt%*ATncM13HeKfdwdQU}R*-I1$2TWMXDuSO66_G%#RXfH0K_$_Dw4
z8Ho+#0!?FPWCq&_G?ys1GcrNks0DN|6O_FQ<ai+Xf8+lH1_3WOPd5fepb#U-;QzN7
zoEcb|Sy)(@S%CyAD=Qm24+lFC@N;u>@(A(^2?_EG3JQzKhzpBIi3$ozC`w4l%F4^j
z3yUkMD9NeF$jQrr3}FOnWoKjO<KW<v6A=`VBN_ZZz#zy0jAH?2MkNL&K}Kdl#{Wkc
z#DReVbw0!s3{1>y>_7=s0R|=pHYO%UR;V}wFpybT*#w0c6xl@_l?<H%lYq)ZKt4qQ
zU{eLrO=Vydbo_sdfd^<AlOVGogFVApo7!BjyH`$~6?5Zp-xVa~dufWxp|eV*Qf$lD
zepS5kpMj+?&Uw+Lm(x|AYTeIIVwH*$+4JXO566s|@ykqH*gxKx%8<VF{CU0uJ2b^+
zx$jV1^XBMz4jZkgjMch2v8LZ7H*dCT%MF$|$7wG!(NbN<TYjhdCja+cv-lqVzj^bH
zSOd_}%*9TgAsieWw;%dH0LIs2PZ!4!jfu6B3_GM8McVG4S@Z5~TDap)4l^Z=rnko~
z#T_~3cKU=_R&sLs)Us}F$CwS*&F1=E3%Rw#v`T%6fR3;M*S%FQ-t7^&m-)pb&e-7n
z|9kd(es->V4YaC7z=`9zOx&xlybKqL^Y`Dk?)$v`R%z_<LV=HB3#Pm)+wG&4JZstc
z=a1(YA2XZnyD}upL~7k@A*Vc9zeP26^G`qBc3bzkjR@D(tgR_Vl{RvmiXRSLm>d;2
z<zRw=4BzUjSr#&J>#rY8GL+z{+p~Z96egvr<J#;D0xSnN>G)peYHiZ!YD>Ja?eB*l
z8mEQSd-h&ruw>YfVZz1Gq0#jyX`_dV(9N8%%UepU?&g@)ufKNY_UiZd_UqQ%`uF3N
z?cZG%3XAT)e_vv?NoV@$r*-@7XZoagIvwJ(m!G$<{@HKSg@;%l%<-ONGW%@KZMKHE
z^~WWgpSbL}t-nuqf6as4q5+OO-gF0DFAWX7T3Tx&<-0uCHPCOrTTS^9b>=FDib4w+
zzSB=P1+6@iWO#a$#@;Oqf)}dqovo}<5n6fubz9<=sI?y})~tHvt1*w!spEO&B8_dg
z-&WY<%}U#T+t&VB>BQh4Hs`&U1_1-XZvN_3Rg>pyw_iReA>DtxXQP9{hxIqZ85mA%
g>go6&&U`?=+2PJU{*%Ftz$jtxboFyt=akR{06~jz1poj5

literal 0
HcmV?d00001

---
base-commit: e2b6ee590a3a790b41636077e702724c9869d7f5
change-id: 20241227-favicon-7eb3accf7f9d

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


