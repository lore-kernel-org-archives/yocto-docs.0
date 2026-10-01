Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D43ACA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 13:10:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10889.1790860185482272996
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 06:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JqXdGuYx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B8741A266F;
	Thu,  1 Oct 2026 13:09:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EA5A60341;
	Thu,  1 Oct 2026 13:09:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47F9610328112;
	Thu,  1 Oct 2026 15:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790860182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+uWlG55es5WW/qHp0hZOR3rxm+tiePdhWG1v3aanTWA=;
	b=JqXdGuYxMLeyPPhif1UbqZqtByE0ppSOlwF/4JWYQzLXgnIQr6icJk9x/u9ykGXdO25Myz
	kq0sfIDMqU5maX0N5t0aPvx9+EW/qFUvFg/mbOUb4nK1Zbh75fJGWzqF1jnRycnqS4Iy18
	lKUpcfVoatBKGhnaaxOf+0+ZmB8IjYWNMnRxfbq1G4b7a5R55Qneul88pv/QyfNBFpqvNy
	JVet9ixrK6ppf8z4/KugmuMSQgHG2zbpQw4XVeunPa8N5O+DK14LVo+wFp3Yehbr3Yijo2
	h84CmnBBLK0rudjt4MhJQoFeALqXGjk6oEOZRrhQjuFs86j85cy900FV3+5hKA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	antonin.godard@bootlin.com,
	paul@pbarker.dev,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 2/4] migration-guides/release-notes-6.1.rst: add CVE fixes
Date: Thu,  1 Oct 2026 15:09:02 +0200
Message-ID: <20261001130904.2061644-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
References: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 13:10:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10650

Using gen-cve-release-notes, with following data as input:

- wrynose: https://git.yoctoproject.org/yocto-metrics/tree/cve-check/wrynos=
e/1790838188.json?id=3D10eba151b437183ca5d57e0e2c7d599bbca707ee
- master: https://git.yoctoproject.org/yocto-metrics/tree/cve-check/master/=
1790839180.json?id=3D10eba151b437183ca5d57e0e2c7d599bbca707ee

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../migration-guides/release-notes-6.1.rst    | 78 +++++++++++--------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documen=
tation/migration-guides/release-notes-6.1.rst
index 354d6b0ae..d048a245c 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -788,7 +788,7 @@ The following CVEs have been fixed:
    * - ``acl``
      - :cve_nist:`2026-54369`, :cve_nist:`2026-54370`
    * - ``alsa-lib``
-     - :cve_nist:`2026-90781`
+     - :cve_nist:`2026-90781`, :cve_nist:`2026-96674`, :cve_nist:`2026-966=
75`
    * - ``attr``
      - :cve_nist:`2026-54371`
    * - ``avahi``
@@ -816,77 +816,85 @@ The following CVEs have been fixed:
    * - ``cups``
      - :cve_nist:`2024-47850`
    * - ``curl``
-     - :cve_nist:`2026-7009`, :cve_nist:`2026-8458`, :cve_nist:`2026-8925`=
, :cve_nist:`2026-8926`, :cve_nist:`2026-9079`, :cve_nist:`2026-9080`, :cve=
_nist:`2026-9545`, :cve_nist:`2026-9546`, :cve_nist:`2026-11564`, :cve_nist=
:`2026-11856`, :cve_nist:`2026-13608`, :cve_nist:`2026-18924`, :cve_nist:`2=
026-19931`, :cve_nist:`2026-80229`, :cve_nist:`2026-80230`, :cve_nist:`2026=
-80231`, :cve_nist:`2026-80255`, :cve_nist:`2026-82208`, :cve_nist:`2026-82=
209`
+     - :cve_nist:`2026-8926`, :cve_nist:`2026-11564`, :cve_nist:`2026-1185=
6`, :cve_nist:`2026-18924`, :cve_nist:`2026-19931`, :cve_nist:`2026-80230`,=
 :cve_nist:`2026-80231`, :cve_nist:`2026-80255`, :cve_nist:`2026-82208`
    * - ``epiphany``
      - :cve_nist:`2026-18487`
    * - ``expat``
-     - :cve_nist:`2025-66382`, :cve_nist:`2026-50219`, :cve_nist:`2026-561=
31`, :cve_nist:`2026-56412`, :cve_nist:`2026-66046`, :cve_nist:`2026-76641`=
, :cve_nist:`2026-76957`
+     - :cve_nist:`2026-66046`, :cve_nist:`2026-76641`, :cve_nist:`2026-769=
56`, :cve_nist:`2026-76957`, :cve_nist:`2026-93990`, :cve_nist:`2026-102633`
    * - ``ffmpeg``
-     - :cve_nist:`2026-52295`, :cve_nist:`2026-52296`, :cve_nist:`2026-522=
97`, :cve_nist:`2026-64830`, :cve_nist:`2026-64831`, :cve_nist:`2026-64832`=
, :cve_nist:`2026-64833`, :cve_nist:`2026-64834`, :cve_nist:`2026-64835`, :=
cve_nist:`2026-65703`, :cve_nist:`2026-65704`, :cve_nist:`2026-65705`, :cve=
_nist:`2026-65706`, :cve_nist:`2026-66036`, :cve_nist:`2026-66037`, :cve_ni=
st:`2026-66038`, :cve_nist:`2026-66039`, :cve_nist:`2026-66040`, :cve_nist:=
`2026-66041`, :cve_nist:`2026-70628`, :cve_nist:`2026-70629`, :cve_nist:`20=
26-70630`, :cve_nist:`2026-70631`, :cve_nist:`2026-70632`, :cve_nist:`2026-=
75141`, :cve_nist:`2026-75142`, :cve_nist:`2026-75143`, :cve_nist:`2026-751=
44`, :cve_nist:`2026-75145`, :cve_nist:`2026-75146`, :cve_nist:`2026-75147`
+     - :cve_nist:`2026-58049`, :cve_nist:`2026-66036`, :cve_nist:`2026-660=
40`, :cve_nist:`2026-66041`, :cve_nist:`2026-70628`, :cve_nist:`2026-70629`=
, :cve_nist:`2026-70630`, :cve_nist:`2026-70631`, :cve_nist:`2026-70632`, :=
cve_nist:`2026-75141`, :cve_nist:`2026-75142`, :cve_nist:`2026-75143`, :cve=
_nist:`2026-75144`, :cve_nist:`2026-75145`, :cve_nist:`2026-75146`, :cve_ni=
st:`2026-75147`, :cve_nist:`2026-96611`
    * - ``gdk-pixbuf``
      - :cve_nist:`2026-5201`
    * - ``ghostscript``
-     - :cve_nist:`2026-39919`
-   * - ``git``
-     - :cve_nist:`2024-52005`
+     - :cve_nist:`2026-19547`, :cve_nist:`2026-39919`
    * - ``glibc``
-     - :cve_nist:`2026-8674`, :cve_nist:`2026-18374`, :cve_nist:`2026-1949=
9`, :cve_nist:`2026-19542`, :cve_nist:`2026-77117`, :cve_nist:`2026-80489`,=
 :cve_nist:`2026-89092`
+     - :cve_nist:`2011-0536`, :cve_nist:`2025-0577`, :cve_nist:`2026-8674`=
, :cve_nist:`2026-18374`, :cve_nist:`2026-19499`, :cve_nist:`2026-19542`, :=
cve_nist:`2026-77117`, :cve_nist:`2026-80489`, :cve_nist:`2026-86805`, :cve=
_nist:`2026-89092`, :cve_nist:`2026-95818`, :cve_nist:`2026-97399`
+   * - ``gnutls``
+     - :cve_nist:`2023-0361`
    * - ``graphene``
      - :cve_nist:`2026-81281`
    * - ``gstreamer1.0``
      - :cve_nist:`2026-73433`, :cve_nist:`2026-73434`
-   * - ``libevent``
-     - :cve_nist:`2026-63379`, :cve_nist:`2026-63381`, :cve_nist:`2026-633=
82`, :cve_nist:`2026-63383`, :cve_nist:`2026-63384`, :cve_nist:`2026-63385`=
, :cve_nist:`2026-63387`, :cve_nist:`2026-63388`, :cve_nist:`2026-63495`
+   * - ``libarchive``
+     - :cve_nist:`2026-4424`
    * - ``libgcrypt``
      - :cve_nist:`2024-2236`
    * - ``libgit2``
      - :cve_nist:`2026-5917`, :cve_nist:`2026-53583`, :cve_nist:`2026-5358=
4`, :cve_nist:`2026-53585`, :cve_nist:`2026-53586`, :cve_nist:`2026-53587`
-   * - ``libpcap``
-     - :cve_nist:`2026-0799`, :cve_nist:`2026-6244`, :cve_nist:`2026-6554`=
, :cve_nist:`2026-18238`, :cve_nist:`2026-18313`, :cve_nist:`2026-31911`, :=
cve_nist:`2026-31912`
    * - ``libpcre2``
-     - :cve_nist:`2026-86145`, :cve_nist:`2026-89156`, :cve_nist:`2026-891=
57`, :cve_nist:`2026-89158`, :cve_nist:`2026-89160`, :cve_nist:`2026-89161`=
, :cve_nist:`2026-89162`
-   * - ``libslirp``
-     - :cve_nist:`2026-9539`
+     - :cve_nist:`2026-86145`, :cve_nist:`2026-89156`, :cve_nist:`2026-891=
57`, :cve_nist:`2026-89158`, :cve_nist:`2026-89160`, :cve_nist:`2026-89161`=
, :cve_nist:`2026-89162`, :cve_nist:`2026-103111`
    * - ``libsndfile1``
      - :cve_nist:`2024-50613`, :cve_nist:`2025-52194`
    * - ``libsolv``
-     - :cve_nist:`2026-48863`
+     - :cve_nist:`2026-48863`, :cve_nist:`2026-48864`
    * - ``libsoup``
      - :cve_nist:`2026-3099`, :cve_nist:`2026-3632`, :cve_nist:`2026-3633`=
, :cve_nist:`2026-3634`, :cve_nist:`2026-12548`, :cve_nist:`2026-12549`, :c=
ve_nist:`2026-66337`, :cve_nist:`2026-66338`, :cve_nist:`2026-66339`
    * - ``libtheora``
      - :cve_nist:`2026-5673`
+   * - ``libx11``
+     - :cve_nist:`2026-88806`, :cve_nist:`2026-94283`, :cve_nist:`2026-942=
84`, :cve_nist:`2026-94285`
    * - ``libxfont``
      - :cve_nist:`2026-44950`
-   * - ``libxfont2``
-     - :cve_nist:`2026-44950`, :cve_nist:`2026-59679`
-   * - ``libxml2``
-     - :cve_nist:`2026-86137`, :cve_nist:`2026-86138`, :cve_nist:`2026-861=
39`, :cve_nist:`2026-86140`, :cve_nist:`2026-86141`, :cve_nist:`2026-86142`=
, :cve_nist:`2026-86143`, :cve_nist:`2026-86144`
+   * - ``libxi``
+     - :cve_nist:`2026-93541`, :cve_nist:`2026-93542`, :cve_nist:`2026-935=
43`, :cve_nist:`2026-93544`, :cve_nist:`2026-93545`, :cve_nist:`2026-94281`=
, :cve_nist:`2026-94282`
+   * - ``libxrender``
+     - :cve_nist:`2026-88807`
+   * - ``libxtst``
+     - :cve_nist:`2026-94286`
    * - ``linux-yocto``
-     - :cve_nist:`2019-14899`, :cve_nist:`2021-3714`, :cve_nist:`2021-3864=
`, :cve_nist:`2022-0400`, :cve_nist:`2022-1247`, :cve_nist:`2022-4543`, :cv=
e_nist:`2023-3397`, :cve_nist:`2023-3640`, :cve_nist:`2023-6238`, :cve_nist=
:`2023-6240`, :cve_nist:`2025-71074`, :cve_nist:`2025-71306`, :cve_nist:`20=
25-71308`, :cve_nist:`2025-71313`, :cve_nist:`2026-23328`, :cve_nist:`2026-=
23374`, :cve_nist:`2026-23377`, :cve_nist:`2026-23459`, :cve_nist:`2026-315=
01`, :cve_nist:`2026-31771`, :cve_nist:`2026-31777`, :cve_nist:`2026-43009`=
, :cve_nist:`2026-43022`, :cve_nist:`2026-43042`, :cve_nist:`2026-43045`, :=
cve_nist:`2026-43053`, :cve_nist:`2026-43095`, :cve_nist:`2026-43115`, :cve=
_nist:`2026-43131`, :cve_nist:`2026-43174`, :cve_nist:`2026-43191`, :cve_ni=
st:`2026-43204`, :cve_nist:`2026-43228`, :cve_nist:`2026-43299`, :cve_nist:=
`2026-43308`, :cve_nist:`2026-43310`, :cve_nist:`2026-43311`, :cve_nist:`20=
26-43326`, :cve_nist:`2026-43344`, :cve_nist:`2026-43391`, :cve_nist:`2026-=
43414`, :cve_nist:`2026-43443`, :cve_nist:`2026-45961`, :cve_nist:`2026-459=
63`, :cve_nist:`2026-45991`, :cve_nist:`2026-46008`, :cve_nist:`2026-46017`=
, :cve_nist:`2026-46032`, :cve_nist:`2026-46153`, :cve_nist:`2026-46210`, :=
cve_nist:`2026-46245`, :cve_nist:`2026-46298`, :cve_nist:`2026-46302`, :cve=
_nist:`2026-46311`, :cve_nist:`2026-46330`, :cve_nist:`2026-52949`, :cve_ni=
st:`2026-52956`, :cve_nist:`2026-52960`, :cve_nist:`2026-52965`, :cve_nist:=
`2026-52988`, :cve_nist:`2026-53007`, :cve_nist:`2026-53008`, :cve_nist:`20=
26-53009`, :cve_nist:`2026-53017`, :cve_nist:`2026-53024`, :cve_nist:`2026-=
53025`, :cve_nist:`2026-53089`, :cve_nist:`2026-53091`, :cve_nist:`2026-531=
02`, :cve_nist:`2026-53106`, :cve_nist:`2026-53108`, :cve_nist:`2026-53113`=
, :cve_nist:`2026-53124`, :cve_nist:`2026-53178`, :cve_nist:`2026-53222`, :=
cve_nist:`2026-53257`, :cve_nist:`2026-53285`, :cve_nist:`2026-53292`, :cve=
_nist:`2026-53308`, :cve_nist:`2026-53313`, :cve_nist:`2026-53401`, :cve_ni=
st:`2026-63811`, :cve_nist:`2026-63839`, :cve_nist:`2026-63879`, :cve_nist:=
`2026-63941`, :cve_nist:`2026-63977`, :cve_nist:`2026-63983`, :cve_nist:`20=
26-64013`, :cve_nist:`2026-64019`, :cve_nist:`2026-64020`, :cve_nist:`2026-=
64040`, :cve_nist:`2026-64057`, :cve_nist:`2026-64067`, :cve_nist:`2026-640=
68`, :cve_nist:`2026-64070`, :cve_nist:`2026-64079`, :cve_nist:`2026-64082`=
, :cve_nist:`2026-64117`, :cve_nist:`2026-64123`, :cve_nist:`2026-64146`, :=
cve_nist:`2026-64154`, :cve_nist:`2026-64159`, :cve_nist:`2026-64160`, :cve=
_nist:`2026-64210`, :cve_nist:`2026-64283`, :cve_nist:`2026-64325`, :cve_ni=
st:`2026-64341`, :cve_nist:`2026-64388`, :cve_nist:`2026-64400`, :cve_nist:=
`2026-68086`, :cve_nist:`2026-68103`, :cve_nist:`2026-68105`, :cve_nist:`20=
26-68242`, :cve_nist:`2026-68286`, :cve_nist:`2026-68287`, :cve_nist:`2026-=
68288`, :cve_nist:`2026-68289`, :cve_nist:`2026-68291`, :cve_nist:`2026-682=
95`, :cve_nist:`2026-68303`, :cve_nist:`2026-68305`, :cve_nist:`2026-68312`=
, :cve_nist:`2026-68323`, :cve_nist:`2026-68337`, :cve_nist:`2026-68375`, :=
cve_nist:`2026-68399`, :cve_nist:`2026-68404`, :cve_nist:`2026-68436`, :cve=
_nist:`2026-68441`, :cve_nist:`2026-68447`, :cve_nist:`2026-68470`, :cve_ni=
st:`2026-72031`, :cve_nist:`2026-72064`, :cve_nist:`2026-72091`, :cve_nist:=
`2026-72315`, :cve_nist:`2026-72329`, :cve_nist:`2026-72331`, :cve_nist:`20=
26-72334`, :cve_nist:`2026-72337`, :cve_nist:`2026-72345`, :cve_nist:`2026-=
72355`, :cve_nist:`2026-72370`, :cve_nist:`2026-72377`, :cve_nist:`2026-723=
80`, :cve_nist:`2026-72388`, :cve_nist:`2026-72397`, :cve_nist:`2026-72402`=
, :cve_nist:`2026-72404`, :cve_nist:`2026-72413`, :cve_nist:`2026-72423`, :=
cve_nist:`2026-72440`, :cve_nist:`2026-72454`, :cve_nist:`2026-72463`, :cve=
_nist:`2026-72477`, :cve_nist:`2026-72485`, :cve_nist:`2026-72494`, :cve_ni=
st:`2026-72496`, :cve_nist:`2026-72497`, :cve_nist:`2026-72499`, :cve_nist:=
`2026-74258`, :cve_nist:`2026-74260`, :cve_nist:`2026-74272`, :cve_nist:`20=
26-74273`, :cve_nist:`2026-74277`, :cve_nist:`2026-74289`, :cve_nist:`2026-=
74291`, :cve_nist:`2026-74294`, :cve_nist:`2026-74307`, :cve_nist:`2026-743=
17`, :cve_nist:`2026-74334`, :cve_nist:`2026-74336`, :cve_nist:`2026-74338`=
, :cve_nist:`2026-74342`, :cve_nist:`2026-74347`, :cve_nist:`2026-74350`, :=
cve_nist:`2026-74354`, :cve_nist:`2026-74367`, :cve_nist:`2026-74373`, :cve=
_nist:`2026-74374`, :cve_nist:`2026-74375`, :cve_nist:`2026-74407`, :cve_ni=
st:`2026-74419`, :cve_nist:`2026-74449`, :cve_nist:`2026-74466`, :cve_nist:=
`2026-74496`, :cve_nist:`2026-74521`, :cve_nist:`2026-74527`, :cve_nist:`20=
26-74542`, :cve_nist:`2026-74544`, :cve_nist:`2026-74558`, :cve_nist:`2026-=
74561`, :cve_nist:`2026-74562`, :cve_nist:`2026-74568`, :cve_nist:`2026-747=
13`, :cve_nist:`2026-74715`, :cve_nist:`2026-74716`, :cve_nist:`2026-74721`=
, :cve_nist:`2026-74723`, :cve_nist:`2026-74729`, :cve_nist:`2026-74745`, :=
cve_nist:`2026-74747`, :cve_nist:`2026-74750`, :cve_nist:`2026-74752`, :cve=
_nist:`2026-74754`, :cve_nist:`2026-80524`, :cve_nist:`2026-80579`, :cve_ni=
st:`2026-80580`, :cve_nist:`2026-80631`, :cve_nist:`2026-80634`, :cve_nist:=
`2026-80655`, :cve_nist:`2026-80657`, :cve_nist:`2026-80668`, :cve_nist:`20=
26-80693`, :cve_nist:`2026-80705`, :cve_nist:`2026-80729`, :cve_nist:`2026-=
80738`, :cve_nist:`2026-80747`, :cve_nist:`2026-80753`, :cve_nist:`2026-807=
55`, :cve_nist:`2026-80768`, :cve_nist:`2026-80774`, :cve_nist:`2026-80783`=
, :cve_nist:`2026-80785`, :cve_nist:`2026-80786`, :cve_nist:`2026-80824`, :=
cve_nist:`2026-80825`, :cve_nist:`2026-80826`, :cve_nist:`2026-80827`, :cve=
_nist:`2026-80828`, :cve_nist:`2026-80829`, :cve_nist:`2026-80830`, :cve_ni=
st:`2026-80831`, :cve_nist:`2026-80832`, :cve_nist:`2026-80833`, :cve_nist:=
`2026-80834`, :cve_nist:`2026-80835`, :cve_nist:`2026-80836`, :cve_nist:`20=
26-80837`, :cve_nist:`2026-80838`, :cve_nist:`2026-80839`, :cve_nist:`2026-=
80840`, :cve_nist:`2026-80841`, :cve_nist:`2026-80842`, :cve_nist:`2026-808=
43`, :cve_nist:`2026-80844`, :cve_nist:`2026-80845`, :cve_nist:`2026-80846`=
, :cve_nist:`2026-80847`, :cve_nist:`2026-80848`, :cve_nist:`2026-80849`, :=
cve_nist:`2026-80850`, :cve_nist:`2026-80851`, :cve_nist:`2026-80852`, :cve=
_nist:`2026-80854`, :cve_nist:`2026-80855`, :cve_nist:`2026-80856`, :cve_ni=
st:`2026-80857`, :cve_nist:`2026-80858`, :cve_nist:`2026-80859`, :cve_nist:=
`2026-80860`, :cve_nist:`2026-80861`, :cve_nist:`2026-80862`, :cve_nist:`20=
26-80863`, :cve_nist:`2026-80864`, :cve_nist:`2026-80878`, :cve_nist:`2026-=
80884`, :cve_nist:`2026-80899`, :cve_nist:`2026-80914`, :cve_nist:`2026-809=
20`, :cve_nist:`2026-80921`, :cve_nist:`2026-80922`, :cve_nist:`2026-80923`=
, :cve_nist:`2026-80924`, :cve_nist:`2026-80925`, :cve_nist:`2026-80926`, :=
cve_nist:`2026-80927`, :cve_nist:`2026-80928`, :cve_nist:`2026-80929`, :cve=
_nist:`2026-80930`, :cve_nist:`2026-80931`, :cve_nist:`2026-80932`, :cve_ni=
st:`2026-80933`, :cve_nist:`2026-80934`, :cve_nist:`2026-80935`, :cve_nist:=
`2026-80936`, :cve_nist:`2026-80937`, :cve_nist:`2026-80938`, :cve_nist:`20=
26-80939`, :cve_nist:`2026-80940`, :cve_nist:`2026-80941`, :cve_nist:`2026-=
80942`, :cve_nist:`2026-80943`, :cve_nist:`2026-80944`, :cve_nist:`2026-809=
45`, :cve_nist:`2026-80946`, :cve_nist:`2026-80947`, :cve_nist:`2026-80948`=
, :cve_nist:`2026-80949`, :cve_nist:`2026-80950`, :cve_nist:`2026-80951`, :=
cve_nist:`2026-80952`, :cve_nist:`2026-80953`, :cve_nist:`2026-80955`, :cve=
_nist:`2026-80956`, :cve_nist:`2026-80957`, :cve_nist:`2026-80958`, :cve_ni=
st:`2026-80959`, :cve_nist:`2026-80960`, :cve_nist:`2026-80961`, :cve_nist:=
`2026-80962`, :cve_nist:`2026-80963`, :cve_nist:`2026-80964`, :cve_nist:`20=
26-80965`, :cve_nist:`2026-80966`, :cve_nist:`2026-80967`, :cve_nist:`2026-=
80968`, :cve_nist:`2026-80969`, :cve_nist:`2026-80970`, :cve_nist:`2026-809=
71`, :cve_nist:`2026-80972`, :cve_nist:`2026-80973`, :cve_nist:`2026-80974`=
, :cve_nist:`2026-80975`, :cve_nist:`2026-80976`, :cve_nist:`2026-80977`, :=
cve_nist:`2026-80978`, :cve_nist:`2026-80979`, :cve_nist:`2026-80980`, :cve=
_nist:`2026-80981`, :cve_nist:`2026-80982`, :cve_nist:`2026-80983`, :cve_ni=
st:`2026-80984`, :cve_nist:`2026-80985`, :cve_nist:`2026-80986`, :cve_nist:=
`2026-80987`, :cve_nist:`2026-80988`, :cve_nist:`2026-80989`, :cve_nist:`20=
26-80990`, :cve_nist:`2026-80991`, :cve_nist:`2026-80992`, :cve_nist:`2026-=
80993`, :cve_nist:`2026-80994`, :cve_nist:`2026-80996`, :cve_nist:`2026-809=
97`, :cve_nist:`2026-80999`, :cve_nist:`2026-81000`, :cve_nist:`2026-81001`=
, :cve_nist:`2026-81002`, :cve_nist:`2026-81003`, :cve_nist:`2026-81004`, :=
cve_nist:`2026-81005`, :cve_nist:`2026-81006`, :cve_nist:`2026-81007`, :cve=
_nist:`2026-81008`, :cve_nist:`2026-81009`, :cve_nist:`2026-81010`, :cve_ni=
st:`2026-81011`, :cve_nist:`2026-81012`, :cve_nist:`2026-81013`, :cve_nist:=
`2026-81014`, :cve_nist:`2026-81015`, :cve_nist:`2026-81016`, :cve_nist:`20=
26-81017`, :cve_nist:`2026-81018`, :cve_nist:`2026-89437`, :cve_nist:`2026-=
89438`, :cve_nist:`2026-89439`, :cve_nist:`2026-89440`, :cve_nist:`2026-894=
41`, :cve_nist:`2026-89442`, :cve_nist:`2026-89443`, :cve_nist:`2026-89444`=
, :cve_nist:`2026-89445`, :cve_nist:`2026-89446`, :cve_nist:`2026-89447`, :=
cve_nist:`2026-89448`, :cve_nist:`2026-89449`, :cve_nist:`2026-89450`, :cve=
_nist:`2026-89451`, :cve_nist:`2026-89452`, :cve_nist:`2026-89453`, :cve_ni=
st:`2026-89454`, :cve_nist:`2026-89455`, :cve_nist:`2026-89456`, :cve_nist:=
`2026-89457`, :cve_nist:`2026-89458`, :cve_nist:`2026-89460`, :cve_nist:`20=
26-89461`, :cve_nist:`2026-89462`, :cve_nist:`2026-89463`, :cve_nist:`2026-=
89464`, :cve_nist:`2026-89465`, :cve_nist:`2026-89466`, :cve_nist:`2026-894=
67`, :cve_nist:`2026-89468`, :cve_nist:`2026-89469`, :cve_nist:`2026-89470`=
, :cve_nist:`2026-89471`, :cve_nist:`2026-89472`, :cve_nist:`2026-89473`, :=
cve_nist:`2026-89474`, :cve_nist:`2026-89475`, :cve_nist:`2026-89476`, :cve=
_nist:`2026-89477`, :cve_nist:`2026-89478`, :cve_nist:`2026-89479`, :cve_ni=
st:`2026-89480`, :cve_nist:`2026-89481`, :cve_nist:`2026-89482`, :cve_nist:=
`2026-89483`, :cve_nist:`2026-89484`, :cve_nist:`2026-89485`, :cve_nist:`20=
26-89486`, :cve_nist:`2026-89487`, :cve_nist:`2026-89488`, :cve_nist:`2026-=
89489`, :cve_nist:`2026-89490`, :cve_nist:`2026-89491`, :cve_nist:`2026-894=
92`, :cve_nist:`2026-89493`, :cve_nist:`2026-89494`, :cve_nist:`2026-89495`=
, :cve_nist:`2026-89496`, :cve_nist:`2026-89497`, :cve_nist:`2026-89498`, :=
cve_nist:`2026-89500`, :cve_nist:`2026-89501`, :cve_nist:`2026-89502`, :cve=
_nist:`2026-89503`, :cve_nist:`2026-89504`, :cve_nist:`2026-89506`, :cve_ni=
st:`2026-89507`, :cve_nist:`2026-89508`, :cve_nist:`2026-89509`, :cve_nist:=
`2026-89510`, :cve_nist:`2026-89511`, :cve_nist:`2026-89512`, :cve_nist:`20=
26-89513`, :cve_nist:`2026-89514`, :cve_nist:`2026-89515`, :cve_nist:`2026-=
89520`, :cve_nist:`2026-89522`, :cve_nist:`2026-89523`, :cve_nist:`2026-895=
24`, :cve_nist:`2026-89525`, :cve_nist:`2026-89526`, :cve_nist:`2026-89527`=
, :cve_nist:`2026-89528`, :cve_nist:`2026-89530`, :cve_nist:`2026-89531`, :=
cve_nist:`2026-89532`, :cve_nist:`2026-89533`, :cve_nist:`2026-89534`, :cve=
_nist:`2026-89535`, :cve_nist:`2026-89536`, :cve_nist:`2026-89537`, :cve_ni=
st:`2026-89538`, :cve_nist:`2026-89539`, :cve_nist:`2026-89540`, :cve_nist:=
`2026-89541`, :cve_nist:`2026-89542`, :cve_nist:`2026-89543`, :cve_nist:`20=
26-89544`, :cve_nist:`2026-89545`, :cve_nist:`2026-89547`, :cve_nist:`2026-=
89548`, :cve_nist:`2026-89549`, :cve_nist:`2026-89550`, :cve_nist:`2026-895=
51`, :cve_nist:`2026-89552`, :cve_nist:`2026-89553`, :cve_nist:`2026-89554`=
, :cve_nist:`2026-89555`, :cve_nist:`2026-89556`, :cve_nist:`2026-89557`, :=
cve_nist:`2026-89558`, :cve_nist:`2026-89559`, :cve_nist:`2026-89560`, :cve=
_nist:`2026-89561`, :cve_nist:`2026-89562`, :cve_nist:`2026-89563`, :cve_ni=
st:`2026-89564`, :cve_nist:`2026-89565`, :cve_nist:`2026-89566`, :cve_nist:=
`2026-89567`, :cve_nist:`2026-89568`, :cve_nist:`2026-89569`, :cve_nist:`20=
26-89570`, :cve_nist:`2026-89571`, :cve_nist:`2026-89572`, :cve_nist:`2026-=
89573`, :cve_nist:`2026-89574`, :cve_nist:`2026-89575`, :cve_nist:`2026-895=
76`, :cve_nist:`2026-89577`, :cve_nist:`2026-89578`, :cve_nist:`2026-89579`=
, :cve_nist:`2026-89580`, :cve_nist:`2026-89581`, :cve_nist:`2026-89582`, :=
cve_nist:`2026-89583`, :cve_nist:`2026-89584`, :cve_nist:`2026-89585`, :cve=
_nist:`2026-89586`, :cve_nist:`2026-89587`, :cve_nist:`2026-89588`, :cve_ni=
st:`2026-89589`, :cve_nist:`2026-89590`, :cve_nist:`2026-89591`, :cve_nist:=
`2026-89592`, :cve_nist:`2026-89593`, :cve_nist:`2026-89594`, :cve_nist:`20=
26-89595`, :cve_nist:`2026-89596`, :cve_nist:`2026-89597`, :cve_nist:`2026-=
89598`, :cve_nist:`2026-89599`, :cve_nist:`2026-89600`, :cve_nist:`2026-896=
01`, :cve_nist:`2026-89602`, :cve_nist:`2026-89603`, :cve_nist:`2026-89604`=
, :cve_nist:`2026-89605`, :cve_nist:`2026-89606`, :cve_nist:`2026-89607`, :=
cve_nist:`2026-89608`, :cve_nist:`2026-89609`, :cve_nist:`2026-89610`, :cve=
_nist:`2026-89611`, :cve_nist:`2026-89615`, :cve_nist:`2026-89616`, :cve_ni=
st:`2026-89617`, :cve_nist:`2026-89618`, :cve_nist:`2026-89619`, :cve_nist:=
`2026-89620`, :cve_nist:`2026-89621`, :cve_nist:`2026-89622`, :cve_nist:`20=
26-89623`, :cve_nist:`2026-89624`, :cve_nist:`2026-89625`, :cve_nist:`2026-=
89626`, :cve_nist:`2026-89627`, :cve_nist:`2026-89628`, :cve_nist:`2026-896=
29`, :cve_nist:`2026-89631`, :cve_nist:`2026-89633`, :cve_nist:`2026-89634`=
, :cve_nist:`2026-89636`, :cve_nist:`2026-89637`, :cve_nist:`2026-89638`, :=
cve_nist:`2026-89639`, :cve_nist:`2026-89640`, :cve_nist:`2026-89641`, :cve=
_nist:`2026-89642`, :cve_nist:`2026-89643`, :cve_nist:`2026-89644`, :cve_ni=
st:`2026-89645`, :cve_nist:`2026-89646`, :cve_nist:`2026-89647`, :cve_nist:=
`2026-89648`, :cve_nist:`2026-89649`, :cve_nist:`2026-89650`, :cve_nist:`20=
26-89651`, :cve_nist:`2026-89652`, :cve_nist:`2026-89653`, :cve_nist:`2026-=
89654`, :cve_nist:`2026-89655`, :cve_nist:`2026-89656`, :cve_nist:`2026-896=
57`, :cve_nist:`2026-89658`, :cve_nist:`2026-89659`, :cve_nist:`2026-89660`=
, :cve_nist:`2026-89662`, :cve_nist:`2026-89663`, :cve_nist:`2026-89665`, :=
cve_nist:`2026-89666`, :cve_nist:`2026-89667`, :cve_nist:`2026-89668`, :cve=
_nist:`2026-89669`, :cve_nist:`2026-89670`, :cve_nist:`2026-89671`, :cve_ni=
st:`2026-89672`, :cve_nist:`2026-89673`, :cve_nist:`2026-89674`, :cve_nist:=
`2026-89675`, :cve_nist:`2026-89676`, :cve_nist:`2026-89679`, :cve_nist:`20=
26-89680`, :cve_nist:`2026-89682`, :cve_nist:`2026-89683`, :cve_nist:`2026-=
89684`, :cve_nist:`2026-89685`, :cve_nist:`2026-89686`, :cve_nist:`2026-896=
88`, :cve_nist:`2026-89689`, :cve_nist:`2026-89690`, :cve_nist:`2026-89691`=
, :cve_nist:`2026-89692`, :cve_nist:`2026-89693`, :cve_nist:`2026-89694`, :=
cve_nist:`2026-89696`, :cve_nist:`2026-89697`, :cve_nist:`2026-89698`, :cve=
_nist:`2026-89699`, :cve_nist:`2026-89700`, :cve_nist:`2026-89701`, :cve_ni=
st:`2026-89702`, :cve_nist:`2026-89703`, :cve_nist:`2026-89704`, :cve_nist:=
`2026-89705`, :cve_nist:`2026-89706`, :cve_nist:`2026-89707`, :cve_nist:`20=
26-89708`, :cve_nist:`2026-89709`, :cve_nist:`2026-89710`, :cve_nist:`2026-=
89711`, :cve_nist:`2026-89712`, :cve_nist:`2026-89713`, :cve_nist:`2026-897=
14`, :cve_nist:`2026-89715`, :cve_nist:`2026-89716`, :cve_nist:`2026-89717`=
, :cve_nist:`2026-89718`, :cve_nist:`2026-89719`, :cve_nist:`2026-89720`, :=
cve_nist:`2026-89721`, :cve_nist:`2026-89722`, :cve_nist:`2026-89723`, :cve=
_nist:`2026-89724`, :cve_nist:`2026-89725`, :cve_nist:`2026-89726`, :cve_ni=
st:`2026-89729`, :cve_nist:`2026-89730`, :cve_nist:`2026-89731`, :cve_nist:=
`2026-89732`, :cve_nist:`2026-89733`, :cve_nist:`2026-89734`, :cve_nist:`20=
26-89735`, :cve_nist:`2026-89736`, :cve_nist:`2026-89737`, :cve_nist:`2026-=
89738`, :cve_nist:`2026-89739`, :cve_nist:`2026-89740`, :cve_nist:`2026-897=
41`, :cve_nist:`2026-89742`, :cve_nist:`2026-89743`, :cve_nist:`2026-89744`=
, :cve_nist:`2026-89746`, :cve_nist:`2026-89747`, :cve_nist:`2026-89749`, :=
cve_nist:`2026-89750`, :cve_nist:`2026-89751`, :cve_nist:`2026-89752`, :cve=
_nist:`2026-89753`, :cve_nist:`2026-89754`, :cve_nist:`2026-89755`, :cve_ni=
st:`2026-89756`, :cve_nist:`2026-89757`, :cve_nist:`2026-89759`, :cve_nist:=
`2026-89761`, :cve_nist:`2026-89762`, :cve_nist:`2026-89763`, :cve_nist:`20=
26-89764`, :cve_nist:`2026-89765`, :cve_nist:`2026-89766`, :cve_nist:`2026-=
89767`, :cve_nist:`2026-89768`, :cve_nist:`2026-89769`, :cve_nist:`2026-897=
71`, :cve_nist:`2026-89772`, :cve_nist:`2026-89775`, :cve_nist:`2026-89776`=
, :cve_nist:`2026-89777`, :cve_nist:`2026-89778`, :cve_nist:`2026-89779`, :=
cve_nist:`2026-89780`, :cve_nist:`2026-89781`, :cve_nist:`2026-89782`, :cve=
_nist:`2026-89783`, :cve_nist:`2026-89784`, :cve_nist:`2026-89785`, :cve_ni=
st:`2026-89786`, :cve_nist:`2026-89787`, :cve_nist:`2026-89789`, :cve_nist:=
`2026-89790`, :cve_nist:`2026-89791`, :cve_nist:`2026-89793`, :cve_nist:`20=
26-89794`, :cve_nist:`2026-89795`, :cve_nist:`2026-89797`, :cve_nist:`2026-=
89798`, :cve_nist:`2026-89799`, :cve_nist:`2026-89800`, :cve_nist:`2026-898=
01`, :cve_nist:`2026-89802`, :cve_nist:`2026-89803`, :cve_nist:`2026-89805`=
, :cve_nist:`2026-89806`, :cve_nist:`2026-89807`, :cve_nist:`2026-89808`, :=
cve_nist:`2026-89810`, :cve_nist:`2026-89811`, :cve_nist:`2026-89812`, :cve=
_nist:`2026-89813`, :cve_nist:`2026-89814`, :cve_nist:`2026-89815`, :cve_ni=
st:`2026-89816`, :cve_nist:`2026-89817`, :cve_nist:`2026-89818`, :cve_nist:=
`2026-89819`, :cve_nist:`2026-89820`, :cve_nist:`2026-89821`, :cve_nist:`20=
26-89822`, :cve_nist:`2026-89823`, :cve_nist:`2026-89824`, :cve_nist:`2026-=
89825`, :cve_nist:`2026-89826`, :cve_nist:`2026-89827`, :cve_nist:`2026-898=
28`, :cve_nist:`2026-89829`, :cve_nist:`2026-89830`, :cve_nist:`2026-89832`=
, :cve_nist:`2026-89833`, :cve_nist:`2026-89834`, :cve_nist:`2026-89835`, :=
cve_nist:`2026-89837`, :cve_nist:`2026-89838`, :cve_nist:`2026-89839`, :cve=
_nist:`2026-89840`, :cve_nist:`2026-89841`, :cve_nist:`2026-89842`, :cve_ni=
st:`2026-89843`, :cve_nist:`2026-89844`, :cve_nist:`2026-89845`, :cve_nist:=
`2026-89846`, :cve_nist:`2026-89847`, :cve_nist:`2026-89848`, :cve_nist:`20=
26-89849`, :cve_nist:`2026-89850`, :cve_nist:`2026-89851`, :cve_nist:`2026-=
89852`, :cve_nist:`2026-89853`, :cve_nist:`2026-89854`, :cve_nist:`2026-898=
55`, :cve_nist:`2026-89856`, :cve_nist:`2026-89857`, :cve_nist:`2026-89858`=
, :cve_nist:`2026-89859`, :cve_nist:`2026-89860`, :cve_nist:`2026-89861`, :=
cve_nist:`2026-89862`, :cve_nist:`2026-89863`, :cve_nist:`2026-89864`, :cve=
_nist:`2026-89865`, :cve_nist:`2026-89866`, :cve_nist:`2026-89868`, :cve_ni=
st:`2026-89869`, :cve_nist:`2026-89870`, :cve_nist:`2026-89871`, :cve_nist:=
`2026-89872`, :cve_nist:`2026-89874`, :cve_nist:`2026-89876`, :cve_nist:`20=
26-89877`, :cve_nist:`2026-89878`, :cve_nist:`2026-89879`, :cve_nist:`2026-=
89880`, :cve_nist:`2026-89881`, :cve_nist:`2026-89883`, :cve_nist:`2026-898=
84`, :cve_nist:`2026-89885`, :cve_nist:`2026-89886`, :cve_nist:`2026-89887`=
, :cve_nist:`2026-89888`, :cve_nist:`2026-89889`, :cve_nist:`2026-89890`, :=
cve_nist:`2026-89891`, :cve_nist:`2026-89892`, :cve_nist:`2026-89893`, :cve=
_nist:`2026-89894`, :cve_nist:`2026-89895`, :cve_nist:`2026-89896`, :cve_ni=
st:`2026-89897`, :cve_nist:`2026-89898`, :cve_nist:`2026-89899`, :cve_nist:=
`2026-89900`, :cve_nist:`2026-89901`, :cve_nist:`2026-89902`, :cve_nist:`20=
26-89903`, :cve_nist:`2026-89904`, :cve_nist:`2026-89906`, :cve_nist:`2026-=
89907`, :cve_nist:`2026-89908`, :cve_nist:`2026-89909`, :cve_nist:`2026-899=
11`, :cve_nist:`2026-89912`, :cve_nist:`2026-89913`, :cve_nist:`2026-89914`=
, :cve_nist:`2026-89915`, :cve_nist:`2026-89916`, :cve_nist:`2026-89917`, :=
cve_nist:`2026-89918`, :cve_nist:`2026-89920`, :cve_nist:`2026-89921`, :cve=
_nist:`2026-89922`, :cve_nist:`2026-89923`, :cve_nist:`2026-89924`, :cve_ni=
st:`2026-89925`, :cve_nist:`2026-89926`, :cve_nist:`2026-89927`, :cve_nist:=
`2026-89928`, :cve_nist:`2026-89929`, :cve_nist:`2026-89930`, :cve_nist:`20=
26-89931`, :cve_nist:`2026-89932`, :cve_nist:`2026-89933`, :cve_nist:`2026-=
89934`, :cve_nist:`2026-89935`, :cve_nist:`2026-89936`, :cve_nist:`2026-899=
37`, :cve_nist:`2026-89938`, :cve_nist:`2026-89939`, :cve_nist:`2026-89940`=
, :cve_nist:`2026-89941`, :cve_nist:`2026-89942`, :cve_nist:`2026-89943`, :=
cve_nist:`2026-89944`, :cve_nist:`2026-89945`, :cve_nist:`2026-89946`, :cve=
_nist:`2026-89947`, :cve_nist:`2026-89948`, :cve_nist:`2026-89949`, :cve_ni=
st:`2026-89950`, :cve_nist:`2026-89951`, :cve_nist:`2026-89952`, :cve_nist:=
`2026-89953`, :cve_nist:`2026-89954`, :cve_nist:`2026-89955`, :cve_nist:`20=
26-89956`, :cve_nist:`2026-89957`, :cve_nist:`2026-89958`, :cve_nist:`2026-=
89959`, :cve_nist:`2026-89960`, :cve_nist:`2026-89961`, :cve_nist:`2026-899=
62`, :cve_nist:`2026-89963`, :cve_nist:`2026-89964`, :cve_nist:`2026-89965`=
, :cve_nist:`2026-89968`, :cve_nist:`2026-89969`, :cve_nist:`2026-89970`, :=
cve_nist:`2026-89971`, :cve_nist:`2026-89972`, :cve_nist:`2026-89973`, :cve=
_nist:`2026-89974`, :cve_nist:`2026-89975`, :cve_nist:`2026-89978`, :cve_ni=
st:`2026-89979`, :cve_nist:`2026-89980`, :cve_nist:`2026-89982`, :cve_nist:=
`2026-89983`, :cve_nist:`2026-89984`, :cve_nist:`2026-89986`, :cve_nist:`20=
26-89987`, :cve_nist:`2026-89988`, :cve_nist:`2026-89989`, :cve_nist:`2026-=
89990`, :cve_nist:`2026-89991`, :cve_nist:`2026-89992`, :cve_nist:`2026-899=
93`, :cve_nist:`2026-89994`, :cve_nist:`2026-89995`, :cve_nist:`2026-89996`=
, :cve_nist:`2026-89997`, :cve_nist:`2026-89998`, :cve_nist:`2026-89999`, :=
cve_nist:`2026-90000`, :cve_nist:`2026-90001`, :cve_nist:`2026-90002`, :cve=
_nist:`2026-90003`, :cve_nist:`2026-90005`, :cve_nist:`2026-90006`, :cve_ni=
st:`2026-90007`, :cve_nist:`2026-90008`, :cve_nist:`2026-90011`, :cve_nist:=
`2026-90012`, :cve_nist:`2026-90013`, :cve_nist:`2026-90015`, :cve_nist:`20=
26-90016`, :cve_nist:`2026-90017`, :cve_nist:`2026-90018`, :cve_nist:`2026-=
90019`, :cve_nist:`2026-90020`, :cve_nist:`2026-90021`, :cve_nist:`2026-900=
22`, :cve_nist:`2026-90023`, :cve_nist:`2026-90024`, :cve_nist:`2026-90025`=
, :cve_nist:`2026-90026`, :cve_nist:`2026-90027`, :cve_nist:`2026-90029`, :=
cve_nist:`2026-90030`, :cve_nist:`2026-90031`, :cve_nist:`2026-90032`, :cve=
_nist:`2026-90033`, :cve_nist:`2026-90034`, :cve_nist:`2026-90035`, :cve_ni=
st:`2026-90036`, :cve_nist:`2026-90037`, :cve_nist:`2026-90039`, :cve_nist:=
`2026-90040`, :cve_nist:`2026-90041`, :cve_nist:`2026-90042`, :cve_nist:`20=
26-90044`, :cve_nist:`2026-90045`, :cve_nist:`2026-90046`, :cve_nist:`2026-=
90047`, :cve_nist:`2026-90048`, :cve_nist:`2026-90049`, :cve_nist:`2026-900=
51`, :cve_nist:`2026-90053`, :cve_nist:`2026-90054`, :cve_nist:`2026-90055`=
, :cve_nist:`2026-90056`, :cve_nist:`2026-90057`, :cve_nist:`2026-90058`, :=
cve_nist:`2026-90059`, :cve_nist:`2026-90060`, :cve_nist:`2026-90061`, :cve=
_nist:`2026-90062`, :cve_nist:`2026-90063`, :cve_nist:`2026-90065`, :cve_ni=
st:`2026-90066`, :cve_nist:`2026-90067`, :cve_nist:`2026-90068`, :cve_nist:=
`2026-90069`, :cve_nist:`2026-90070`, :cve_nist:`2026-90071`, :cve_nist:`20=
26-90072`, :cve_nist:`2026-90073`, :cve_nist:`2026-90074`, :cve_nist:`2026-=
90075`, :cve_nist:`2026-90076`, :cve_nist:`2026-90077`, :cve_nist:`2026-900=
78`, :cve_nist:`2026-90079`, :cve_nist:`2026-90080`, :cve_nist:`2026-90081`=
, :cve_nist:`2026-90082`, :cve_nist:`2026-90083`, :cve_nist:`2026-90084`, :=
cve_nist:`2026-90085`, :cve_nist:`2026-90086`, :cve_nist:`2026-90088`, :cve=
_nist:`2026-90089`, :cve_nist:`2026-90090`, :cve_nist:`2026-90091`, :cve_ni=
st:`2026-90092`, :cve_nist:`2026-90093`, :cve_nist:`2026-90094`, :cve_nist:=
`2026-90095`, :cve_nist:`2026-90097`, :cve_nist:`2026-90098`, :cve_nist:`20=
26-90099`, :cve_nist:`2026-90100`, :cve_nist:`2026-90101`, :cve_nist:`2026-=
90102`, :cve_nist:`2026-90103`, :cve_nist:`2026-90104`, :cve_nist:`2026-901=
05`, :cve_nist:`2026-90106`, :cve_nist:`2026-90107`, :cve_nist:`2026-90108`=
, :cve_nist:`2026-90109`, :cve_nist:`2026-90110`, :cve_nist:`2026-90111`, :=
cve_nist:`2026-90112`, :cve_nist:`2026-90113`, :cve_nist:`2026-90114`, :cve=
_nist:`2026-90115`, :cve_nist:`2026-90116`, :cve_nist:`2026-90119`, :cve_ni=
st:`2026-90121`, :cve_nist:`2026-90122`, :cve_nist:`2026-90124`, :cve_nist:=
`2026-90125`, :cve_nist:`2026-90126`, :cve_nist:`2026-90127`, :cve_nist:`20=
26-90128`, :cve_nist:`2026-90129`, :cve_nist:`2026-90130`, :cve_nist:`2026-=
90135`, :cve_nist:`2026-90136`, :cve_nist:`2026-90137`, :cve_nist:`2026-901=
38`, :cve_nist:`2026-90139`, :cve_nist:`2026-90140`, :cve_nist:`2026-90141`=
, :cve_nist:`2026-90142`, :cve_nist:`2026-90143`, :cve_nist:`2026-90144`, :=
cve_nist:`2026-90145`, :cve_nist:`2026-90146`, :cve_nist:`2026-90147`, :cve=
_nist:`2026-90148`, :cve_nist:`2026-90149`, :cve_nist:`2026-90150`, :cve_ni=
st:`2026-90151`, :cve_nist:`2026-90152`, :cve_nist:`2026-90153`, :cve_nist:=
`2026-90154`, :cve_nist:`2026-90155`, :cve_nist:`2026-90156`, :cve_nist:`20=
26-90157`, :cve_nist:`2026-90158`, :cve_nist:`2026-90159`, :cve_nist:`2026-=
90160`, :cve_nist:`2026-90161`, :cve_nist:`2026-90162`, :cve_nist:`2026-901=
65`, :cve_nist:`2026-90166`, :cve_nist:`2026-90167`, :cve_nist:`2026-90168`=
, :cve_nist:`2026-90169`, :cve_nist:`2026-90170`, :cve_nist:`2026-90174`, :=
cve_nist:`2026-90175`, :cve_nist:`2026-90176`, :cve_nist:`2026-90177`, :cve=
_nist:`2026-90178`, :cve_nist:`2026-90179`, :cve_nist:`2026-90180`, :cve_ni=
st:`2026-90182`, :cve_nist:`2026-90183`, :cve_nist:`2026-90184`, :cve_nist:=
`2026-90185`, :cve_nist:`2026-90186`, :cve_nist:`2026-90187`, :cve_nist:`20=
26-90188`, :cve_nist:`2026-90189`, :cve_nist:`2026-90190`, :cve_nist:`2026-=
90191`, :cve_nist:`2026-90192`, :cve_nist:`2026-90193`, :cve_nist:`2026-901=
94`, :cve_nist:`2026-90195`, :cve_nist:`2026-90196`, :cve_nist:`2026-90197`=
, :cve_nist:`2026-90198`, :cve_nist:`2026-90199`, :cve_nist:`2026-90200`, :=
cve_nist:`2026-90201`, :cve_nist:`2026-90202`, :cve_nist:`2026-90203`, :cve=
_nist:`2026-90204`, :cve_nist:`2026-90205`, :cve_nist:`2026-90206`, :cve_ni=
st:`2026-90207`, :cve_nist:`2026-90208`, :cve_nist:`2026-90209`, :cve_nist:=
`2026-90211`, :cve_nist:`2026-90213`, :cve_nist:`2026-90214`, :cve_nist:`20=
26-90215`, :cve_nist:`2026-90216`, :cve_nist:`2026-90217`, :cve_nist:`2026-=
90218`, :cve_nist:`2026-90219`, :cve_nist:`2026-90220`, :cve_nist:`2026-902=
21`, :cve_nist:`2026-90222`, :cve_nist:`2026-90223`, :cve_nist:`2026-90224`=
, :cve_nist:`2026-90225`, :cve_nist:`2026-90226`, :cve_nist:`2026-90227`, :=
cve_nist:`2026-90228`, :cve_nist:`2026-90229`, :cve_nist:`2026-90230`, :cve=
_nist:`2026-90231`, :cve_nist:`2026-90232`, :cve_nist:`2026-90233`, :cve_ni=
st:`2026-90234`, :cve_nist:`2026-90235`, :cve_nist:`2026-90237`, :cve_nist:=
`2026-90240`, :cve_nist:`2026-90241`, :cve_nist:`2026-90242`, :cve_nist:`20=
26-90243`, :cve_nist:`2026-90244`, :cve_nist:`2026-90245`, :cve_nist:`2026-=
90247`, :cve_nist:`2026-90248`, :cve_nist:`2026-90249`, :cve_nist:`2026-902=
50`, :cve_nist:`2026-90251`, :cve_nist:`2026-90252`, :cve_nist:`2026-90253`=
, :cve_nist:`2026-90254`, :cve_nist:`2026-90255`, :cve_nist:`2026-90257`, :=
cve_nist:`2026-90258`, :cve_nist:`2026-90259`, :cve_nist:`2026-90260`, :cve=
_nist:`2026-90262`, :cve_nist:`2026-90263`, :cve_nist:`2026-90264`, :cve_ni=
st:`2026-90265`, :cve_nist:`2026-90267`, :cve_nist:`2026-90269`, :cve_nist:=
`2026-90272`, :cve_nist:`2026-90273`, :cve_nist:`2026-90274`, :cve_nist:`20=
26-90275`, :cve_nist:`2026-90276`, :cve_nist:`2026-90277`, :cve_nist:`2026-=
90278`, :cve_nist:`2026-90279`, :cve_nist:`2026-90280`, :cve_nist:`2026-902=
81`, :cve_nist:`2026-90282`, :cve_nist:`2026-90283`, :cve_nist:`2026-90284`=
, :cve_nist:`2026-90285`, :cve_nist:`2026-90286`, :cve_nist:`2026-90287`, :=
cve_nist:`2026-90290`, :cve_nist:`2026-90291`, :cve_nist:`2026-90292`, :cve=
_nist:`2026-90293`, :cve_nist:`2026-90294`, :cve_nist:`2026-90295`, :cve_ni=
st:`2026-90296`, :cve_nist:`2026-90297`, :cve_nist:`2026-90298`, :cve_nist:=
`2026-90301`, :cve_nist:`2026-90302`, :cve_nist:`2026-90303`, :cve_nist:`20=
26-90306`, :cve_nist:`2026-90307`, :cve_nist:`2026-90308`, :cve_nist:`2026-=
90309`, :cve_nist:`2026-90311`, :cve_nist:`2026-90312`, :cve_nist:`2026-903=
13`, :cve_nist:`2026-90314`, :cve_nist:`2026-90315`, :cve_nist:`2026-90316`=
, :cve_nist:`2026-90317`, :cve_nist:`2026-90318`, :cve_nist:`2026-90319`, :=
cve_nist:`2026-90320`, :cve_nist:`2026-90321`, :cve_nist:`2026-90322`, :cve=
_nist:`2026-90323`, :cve_nist:`2026-90324`, :cve_nist:`2026-90325`, :cve_ni=
st:`2026-90326`, :cve_nist:`2026-90327`, :cve_nist:`2026-90328`, :cve_nist:=
`2026-90329`, :cve_nist:`2026-90330`, :cve_nist:`2026-90333`, :cve_nist:`20=
26-90334`, :cve_nist:`2026-90335`, :cve_nist:`2026-90336`, :cve_nist:`2026-=
90337`, :cve_nist:`2026-90338`, :cve_nist:`2026-90341`, :cve_nist:`2026-903=
43`, :cve_nist:`2026-90344`, :cve_nist:`2026-90345`, :cve_nist:`2026-90346`=
, :cve_nist:`2026-90347`, :cve_nist:`2026-90348`, :cve_nist:`2026-90349`, :=
cve_nist:`2026-90350`, :cve_nist:`2026-90351`, :cve_nist:`2026-90352`, :cve=
_nist:`2026-90353`, :cve_nist:`2026-90354`, :cve_nist:`2026-90355`, :cve_ni=
st:`2026-90356`, :cve_nist:`2026-90357`, :cve_nist:`2026-90358`, :cve_nist:=
`2026-90359`, :cve_nist:`2026-90360`, :cve_nist:`2026-90361`, :cve_nist:`20=
26-90362`, :cve_nist:`2026-90363`, :cve_nist:`2026-90364`, :cve_nist:`2026-=
90365`, :cve_nist:`2026-90366`, :cve_nist:`2026-90367`, :cve_nist:`2026-903=
68`, :cve_nist:`2026-90370`, :cve_nist:`2026-90371`, :cve_nist:`2026-90372`=
, :cve_nist:`2026-90373`, :cve_nist:`2026-90374`, :cve_nist:`2026-90375`, :=
cve_nist:`2026-90376`, :cve_nist:`2026-90377`, :cve_nist:`2026-90378`, :cve=
_nist:`2026-90379`, :cve_nist:`2026-90380`, :cve_nist:`2026-90381`, :cve_ni=
st:`2026-90382`, :cve_nist:`2026-90383`, :cve_nist:`2026-90385`, :cve_nist:=
`2026-90386`, :cve_nist:`2026-90387`, :cve_nist:`2026-90388`, :cve_nist:`20=
26-90389`, :cve_nist:`2026-90390`, :cve_nist:`2026-90391`, :cve_nist:`2026-=
90392`, :cve_nist:`2026-90393`, :cve_nist:`2026-90394`, :cve_nist:`2026-903=
95`, :cve_nist:`2026-90396`, :cve_nist:`2026-90397`, :cve_nist:`2026-90398`=
, :cve_nist:`2026-90399`, :cve_nist:`2026-90400`, :cve_nist:`2026-90402`, :=
cve_nist:`2026-90403`, :cve_nist:`2026-90404`, :cve_nist:`2026-90406`, :cve=
_nist:`2026-90407`, :cve_nist:`2026-90408`, :cve_nist:`2026-90409`, :cve_ni=
st:`2026-90410`, :cve_nist:`2026-90411`, :cve_nist:`2026-90412`, :cve_nist:=
`2026-90413`, :cve_nist:`2026-90414`, :cve_nist:`2026-90415`, :cve_nist:`20=
26-90416`, :cve_nist:`2026-90417`, :cve_nist:`2026-90418`, :cve_nist:`2026-=
90419`, :cve_nist:`2026-90420`, :cve_nist:`2026-90421`, :cve_nist:`2026-904=
22`, :cve_nist:`2026-90423`, :cve_nist:`2026-90424`, :cve_nist:`2026-90425`=
, :cve_nist:`2026-90426`, :cve_nist:`2026-90427`, :cve_nist:`2026-90428`, :=
cve_nist:`2026-90429`, :cve_nist:`2026-90430`, :cve_nist:`2026-90431`, :cve=
_nist:`2026-90433`, :cve_nist:`2026-90434`, :cve_nist:`2026-90435`, :cve_ni=
st:`2026-92476`, :cve_nist:`2026-92477`, :cve_nist:`2026-92480`, :cve_nist:=
`2026-92481`, :cve_nist:`2026-92482`, :cve_nist:`2026-92484`, :cve_nist:`20=
26-92486`, :cve_nist:`2026-92488`, :cve_nist:`2026-92489`, :cve_nist:`2026-=
92490`, :cve_nist:`2026-92491`, :cve_nist:`2026-92493`, :cve_nist:`2026-924=
94`, :cve_nist:`2026-92495`, :cve_nist:`2026-92496`, :cve_nist:`2026-92497`=
, :cve_nist:`2026-92498`, :cve_nist:`2026-92499`, :cve_nist:`2026-92500`, :=
cve_nist:`2026-92501`, :cve_nist:`2026-92502`, :cve_nist:`2026-92504`, :cve=
_nist:`2026-92505`, :cve_nist:`2026-92506`, :cve_nist:`2026-92507`, :cve_ni=
st:`2026-92508`, :cve_nist:`2026-92509`, :cve_nist:`2026-92510`, :cve_nist:=
`2026-92511`, :cve_nist:`2026-92512`, :cve_nist:`2026-92513`, :cve_nist:`20=
26-92514`, :cve_nist:`2026-92515`, :cve_nist:`2026-92516`, :cve_nist:`2026-=
92517`, :cve_nist:`2026-92518`, :cve_nist:`2026-92519`, :cve_nist:`2026-925=
20`, :cve_nist:`2026-92521`, :cve_nist:`2026-92522`, :cve_nist:`2026-92523`=
, :cve_nist:`2026-92524`, :cve_nist:`2026-92525`, :cve_nist:`2026-93037`, :=
cve_nist:`2026-93039`, :cve_nist:`2026-93040`, :cve_nist:`2026-93041`, :cve=
_nist:`2026-93042`, :cve_nist:`2026-93044`, :cve_nist:`2026-93045`, :cve_ni=
st:`2026-93046`, :cve_nist:`2026-93047`, :cve_nist:`2026-93048`, :cve_nist:=
`2026-93049`, :cve_nist:`2026-93050`, :cve_nist:`2026-93051`, :cve_nist:`20=
26-93052`, :cve_nist:`2026-93053`, :cve_nist:`2026-93054`, :cve_nist:`2026-=
93055`, :cve_nist:`2026-93056`, :cve_nist:`2026-93058`, :cve_nist:`2026-930=
59`, :cve_nist:`2026-93061`, :cve_nist:`2026-93062`, :cve_nist:`2026-93063`=
, :cve_nist:`2026-93064`, :cve_nist:`2026-93065`, :cve_nist:`2026-93066`, :=
cve_nist:`2026-93067`, :cve_nist:`2026-93068`, :cve_nist:`2026-93070`, :cve=
_nist:`2026-93071`, :cve_nist:`2026-93072`, :cve_nist:`2026-93073`, :cve_ni=
st:`2026-93077`, :cve_nist:`2026-93078`, :cve_nist:`2026-93079`, :cve_nist:=
`2026-93080`, :cve_nist:`2026-93082`, :cve_nist:`2026-93083`, :cve_nist:`20=
26-93084`, :cve_nist:`2026-93085`, :cve_nist:`2026-93086`, :cve_nist:`2026-=
93089`, :cve_nist:`2026-93090`, :cve_nist:`2026-93091`, :cve_nist:`2026-930=
92`, :cve_nist:`2026-93093`, :cve_nist:`2026-93095`, :cve_nist:`2026-93096`=
, :cve_nist:`2026-93097`, :cve_nist:`2026-93098`, :cve_nist:`2026-93099`, :=
cve_nist:`2026-93100`, :cve_nist:`2026-93101`, :cve_nist:`2026-93102`, :cve=
_nist:`2026-93103`, :cve_nist:`2026-93104`, :cve_nist:`2026-93105`, :cve_ni=
st:`2026-93106`, :cve_nist:`2026-93107`, :cve_nist:`2026-93108`, :cve_nist:=
`2026-93109`, :cve_nist:`2026-93110`, :cve_nist:`2026-93112`, :cve_nist:`20=
26-93113`, :cve_nist:`2026-93114`, :cve_nist:`2026-93115`, :cve_nist:`2026-=
93116`, :cve_nist:`2026-93117`, :cve_nist:`2026-93118`, :cve_nist:`2026-931=
19`, :cve_nist:`2026-93120`, :cve_nist:`2026-93121`, :cve_nist:`2026-93122`=
, :cve_nist:`2026-93123`, :cve_nist:`2026-93125`, :cve_nist:`2026-93126`, :=
cve_nist:`2026-93128`, :cve_nist:`2026-93129`, :cve_nist:`2026-93130`, :cve=
_nist:`2026-93131`, :cve_nist:`2026-93132`, :cve_nist:`2026-93133`, :cve_ni=
st:`2026-93134`, :cve_nist:`2026-93135`, :cve_nist:`2026-93136`, :cve_nist:=
`2026-93137`, :cve_nist:`2026-93138`, :cve_nist:`2026-93140`, :cve_nist:`20=
26-93141`, :cve_nist:`2026-93142`, :cve_nist:`2026-93143`, :cve_nist:`2026-=
93144`, :cve_nist:`2026-93145`, :cve_nist:`2026-93146`, :cve_nist:`2026-931=
48`, :cve_nist:`2026-93149`, :cve_nist:`2026-93150`, :cve_nist:`2026-93151`=
, :cve_nist:`2026-93152`, :cve_nist:`2026-93154`, :cve_nist:`2026-93155`, :=
cve_nist:`2026-93156`, :cve_nist:`2026-93157`, :cve_nist:`2026-93158`, :cve=
_nist:`2026-93159`, :cve_nist:`2026-93160`, :cve_nist:`2026-93161`, :cve_ni=
st:`2026-93162`, :cve_nist:`2026-93163`, :cve_nist:`2026-93164`, :cve_nist:=
`2026-93165`, :cve_nist:`2026-93167`, :cve_nist:`2026-93168`, :cve_nist:`20=
26-93169`, :cve_nist:`2026-93170`, :cve_nist:`2026-93172`, :cve_nist:`2026-=
93173`, :cve_nist:`2026-93174`, :cve_nist:`2026-93175`, :cve_nist:`2026-931=
76`, :cve_nist:`2026-93177`, :cve_nist:`2026-93178`, :cve_nist:`2026-93179`=
, :cve_nist:`2026-93181`, :cve_nist:`2026-93182`, :cve_nist:`2026-93183`, :=
cve_nist:`2026-93184`, :cve_nist:`2026-93185`, :cve_nist:`2026-93186`, :cve=
_nist:`2026-93188`, :cve_nist:`2026-93189`, :cve_nist:`2026-93190`, :cve_ni=
st:`2026-93191`, :cve_nist:`2026-93192`, :cve_nist:`2026-93193`, :cve_nist:=
`2026-93194`, :cve_nist:`2026-93195`, :cve_nist:`2026-93196`, :cve_nist:`20=
26-93198`, :cve_nist:`2026-93199`, :cve_nist:`2026-93200`, :cve_nist:`2026-=
93201`, :cve_nist:`2026-93202`, :cve_nist:`2026-93203`, :cve_nist:`2026-932=
04`
+     - :cve_nist:`2019-14899`, :cve_nist:`2020-10774`, :cve_nist:`2021-371=
4`, :cve_nist:`2021-3864`, :cve_nist:`2022-0400`, :cve_nist:`2022-1247`, :c=
ve_nist:`2022-4543`, :cve_nist:`2023-3397`, :cve_nist:`2023-3640`, :cve_nis=
t:`2023-6238`, :cve_nist:`2023-6240`, :cve_nist:`2025-71074`, :cve_nist:`20=
25-71306`, :cve_nist:`2025-71308`, :cve_nist:`2025-71313`, :cve_nist:`2026-=
23328`, :cve_nist:`2026-23374`, :cve_nist:`2026-23377`, :cve_nist:`2026-315=
01`, :cve_nist:`2026-31771`, :cve_nist:`2026-31777`, :cve_nist:`2026-43022`=
, :cve_nist:`2026-43042`, :cve_nist:`2026-43045`, :cve_nist:`2026-43053`, :=
cve_nist:`2026-43095`, :cve_nist:`2026-43115`, :cve_nist:`2026-43131`, :cve=
_nist:`2026-43174`, :cve_nist:`2026-43191`, :cve_nist:`2026-43204`, :cve_ni=
st:`2026-43228`, :cve_nist:`2026-43299`, :cve_nist:`2026-43308`, :cve_nist:=
`2026-43310`, :cve_nist:`2026-43311`, :cve_nist:`2026-43326`, :cve_nist:`20=
26-43414`, :cve_nist:`2026-43443`, :cve_nist:`2026-45961`, :cve_nist:`2026-=
45991`, :cve_nist:`2026-46008`, :cve_nist:`2026-46017`, :cve_nist:`2026-460=
32`, :cve_nist:`2026-46153`, :cve_nist:`2026-46210`, :cve_nist:`2026-46245`=
, :cve_nist:`2026-46298`, :cve_nist:`2026-46302`, :cve_nist:`2026-46311`, :=
cve_nist:`2026-46330`, :cve_nist:`2026-52949`, :cve_nist:`2026-52956`, :cve=
_nist:`2026-52960`, :cve_nist:`2026-52965`, :cve_nist:`2026-52988`, :cve_ni=
st:`2026-53007`, :cve_nist:`2026-53008`, :cve_nist:`2026-53009`, :cve_nist:=
`2026-53017`, :cve_nist:`2026-53024`, :cve_nist:`2026-53025`, :cve_nist:`20=
26-53091`, :cve_nist:`2026-53106`, :cve_nist:`2026-53108`, :cve_nist:`2026-=
53124`, :cve_nist:`2026-53222`, :cve_nist:`2026-53257`, :cve_nist:`2026-532=
85`, :cve_nist:`2026-53292`, :cve_nist:`2026-53308`, :cve_nist:`2026-53401`=
, :cve_nist:`2026-63811`, :cve_nist:`2026-63879`, :cve_nist:`2026-63941`, :=
cve_nist:`2026-63977`, :cve_nist:`2026-63983`, :cve_nist:`2026-64013`, :cve=
_nist:`2026-64019`, :cve_nist:`2026-64020`, :cve_nist:`2026-64040`, :cve_ni=
st:`2026-64057`, :cve_nist:`2026-64067`, :cve_nist:`2026-64079`, :cve_nist:=
`2026-64117`, :cve_nist:`2026-64123`, :cve_nist:`2026-64146`, :cve_nist:`20=
26-64154`, :cve_nist:`2026-64159`, :cve_nist:`2026-64160`, :cve_nist:`2026-=
64283`, :cve_nist:`2026-64325`, :cve_nist:`2026-64341`, :cve_nist:`2026-643=
88`, :cve_nist:`2026-64400`, :cve_nist:`2026-68086`, :cve_nist:`2026-68103`=
, :cve_nist:`2026-68105`, :cve_nist:`2026-68242`, :cve_nist:`2026-68286`, :=
cve_nist:`2026-68287`, :cve_nist:`2026-68288`, :cve_nist:`2026-68289`, :cve=
_nist:`2026-68291`, :cve_nist:`2026-68295`, :cve_nist:`2026-68303`, :cve_ni=
st:`2026-68305`, :cve_nist:`2026-68312`, :cve_nist:`2026-68323`, :cve_nist:=
`2026-68337`, :cve_nist:`2026-68375`, :cve_nist:`2026-68399`, :cve_nist:`20=
26-68404`, :cve_nist:`2026-68436`, :cve_nist:`2026-68441`, :cve_nist:`2026-=
68447`, :cve_nist:`2026-68470`, :cve_nist:`2026-72031`, :cve_nist:`2026-720=
64`, :cve_nist:`2026-72091`, :cve_nist:`2026-72315`, :cve_nist:`2026-72329`=
, :cve_nist:`2026-72331`, :cve_nist:`2026-72334`, :cve_nist:`2026-72337`, :=
cve_nist:`2026-72345`, :cve_nist:`2026-72355`, :cve_nist:`2026-72370`, :cve=
_nist:`2026-72377`, :cve_nist:`2026-72380`, :cve_nist:`2026-72388`, :cve_ni=
st:`2026-72397`, :cve_nist:`2026-72402`, :cve_nist:`2026-72404`, :cve_nist:=
`2026-72413`, :cve_nist:`2026-72423`, :cve_nist:`2026-72438`, :cve_nist:`20=
26-72440`, :cve_nist:`2026-72454`, :cve_nist:`2026-72463`, :cve_nist:`2026-=
72477`, :cve_nist:`2026-72485`, :cve_nist:`2026-72494`, :cve_nist:`2026-724=
96`, :cve_nist:`2026-72497`, :cve_nist:`2026-72499`, :cve_nist:`2026-74258`=
, :cve_nist:`2026-74260`, :cve_nist:`2026-74269`, :cve_nist:`2026-74272`, :=
cve_nist:`2026-74273`, :cve_nist:`2026-74277`, :cve_nist:`2026-74289`, :cve=
_nist:`2026-74291`, :cve_nist:`2026-74294`, :cve_nist:`2026-74307`, :cve_ni=
st:`2026-74317`, :cve_nist:`2026-74336`, :cve_nist:`2026-74338`, :cve_nist:=
`2026-74342`, :cve_nist:`2026-74347`, :cve_nist:`2026-74350`, :cve_nist:`20=
26-74354`, :cve_nist:`2026-74367`, :cve_nist:`2026-74373`, :cve_nist:`2026-=
74374`, :cve_nist:`2026-74375`, :cve_nist:`2026-74407`, :cve_nist:`2026-744=
19`, :cve_nist:`2026-74449`, :cve_nist:`2026-74466`, :cve_nist:`2026-74496`=
, :cve_nist:`2026-74521`, :cve_nist:`2026-74527`, :cve_nist:`2026-74542`, :=
cve_nist:`2026-74544`, :cve_nist:`2026-74558`, :cve_nist:`2026-74561`, :cve=
_nist:`2026-74562`, :cve_nist:`2026-74568`, :cve_nist:`2026-74713`, :cve_ni=
st:`2026-74715`, :cve_nist:`2026-74716`, :cve_nist:`2026-74721`, :cve_nist:=
`2026-74723`, :cve_nist:`2026-74729`, :cve_nist:`2026-74735`, :cve_nist:`20=
26-74745`, :cve_nist:`2026-74747`, :cve_nist:`2026-74750`, :cve_nist:`2026-=
74752`, :cve_nist:`2026-74754`, :cve_nist:`2026-80521`, :cve_nist:`2026-805=
24`, :cve_nist:`2026-80579`, :cve_nist:`2026-80580`, :cve_nist:`2026-80631`=
, :cve_nist:`2026-80634`, :cve_nist:`2026-80655`, :cve_nist:`2026-80657`, :=
cve_nist:`2026-80668`, :cve_nist:`2026-80693`, :cve_nist:`2026-80705`, :cve=
_nist:`2026-80729`, :cve_nist:`2026-80738`, :cve_nist:`2026-80747`, :cve_ni=
st:`2026-80785`, :cve_nist:`2026-80786`, :cve_nist:`2026-80884`, :cve_nist:=
`2026-80899`, :cve_nist:`2026-89513`, :cve_nist:`2026-89527`, :cve_nist:`20=
26-89534`, :cve_nist:`2026-89537`, :cve_nist:`2026-89568`, :cve_nist:`2026-=
89584`, :cve_nist:`2026-89601`, :cve_nist:`2026-89610`, :cve_nist:`2026-896=
11`, :cve_nist:`2026-89642`, :cve_nist:`2026-89654`, :cve_nist:`2026-89705`=
, :cve_nist:`2026-89709`, :cve_nist:`2026-89718`, :cve_nist:`2026-89755`, :=
cve_nist:`2026-89764`, :cve_nist:`2026-89772`, :cve_nist:`2026-89792`, :cve=
_nist:`2026-89796`, :cve_nist:`2026-89805`, :cve_nist:`2026-89812`, :cve_ni=
st:`2026-89813`, :cve_nist:`2026-89815`, :cve_nist:`2026-89827`, :cve_nist:=
`2026-89838`, :cve_nist:`2026-89840`, :cve_nist:`2026-89859`, :cve_nist:`20=
26-89862`, :cve_nist:`2026-89866`, :cve_nist:`2026-89868`, :cve_nist:`2026-=
89907`, :cve_nist:`2026-90040`, :cve_nist:`2026-90061`, :cve_nist:`2026-900=
79`, :cve_nist:`2026-90082`, :cve_nist:`2026-90093`, :cve_nist:`2026-90095`=
, :cve_nist:`2026-90098`, :cve_nist:`2026-90099`, :cve_nist:`2026-90104`, :=
cve_nist:`2026-90105`, :cve_nist:`2026-90106`, :cve_nist:`2026-90111`, :cve=
_nist:`2026-90121`, :cve_nist:`2026-90142`, :cve_nist:`2026-90144`, :cve_ni=
st:`2026-90154`, :cve_nist:`2026-90155`, :cve_nist:`2026-90156`, :cve_nist:=
`2026-90162`, :cve_nist:`2026-90167`, :cve_nist:`2026-90174`, :cve_nist:`20=
26-90177`, :cve_nist:`2026-90182`, :cve_nist:`2026-90183`, :cve_nist:`2026-=
90206`, :cve_nist:`2026-90208`, :cve_nist:`2026-90211`, :cve_nist:`2026-902=
17`, :cve_nist:`2026-90234`, :cve_nist:`2026-90237`, :cve_nist:`2026-90242`=
, :cve_nist:`2026-90263`, :cve_nist:`2026-90267`, :cve_nist:`2026-90273`, :=
cve_nist:`2026-90301`, :cve_nist:`2026-90311`, :cve_nist:`2026-90315`, :cve=
_nist:`2026-90317`, :cve_nist:`2026-90320`, :cve_nist:`2026-90321`, :cve_ni=
st:`2026-90323`, :cve_nist:`2026-90330`, :cve_nist:`2026-90335`, :cve_nist:=
`2026-90336`, :cve_nist:`2026-90337`, :cve_nist:`2026-90345`, :cve_nist:`20=
26-90346`, :cve_nist:`2026-90347`, :cve_nist:`2026-90355`, :cve_nist:`2026-=
90359`, :cve_nist:`2026-90365`, :cve_nist:`2026-90380`, :cve_nist:`2026-903=
81`, :cve_nist:`2026-90408`, :cve_nist:`2026-90409`, :cve_nist:`2026-90412`=
, :cve_nist:`2026-90417`, :cve_nist:`2026-90421`, :cve_nist:`2026-90427`, :=
cve_nist:`2026-92480`, :cve_nist:`2026-92482`, :cve_nist:`2026-93044`, :cve=
_nist:`2026-93047`, :cve_nist:`2026-93096`, :cve_nist:`2026-93099`, :cve_ni=
st:`2026-93104`, :cve_nist:`2026-93105`, :cve_nist:`2026-93116`, :cve_nist:=
`2026-93122`, :cve_nist:`2026-93125`, :cve_nist:`2026-93129`, :cve_nist:`20=
26-93135`, :cve_nist:`2026-93144`, :cve_nist:`2026-93148`, :cve_nist:`2026-=
93164`, :cve_nist:`2026-93168`, :cve_nist:`2026-93175`, :cve_nist:`2026-931=
76`, :cve_nist:`2026-93179`, :cve_nist:`2026-93181`, :cve_nist:`2026-93201`=
, :cve_nist:`2026-93216`, :cve_nist:`2026-93221`, :cve_nist:`2026-93248`, :=
cve_nist:`2026-93251`, :cve_nist:`2026-93260`, :cve_nist:`2026-93270`, :cve=
_nist:`2026-93282`, :cve_nist:`2026-93284`, :cve_nist:`2026-93285`, :cve_ni=
st:`2026-93286`, :cve_nist:`2026-93287`, :cve_nist:`2026-93288`, :cve_nist:=
`2026-93781`, :cve_nist:`2026-93782`, :cve_nist:`2026-93783`, :cve_nist:`20=
26-93784`, :cve_nist:`2026-93785`, :cve_nist:`2026-93786`, :cve_nist:`2026-=
93787`, :cve_nist:`2026-93788`, :cve_nist:`2026-93789`, :cve_nist:`2026-937=
90`, :cve_nist:`2026-93791`, :cve_nist:`2026-93792`, :cve_nist:`2026-93793`=
, :cve_nist:`2026-93794`, :cve_nist:`2026-93795`, :cve_nist:`2026-93796`, :=
cve_nist:`2026-93797`, :cve_nist:`2026-93798`, :cve_nist:`2026-93799`, :cve=
_nist:`2026-93800`, :cve_nist:`2026-93801`, :cve_nist:`2026-93802`, :cve_ni=
st:`2026-93803`, :cve_nist:`2026-93804`, :cve_nist:`2026-93805`, :cve_nist:=
`2026-93806`, :cve_nist:`2026-93807`, :cve_nist:`2026-93808`, :cve_nist:`20=
26-93810`, :cve_nist:`2026-93811`, :cve_nist:`2026-93812`, :cve_nist:`2026-=
93813`, :cve_nist:`2026-93814`, :cve_nist:`2026-93815`, :cve_nist:`2026-938=
16`, :cve_nist:`2026-93817`, :cve_nist:`2026-93818`, :cve_nist:`2026-93819`=
, :cve_nist:`2026-93820`, :cve_nist:`2026-93821`, :cve_nist:`2026-93822`, :=
cve_nist:`2026-93823`, :cve_nist:`2026-93824`, :cve_nist:`2026-93825`, :cve=
_nist:`2026-93826`, :cve_nist:`2026-93827`, :cve_nist:`2026-93828`, :cve_ni=
st:`2026-93829`, :cve_nist:`2026-93830`, :cve_nist:`2026-97407`, :cve_nist:=
`2026-97408`, :cve_nist:`2026-97409`, :cve_nist:`2026-97410`, :cve_nist:`20=
26-97411`, :cve_nist:`2026-97412`, :cve_nist:`2026-97413`, :cve_nist:`2026-=
97414`, :cve_nist:`2026-97415`, :cve_nist:`2026-97416`, :cve_nist:`2026-974=
17`, :cve_nist:`2026-97418`, :cve_nist:`2026-97419`, :cve_nist:`2026-97420`=
, :cve_nist:`2026-97421`, :cve_nist:`2026-97422`, :cve_nist:`2026-97423`, :=
cve_nist:`2026-97424`, :cve_nist:`2026-97425`, :cve_nist:`2026-97426`, :cve=
_nist:`2026-97427`, :cve_nist:`2026-97428`, :cve_nist:`2026-97429`, :cve_ni=
st:`2026-97430`, :cve_nist:`2026-97431`, :cve_nist:`2026-97432`, :cve_nist:=
`2026-97433`, :cve_nist:`2026-97434`, :cve_nist:`2026-97435`, :cve_nist:`20=
26-97436`, :cve_nist:`2026-97437`, :cve_nist:`2026-97438`, :cve_nist:`2026-=
97439`, :cve_nist:`2026-97440`, :cve_nist:`2026-97441`, :cve_nist:`2026-974=
42`, :cve_nist:`2026-97443`, :cve_nist:`2026-97444`, :cve_nist:`2026-97445`=
, :cve_nist:`2026-97446`, :cve_nist:`2026-97447`, :cve_nist:`2026-97448`, :=
cve_nist:`2026-97449`, :cve_nist:`2026-97450`, :cve_nist:`2026-97451`, :cve=
_nist:`2026-97452`, :cve_nist:`2026-97453`, :cve_nist:`2026-97454`, :cve_ni=
st:`2026-97455`, :cve_nist:`2026-97456`, :cve_nist:`2026-97472`, :cve_nist:=
`2026-97473`, :cve_nist:`2026-97474`, :cve_nist:`2026-97475`, :cve_nist:`20=
26-97476`, :cve_nist:`2026-97477`, :cve_nist:`2026-97478`, :cve_nist:`2026-=
97479`, :cve_nist:`2026-97480`, :cve_nist:`2026-97481`, :cve_nist:`2026-974=
82`, :cve_nist:`2026-97483`, :cve_nist:`2026-97484`, :cve_nist:`2026-97485`=
, :cve_nist:`2026-97486`, :cve_nist:`2026-97487`, :cve_nist:`2026-97488`, :=
cve_nist:`2026-97489`, :cve_nist:`2026-97490`, :cve_nist:`2026-97491`, :cve=
_nist:`2026-97492`, :cve_nist:`2026-97493`, :cve_nist:`2026-97494`, :cve_ni=
st:`2026-97495`, :cve_nist:`2026-97496`, :cve_nist:`2026-97497`, :cve_nist:=
`2026-97498`, :cve_nist:`2026-97499`, :cve_nist:`2026-97500`, :cve_nist:`20=
26-97501`, :cve_nist:`2026-97502`, :cve_nist:`2026-97503`, :cve_nist:`2026-=
97504`, :cve_nist:`2026-97505`, :cve_nist:`2026-97506`, :cve_nist:`2026-975=
07`, :cve_nist:`2026-97508`, :cve_nist:`2026-97509`, :cve_nist:`2026-97510`=
, :cve_nist:`2026-97511`, :cve_nist:`2026-97512`, :cve_nist:`2026-97513`, :=
cve_nist:`2026-97514`, :cve_nist:`2026-97515`, :cve_nist:`2026-97516`, :cve=
_nist:`2026-97517`, :cve_nist:`2026-97518`, :cve_nist:`2026-97519`, :cve_ni=
st:`2026-97520`, :cve_nist:`2026-97521`, :cve_nist:`2026-97522`, :cve_nist:=
`2026-97523`, :cve_nist:`2026-97524`, :cve_nist:`2026-97525`, :cve_nist:`20=
26-97526`, :cve_nist:`2026-97527`, :cve_nist:`2026-97528`, :cve_nist:`2026-=
97529`, :cve_nist:`2026-97530`, :cve_nist:`2026-97531`, :cve_nist:`2026-975=
32`, :cve_nist:`2026-97533`, :cve_nist:`2026-97534`, :cve_nist:`2026-97535`=
, :cve_nist:`2026-97536`, :cve_nist:`2026-97537`, :cve_nist:`2026-97538`, :=
cve_nist:`2026-97539`, :cve_nist:`2026-97540`, :cve_nist:`2026-97541`, :cve=
_nist:`2026-97542`, :cve_nist:`2026-97543`, :cve_nist:`2026-97544`, :cve_ni=
st:`2026-97545`, :cve_nist:`2026-97546`, :cve_nist:`2026-97547`, :cve_nist:=
`2026-97548`, :cve_nist:`2026-97549`, :cve_nist:`2026-97550`, :cve_nist:`20=
26-97551`, :cve_nist:`2026-97552`, :cve_nist:`2026-97555`, :cve_nist:`2026-=
97556`, :cve_nist:`2026-97557`, :cve_nist:`2026-97558`, :cve_nist:`2026-975=
59`, :cve_nist:`2026-97560`, :cve_nist:`2026-97561`, :cve_nist:`2026-97562`=
, :cve_nist:`2026-97563`, :cve_nist:`2026-97564`, :cve_nist:`2026-97565`, :=
cve_nist:`2026-97566`, :cve_nist:`2026-97567`, :cve_nist:`2026-97568`, :cve=
_nist:`2026-97571`, :cve_nist:`2026-97572`, :cve_nist:`2026-97573`, :cve_ni=
st:`2026-97574`, :cve_nist:`2026-97575`, :cve_nist:`2026-97576`, :cve_nist:=
`2026-97577`, :cve_nist:`2026-97578`, :cve_nist:`2026-97579`, :cve_nist:`20=
26-97581`, :cve_nist:`2026-97582`, :cve_nist:`2026-97583`, :cve_nist:`2026-=
97584`, :cve_nist:`2026-97585`, :cve_nist:`2026-97586`, :cve_nist:`2026-975=
87`, :cve_nist:`2026-97588`, :cve_nist:`2026-97589`, :cve_nist:`2026-97590`=
, :cve_nist:`2026-97591`, :cve_nist:`2026-97592`, :cve_nist:`2026-97593`, :=
cve_nist:`2026-97594`, :cve_nist:`2026-97595`, :cve_nist:`2026-97596`, :cve=
_nist:`2026-97597`, :cve_nist:`2026-97598`, :cve_nist:`2026-97599`, :cve_ni=
st:`2026-97600`, :cve_nist:`2026-97601`, :cve_nist:`2026-97602`, :cve_nist:=
`2026-97603`, :cve_nist:`2026-97604`, :cve_nist:`2026-97605`, :cve_nist:`20=
26-97606`, :cve_nist:`2026-97607`, :cve_nist:`2026-97608`, :cve_nist:`2026-=
97609`, :cve_nist:`2026-97610`, :cve_nist:`2026-97611`, :cve_nist:`2026-976=
12`, :cve_nist:`2026-97613`, :cve_nist:`2026-97614`, :cve_nist:`2026-97615`=
, :cve_nist:`2026-97616`, :cve_nist:`2026-97617`, :cve_nist:`2026-97618`, :=
cve_nist:`2026-97619`, :cve_nist:`2026-97620`, :cve_nist:`2026-97621`, :cve=
_nist:`2026-97899`, :cve_nist:`2026-97900`, :cve_nist:`2026-97901`, :cve_ni=
st:`2026-97902`, :cve_nist:`2026-97903`, :cve_nist:`2026-97904`, :cve_nist:=
`2026-97905`, :cve_nist:`2026-97906`, :cve_nist:`2026-97907`, :cve_nist:`20=
26-97908`, :cve_nist:`2026-97909`, :cve_nist:`2026-97910`, :cve_nist:`2026-=
97915`, :cve_nist:`2026-97916`, :cve_nist:`2026-97917`, :cve_nist:`2026-979=
18`, :cve_nist:`2026-97919`, :cve_nist:`2026-97920`, :cve_nist:`2026-97921`=
, :cve_nist:`2026-97922`, :cve_nist:`2026-97923`, :cve_nist:`2026-97924`, :=
cve_nist:`2026-97925`, :cve_nist:`2026-97926`, :cve_nist:`2026-97927`, :cve=
_nist:`2026-97928`, :cve_nist:`2026-97929`, :cve_nist:`2026-97930`, :cve_ni=
st:`2026-97931`, :cve_nist:`2026-97934`, :cve_nist:`2026-97935`, :cve_nist:=
`2026-97936`, :cve_nist:`2026-97938`, :cve_nist:`2026-97939`, :cve_nist:`20=
26-97940`, :cve_nist:`2026-97942`, :cve_nist:`2026-97943`, :cve_nist:`2026-=
97944`, :cve_nist:`2026-97945`, :cve_nist:`2026-97946`, :cve_nist:`2026-979=
47`, :cve_nist:`2026-97948`, :cve_nist:`2026-97949`, :cve_nist:`2026-97950`=
, :cve_nist:`2026-97951`, :cve_nist:`2026-97952`, :cve_nist:`2026-97953`, :=
cve_nist:`2026-97954`, :cve_nist:`2026-97955`, :cve_nist:`2026-97956`, :cve=
_nist:`2026-97957`, :cve_nist:`2026-97958`, :cve_nist:`2026-97959`, :cve_ni=
st:`2026-97960`, :cve_nist:`2026-97961`, :cve_nist:`2026-97962`, :cve_nist:=
`2026-97963`, :cve_nist:`2026-97964`, :cve_nist:`2026-97965`, :cve_nist:`20=
26-97966`, :cve_nist:`2026-97967`, :cve_nist:`2026-97968`, :cve_nist:`2026-=
97969`, :cve_nist:`2026-97970`, :cve_nist:`2026-97972`, :cve_nist:`2026-979=
73`, :cve_nist:`2026-97974`, :cve_nist:`2026-97975`, :cve_nist:`2026-97976`=
, :cve_nist:`2026-97977`, :cve_nist:`2026-97978`, :cve_nist:`2026-97979`, :=
cve_nist:`2026-97981`, :cve_nist:`2026-97982`, :cve_nist:`2026-97984`, :cve=
_nist:`2026-97985`, :cve_nist:`2026-97986`, :cve_nist:`2026-97987`, :cve_ni=
st:`2026-97988`, :cve_nist:`2026-97989`, :cve_nist:`2026-97990`, :cve_nist:=
`2026-97991`, :cve_nist:`2026-97992`, :cve_nist:`2026-97993`, :cve_nist:`20=
26-97994`, :cve_nist:`2026-97995`, :cve_nist:`2026-97996`, :cve_nist:`2026-=
97997`, :cve_nist:`2026-97998`, :cve_nist:`2026-98000`, :cve_nist:`2026-980=
01`, :cve_nist:`2026-98003`, :cve_nist:`2026-98004`, :cve_nist:`2026-98006`=
, :cve_nist:`2026-98007`, :cve_nist:`2026-98008`, :cve_nist:`2026-98009`, :=
cve_nist:`2026-98010`, :cve_nist:`2026-98011`, :cve_nist:`2026-98012`, :cve=
_nist:`2026-98013`, :cve_nist:`2026-98014`, :cve_nist:`2026-98015`, :cve_ni=
st:`2026-98016`, :cve_nist:`2026-98017`, :cve_nist:`2026-98018`, :cve_nist:=
`2026-98019`, :cve_nist:`2026-98020`, :cve_nist:`2026-98021`, :cve_nist:`20=
26-98022`, :cve_nist:`2026-98023`, :cve_nist:`2026-98024`, :cve_nist:`2026-=
98025`, :cve_nist:`2026-98026`, :cve_nist:`2026-98027`, :cve_nist:`2026-980=
28`, :cve_nist:`2026-98029`, :cve_nist:`2026-98030`, :cve_nist:`2026-98031`=
, :cve_nist:`2026-98032`, :cve_nist:`2026-98033`, :cve_nist:`2026-98037`, :=
cve_nist:`2026-98038`, :cve_nist:`2026-98039`, :cve_nist:`2026-98041`, :cve=
_nist:`2026-98043`, :cve_nist:`2026-98044`, :cve_nist:`2026-98045`, :cve_ni=
st:`2026-98046`, :cve_nist:`2026-98047`, :cve_nist:`2026-98048`, :cve_nist:=
`2026-98049`, :cve_nist:`2026-98050`, :cve_nist:`2026-98051`, :cve_nist:`20=
26-98052`, :cve_nist:`2026-98053`, :cve_nist:`2026-98054`, :cve_nist:`2026-=
98055`, :cve_nist:`2026-98056`, :cve_nist:`2026-98058`, :cve_nist:`2026-980=
59`, :cve_nist:`2026-98060`, :cve_nist:`2026-98061`, :cve_nist:`2026-98062`=
, :cve_nist:`2026-98063`, :cve_nist:`2026-98064`, :cve_nist:`2026-98066`, :=
cve_nist:`2026-98067`, :cve_nist:`2026-98068`, :cve_nist:`2026-98069`, :cve=
_nist:`2026-98070`, :cve_nist:`2026-98071`, :cve_nist:`2026-98072`, :cve_ni=
st:`2026-98073`, :cve_nist:`2026-98074`, :cve_nist:`2026-98075`, :cve_nist:=
`2026-98076`, :cve_nist:`2026-98077`, :cve_nist:`2026-98078`, :cve_nist:`20=
26-98079`, :cve_nist:`2026-98080`, :cve_nist:`2026-98081`, :cve_nist:`2026-=
98082`, :cve_nist:`2026-98083`, :cve_nist:`2026-98085`, :cve_nist:`2026-980=
86`, :cve_nist:`2026-98087`, :cve_nist:`2026-98088`, :cve_nist:`2026-98089`=
, :cve_nist:`2026-98090`, :cve_nist:`2026-98091`, :cve_nist:`2026-98092`, :=
cve_nist:`2026-98093`, :cve_nist:`2026-98094`, :cve_nist:`2026-98095`, :cve=
_nist:`2026-98096`, :cve_nist:`2026-98097`, :cve_nist:`2026-98098`, :cve_ni=
st:`2026-98099`, :cve_nist:`2026-98101`, :cve_nist:`2026-98102`, :cve_nist:=
`2026-98103`, :cve_nist:`2026-98104`, :cve_nist:`2026-98105`, :cve_nist:`20=
26-98106`, :cve_nist:`2026-98107`, :cve_nist:`2026-98108`, :cve_nist:`2026-=
98109`, :cve_nist:`2026-98110`, :cve_nist:`2026-98111`, :cve_nist:`2026-981=
13`, :cve_nist:`2026-98114`, :cve_nist:`2026-98116`, :cve_nist:`2026-98117`=
, :cve_nist:`2026-98118`, :cve_nist:`2026-98119`, :cve_nist:`2026-98120`, :=
cve_nist:`2026-98121`, :cve_nist:`2026-98122`, :cve_nist:`2026-98123`, :cve=
_nist:`2026-98124`, :cve_nist:`2026-98126`, :cve_nist:`2026-98127`, :cve_ni=
st:`2026-98128`, :cve_nist:`2026-98129`, :cve_nist:`2026-98130`, :cve_nist:=
`2026-98131`, :cve_nist:`2026-98134`, :cve_nist:`2026-98142`, :cve_nist:`20=
26-98146`, :cve_nist:`2026-98147`, :cve_nist:`2026-98148`, :cve_nist:`2026-=
98151`, :cve_nist:`2026-98152`, :cve_nist:`2026-98153`, :cve_nist:`2026-981=
54`, :cve_nist:`2026-98155`, :cve_nist:`2026-98156`, :cve_nist:`2026-98157`=
, :cve_nist:`2026-98158`, :cve_nist:`2026-98159`, :cve_nist:`2026-100072`
+   * - ``nfs-utils``
+     - :cve_nist:`2025-12801`
    * - ``openssh``
-     - :cve_nist:`2026-73281`, :cve_nist:`2026-73282`, :cve_nist:`2026-732=
83`
+     - :cve_nist:`2026-55654`, :cve_nist:`2026-55655`, :cve_nist:`2026-732=
81`, :cve_nist:`2026-73282`, :cve_nist:`2026-73283`
+   * - ``openssl``
+     - :cve_nist:`2015-3216`, :cve_nist:`2026-35189`, :cve_nist:`2026-3519=
1`, :cve_nist:`2026-42772`, :cve_nist:`2026-54872`, :cve_nist:`2026-54873`,=
 :cve_nist:`2026-54875`, :cve_nist:`2026-72897`, :cve_nist:`2026-75804`, :c=
ve_nist:`2026-75805`, :cve_nist:`2026-75806`, :cve_nist:`2026-77696`, :cve_=
nist:`2026-84782`, :cve_nist:`2026-84784`
+   * - ``ovmf``
+     - :cve_nist:`2017-5731`, :cve_nist:`2019-14584`
    * - ``perl``
-     - :cve_nist:`2026-15534`
+     - :cve_nist:`2026-15534`, :cve_nist:`2026-82560`
    * - ``popt``
      - :cve_nist:`2026-18739`, :cve_nist:`2026-18743`, :cve_nist:`2026-188=
39`
+   * - ``ppp``
+     - :cve_nist:`2020-15704`
+   * - ``pulseaudio``
+     - :cve_nist:`2020-15710`, :cve_nist:`2020-16123`
    * - ``python3``
-     - :cve_nist:`2025-15367`, :cve_nist:`2026-15310`, :cve_nist:`2026-158=
06`, :cve_nist:`2026-17084`, :cve_nist:`2026-19672`, :cve_nist:`2026-87910`
+     - :cve_nist:`2025-15367`, :cve_nist:`2026-12345`, :cve_nist:`2026-153=
10`, :cve_nist:`2026-15806`, :cve_nist:`2026-17084`, :cve_nist:`2026-19445`=
, :cve_nist:`2026-19553`, :cve_nist:`2026-19672`, :cve_nist:`2026-87910`
    * - ``python3-cryptography``
-     - :cve_nist:`2026-69247`, :cve_nist:`2026-69248`, :cve_nist:`2026-692=
49`
+     - :cve_nist:`2026-69247`
    * - ``python3-git``
-     - :cve_nist:`2026-67322`, :cve_nist:`2026-67323`, :cve_nist:`2026-673=
24`, :cve_nist:`2026-67325`, :cve_nist:`2026-67326`, :cve_nist:`2026-69097`=
, :cve_nist:`2026-73619`, :cve_nist:`2026-73620`, :cve_nist:`2026-73621`, :=
cve_nist:`2026-73622`, :cve_nist:`2026-73623`, :cve_nist:`2026-73624`, :cve=
_nist:`2026-73625`, :cve_nist:`2026-76217`, :cve_nist:`2026-76218`, :cve_ni=
st:`2026-76219`, :cve_nist:`2026-76220`, :cve_nist:`2026-76221`, :cve_nist:=
`2026-76222`, :cve_nist:`2026-78675`, :cve_nist:`2026-78676`, :cve_nist:`20=
26-78677`, :cve_nist:`2026-78678`, :cve_nist:`2026-78679`, :cve_nist:`2026-=
87817`, :cve_nist:`2026-87818`, :cve_nist:`2026-87819`
+     - :cve_nist:`2026-67322`, :cve_nist:`2026-67323`, :cve_nist:`2026-673=
24`, :cve_nist:`2026-67325`, :cve_nist:`2026-67326`, :cve_nist:`2026-69097`=
, :cve_nist:`2026-73619`, :cve_nist:`2026-73620`, :cve_nist:`2026-73621`, :=
cve_nist:`2026-73622`, :cve_nist:`2026-73623`, :cve_nist:`2026-73624`, :cve=
_nist:`2026-73625`, :cve_nist:`2026-76217`, :cve_nist:`2026-76218`, :cve_ni=
st:`2026-76219`, :cve_nist:`2026-76220`, :cve_nist:`2026-76221`, :cve_nist:=
`2026-76222`, :cve_nist:`2026-78675`, :cve_nist:`2026-78676`, :cve_nist:`20=
26-78677`, :cve_nist:`2026-78678`, :cve_nist:`2026-78679`, :cve_nist:`2026-=
87817`, :cve_nist:`2026-87818`, :cve_nist:`2026-87819`, :cve_nist:`2026-100=
689`
    * - ``python3-lxml``
      - :cve_nist:`2026-49825`
-   * - ``python3-pip``
-     - :cve_nist:`2018-20225`
-   * - ``python3-ply``
-     - :cve_nist:`2025-56005`
+   * - ``python3-mako``
+     - :cve_nist:`2026-102991`
    * - ``python3-urllib3``
-     - :cve_nist:`2026-44432`
+     - :cve_nist:`2026-44432`, :cve_nist:`2026-97687`, :cve_nist:`2026-976=
88`, :cve_nist:`2026-97689`
    * - ``qemu``
-     - :cve_nist:`2026-3195`, :cve_nist:`2026-3196`, :cve_nist:`2026-3842`=
, :cve_nist:`2026-48914`
+     - :cve_nist:`2026-3195`, :cve_nist:`2026-3196`, :cve_nist:`2026-3842`
    * - ``qemu-system-native``
-     - :cve_nist:`2026-3195`, :cve_nist:`2026-3196`, :cve_nist:`2026-3842`=
, :cve_nist:`2026-48914`
+     - :cve_nist:`2026-3195`, :cve_nist:`2026-3196`, :cve_nist:`2026-3842`
    * - ``rpm-sequoia``
      - :cve_nist:`2026-2625`
    * - ``rsync``
@@ -895,12 +903,14 @@ The following CVEs have been fixed:
      - :cve_nist:`2026-82474`
    * - ``tar``
      - :cve_nist:`2026-18477`, :cve_nist:`2026-18508`
+   * - ``u-boot-tools``
+     - :cve_nist:`2026-71971`, :cve_nist:`2026-71972`, :cve_nist:`2026-719=
73`, :cve_nist:`2026-71974`, :cve_nist:`2026-74220`, :cve_nist:`2026-74221`=
, :cve_nist:`2026-74222`, :cve_nist:`2026-74225`
    * - ``util-linux``
      - :cve_nist:`2026-76642`
    * - ``util-linux-libuuid``
      - :cve_nist:`2026-76642`
    * - ``vim``
-     - :cve_nist:`2024-43802`, :cve_nist:`2026-51400`, :cve_nist:`2026-514=
01`, :cve_nist:`2026-73070`, :cve_nist:`2026-73071`, :cve_nist:`2026-73075`
+     - :cve_nist:`2026-51400`, :cve_nist:`2026-51401`, :cve_nist:`2026-730=
70`
    * - ``webkitgtk``
      - :cve_nist:`2026-78376`, :cve_nist:`2026-83596`
    * - ``xserver-xorg``
--=20
2.55.0


