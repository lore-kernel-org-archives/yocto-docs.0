Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B5AC4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 05:36:15 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.45810.1702186565250135296
 for <docs@lists.yoctoproject.org>;
 Sat, 09 Dec 2023 21:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=A09PYzyq;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 64D14240101
	for <docs@lists.yoctoproject.org>; Sun, 10 Dec 2023 06:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1702186563; bh=yEGBS6Vj+Lx+Cx7FBict02SGA1CE4CP7+YEIx5EbGQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=A09PYzyqosVAzSP+EFOgVNoTHm1astFdkhsPPG9lA0qRNXADFgEcE71tLlTJtAbVz
	 A/rVAvqoDwsYqsVFO/yW4H0bRM1nKE289QrEDDZJ1BEoYXrmDC2lsBp1Hgk1FSPTiC
	 Fu1AV7cyZLrfNbaG/tAkREAN2LPn8zWoG3+oxONgfn4fuSLzJiH8mPIqS8HGAscAH2
	 9fdGlwxUOkd4xHha/mHTyiR9XXCKJyhHlyKqGtrK3EGCiDRVi0yUpBwwHzDVxlIkyE
	 kEt57XMZxpbdoHkV6khyYAJIKnM6Ag5k/Es3duZp45pwsLYjo43KioESJammLE1lg+
	 tGOfagvjdDnLg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Sntrz0fL3z6tw3;
	Sun, 10 Dec 2023 06:36:03 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] docs: Align order in Quick Build with default local.conf
Date: Sun, 10 Dec 2023 05:35:55 +0000
Message-Id: <20231210053555.11779-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 10 Dec 2023 05:36:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4671

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Align the order from `BB_SIGNATURE_HANDLER` to `SSTATE_MIRRORS` in Quick =
Build
with the order in the default local conf. While trivial it is easier to f=
ind,
if the order matches.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation=
/brief-yoctoprojectqs/index.rst
index df8d75edc2..61c5cbec36 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -251,10 +251,10 @@ an entire Linux distribution, including the toolcha=
in, from source.
       To use such mirrors, uncomment the below lines in your ``conf/loca=
l.conf``
       file in the :term:`Build Directory`::
=20
-         BB_SIGNATURE_HANDLER =3D "OEEquivHash"
-         BB_HASHSERVE =3D "auto"
          BB_HASHSERVE_UPSTREAM =3D "hashserv.yocto.io:8687"
          SSTATE_MIRRORS ?=3D "file://.* http://cdn.jsdelivr.net/yocto/ss=
tate/all/PATH;downloadfilename=3DPATH"
+         BB_HASHSERVE =3D "auto"
+         BB_SIGNATURE_HANDLER =3D "OEEquivHash"
=20
 #. **Start the Build:** Continue with the following command to build an =
OS
    image for the target, which is ``core-image-sato`` in this example:
--=20
2.39.2


