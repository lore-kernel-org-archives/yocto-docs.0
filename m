Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C871C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:26 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1299.1682133620481210822
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id C2406E7570;
	Fri, 21 Apr 2023 23:20:19 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id EF00DE7770;
	Fri, 21 Apr 2023 23:20:18 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 16/17] release-notes-4.1: fix some CVE links
Date: Sat, 22 Apr 2023 15:19:52 +1200
Message-Id: <5f74d6cf96e430cc3082af2430d3e6a975e348bf.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3867

The "(ignored)" suffixes were included in the link value which broke the
link.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/migration-guides/release-notes-4.1.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.1.rst b/docum=
entation/migration-guides/release-notes-4.1.rst
index cd48e202abe..a0d5196128a 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -238,20 +238,20 @@ Security Fixes in 4.1
 - grub2: :cve:`2021-3695`, :cve:`2021-3696`, :cve:`2021-3697`, :cve:`202=
2-28733`, :cve:`2022-28734`, :cve:`2022-28735`
 - inetutils: :cve:`2022-39028`
 - libtirpc: :cve:`2021-46828`
-- libxml2: :cve:`2016-3709 (ignored)`
-- libxslt: :cve:`2022-29824 (not applicable)`
+- libxml2: :cve:`2016-3709` (ignored)
+- libxslt: :cve:`2022-29824` (not applicable)
 - linux-yocto/5.15: :cve:`2022-28796`
 - logrotate: :cve:`2022-1348`
 - lua: :cve:`2022-33099`
-- nasm: :cve:`2020-18974 (ignored)`
+- nasm: :cve:`2020-18974` (ignored)
 - ncurses: :cve:`2022-29458`
 - openssl: :cve:`2022-1292`, :cve:`2022-1343`, :cve:`2022-1434`, :cve:`2=
022-1473`, :cve:`2022-2068`, :cve:`2022-2274`, :cve:`2022-2097`
-- python3: :cve:`2015-20107 (ignored)`
-- qemu: :cve:`2021-20255 (ignored)`, :cve:`2019-12067 (ignored)`, :cve:`=
2021-3507`, :cve:`2022-0216`, :cve:`2022-2962`, :cve:`2022-35414`
+- python3: :cve:`2015-20107` (ignored)
+- qemu: :cve:`2021-20255` (ignored), :cve:`2019-12067` (ignored), :cve:`=
2021-3507`, :cve:`2022-0216`, :cve:`2022-2962`, :cve:`2022-35414`
 - rpm: :cve:`2021-35937`, :cve:`2021-35938`, :cve:`2021-35939`
 - rsync: :cve:`2022-29154`
 - subversion: :cve:`2021-28544`, :cve:`2022-24070`
-- tiff: :cve:`2022-1210 (not applicable)`, :cve:`2022-1622`, :cve:`2022-=
1623 (invalid)`, :cve:`2022-2056`, :cve:`2022-2057`, :cve:`2022-2058`, :c=
ve:`2022-2953`, :cve:`2022-34526`
+- tiff: :cve:`2022-1210` (not applicable), :cve:`2022-1622`, :cve:`2022-=
1623` (invalid), :cve:`2022-2056`, :cve:`2022-2057`, :cve:`2022-2058`, :c=
ve:`2022-2953`, :cve:`2022-34526`
 - unzip: :cve:`2022-0529`, :cve:`2022-0530`
 - vim: :cve:`2022-1381`, :cve:`2022-1420`, :cve:`2022-1621`, :cve:`2022-=
1629`, :cve:`2022-1674`, :cve:`2022-1733`, :cve:`2022-1735`, :cve:`2022-1=
769`, :cve:`2022-1771`, :cve:`2022-1785`, :cve:`2022-1796`, :cve:`2022-19=
27`, :cve:`2022-1942`, :cve:`2022-2257`, :cve:`2022-2264`, :cve:`2022-228=
4`, :cve:`2022-2285`, :cve:`2022-2286`, :cve:`2022-2287`, :cve:`2022-2816=
`, :cve:`2022-2817`, :cve:`2022-2819`, :cve:`2022-2845`, :cve:`2022-2849`=
, :cve:`2022-2862`, :cve:`2022-2874`, :cve:`2022-2889`, :cve:`2022-2980`,=
 :cve:`2022-2946`, :cve:`2022-2982`, :cve:`2022-3099`, :cve:`2022-3134`, =
:cve:`2022-3234`, :cve:`2022-3278`
 - zlib: :cve:`2022-37434`
--=20
2.34.1


