Return-Path: <matthias@pritschet.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF78C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 16:26:55 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
 by mx.groups.io with SMTP id smtpd.web11.1096.1721060808964613122
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 09:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0002 header.b=FzX8f3go;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0003 header.b=5LpzjpRn;
 spf=none, err=permanent DNS error (domain: pritschet.eu, ip: 81.169.146.221, mailfrom: matthias@pritschet.eu)
ARC-Seal: i=1; a=rsa-sha256; t=1721060805; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LF0Ese8zY9wWPu+N66YbTf9nk2pQbIUTAJxXCqFDpLCBqXXdXGr6D+bYEjlJ/wL76c
    D7RLzKNJBn772P/777AtD/4Ck5EZGpgNXHfBd6td8mrnUTiiNOz3b+sDgU0oCT8s16R6
    sC/vlOUgb8FZig/Imy9FILKGKogEr2LB6+4vH5aeWPkflgpwdRZrn5FZ7GMtHQeAzWDP
    /BczN08+f3OnABxlteGma4X4IfuUQnjcGQjN+pqrZsC9fSsfsscD5gW52C9Bdky5e8CK
    gyc/LlhBUNVLg3g0Z9nWACAIRBWwE7SmX9DOoMIQbIJP+x1J8N0A6e24DYHjButvwdhm
    lraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1721060805;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=X+qCj2SEMhwKpMX16JexSAWWoXUEyKQWJSb5G2aJi5o=;
    b=JhDbYzZLo/Nuiu6xRHFMzk4o8HvcGEPfticXIwUt3mwknmxDinJWs+RHl2WuQL11Hi
    f1M8FyW38jgdHcuGimhAohOdXx7L6RkKbjj6DZR9gVXY5t6Dhrhg/uf2cA0ksb1Efr57
    wDzL1GQWPLDjgI1uqIwBamG2m/2GbxfEaYmMzJWQlBqN/nJ/A8Q8rCR2MWqyhkJLqLpq
    D1Be+5FVrchm5pgm6CAZTxx8YuQihj3UgD0/bfgzwLNVcl4FGxMXi1hZLPpiSilVDfUY
    1uQntrFox+xDdBQhSgSgx4KJq5cUqUYIf2sOv8trcqBnHFXMD7Wix0O4uOqDmzI0Ir7Q
    Wi/Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1721060805;
    s=strato-dkim-0002; d=pritschet.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=X+qCj2SEMhwKpMX16JexSAWWoXUEyKQWJSb5G2aJi5o=;
    b=FzX8f3goyGjc8bfPgbrMmgX5sJFc+8J8Jl4conZ8qz6Nd/0XQRH9D9oxxGuGDv0c0V
    61oz/7NYkiNsvRvSz+p2fJt82uhw23ySyraYAIsy2P8A6oAwi+iTzHkMO5uJy/Eobvfs
    fgQSO4z5G1ive8DNV1VfsLvupU0MCm5MjAwi9DI8HXcamf0OpiwIHpHW3RZ+aaH1M8Pu
    r4YIL7HC7qGnvpHjtLAqVPwv6oPpRHq9eswpv4CEMEFNmB1OYRr+xb+6WAKflpErzLOs
    rI/nhFfA32jPPbAJaasVV/S6mnV8+9ElMBF3/A+xaOOGQsVyXzHVaYsMReOcq/thqE0U
    KyKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1721060805;
    s=strato-dkim-0003; d=pritschet.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=X+qCj2SEMhwKpMX16JexSAWWoXUEyKQWJSb5G2aJi5o=;
    b=5LpzjpRnfCtr43B9p30DBLBCOmc13/pBExQOCos80CZZWCvKnGtJQa28acBiiiQYHM
    55k7vjpifc2SHWBWRKDQ==
X-RZG-AUTH: ":IW0QYUiheuxX18P29qqHt/qCfjagLCCd1qyzKexpZQ1pd0swCVIOltsc1MIZTqzgk3mlAcYT1Xi0ab4xFi0jWdfYEkrjDqDC+ZGTd49TM4Ps6w=="
Received: from nibbler.fritz.box
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id Yd513e06FGQjBoY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 15 Jul 2024 18:26:45 +0200 (CEST)
From: Matthias Pritschet <matthias@pritschet.eu>
To: docs@lists.yoctoproject.org
Cc: quentin.schulz@cherry.de,
	Matthias Pritschet <matthias@pritschet.eu>
Subject: [PATCH v2] ref-manual: fix typo and move SYSROOT_DIRS example
Date: Mon, 15 Jul 2024 18:23:48 +0200
Message-Id: <20240715162348.3984456-1-matthias@pritschet.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jul 2024 16:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5315

1. Changed one letter (s/B/A), so the sentence is correct again.
2. Moved example from SYSROOT_DIRS_IGNORE into SYSROOT_DIRS section.

Signed-off-by: Matthias Pritschet <matthias@pritschet.eu>
---
 documentation/ref-manual/variables.rst | 48 +++++++++++++-------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 848cea787..f0c8e4f84 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8584,29 +8584,6 @@ system and gives an overview of their function and contents.
              /sysroot-only \
              "
 
-   :term:`SYSROOT_DIRS_IGNORE`
-      Directories that are not staged into the sysroot by the
-      :ref:`ref-tasks-populate_sysroot` task. You
-      can use this variable to exclude certain subdirectories of
-      directories listed in :term:`SYSROOT_DIRS` from
-      staging. By default, the following directories are not staged::
-
-         SYSROOT_DIRS_IGNORE = " \
-             ${mandir} \
-             ${docdir} \
-             ${infodir} \
-             ${datadir}/X11/locale \
-             ${datadir}/applications \
-             ${datadir}/bash-completion \
-             ${datadir}/fonts \
-             ${datadir}/gtk-doc/html \
-             ${datadir}/installed-tests \
-             ${datadir}/locale \
-             ${datadir}/pixmaps \
-             ${datadir}/terminfo \
-             ${libdir}/${BPN}/ptest \
-             "
-
       Consider the following example in which you need to manipulate this variable.
       Assume you have a recipe ``A`` that provides a shared library ``.so.*`` that is
       installed into a custom folder other than "``${libdir}``"
@@ -8618,7 +8595,7 @@ system and gives an overview of their function and contents.
          is just to show the usefulness of setting :term:`SYSROOT_DIRS`.
 
       When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is in
-      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
+      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``A``
       into ``B``'s :term:`SYSROOT_DESTDIR` that is "``${WORKDIR}/sysroot-destdir``".
 
       Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS`, it will never be copied to
@@ -8636,6 +8613,29 @@ system and gives an overview of their function and contents.
 
             TARGET_LDFLAGS:append = " -L${RECIPE_SYSROOT}/opt/lib"
 
+   :term:`SYSROOT_DIRS_IGNORE`
+      Directories that are not staged into the sysroot by the
+      :ref:`ref-tasks-populate_sysroot` task. You
+      can use this variable to exclude certain subdirectories of
+      directories listed in :term:`SYSROOT_DIRS` from
+      staging. By default, the following directories are not staged::
+
+         SYSROOT_DIRS_IGNORE = " \
+             ${mandir} \
+             ${docdir} \
+             ${infodir} \
+             ${datadir}/X11/locale \
+             ${datadir}/applications \
+             ${datadir}/bash-completion \
+             ${datadir}/fonts \
+             ${datadir}/gtk-doc/html \
+             ${datadir}/installed-tests \
+             ${datadir}/locale \
+             ${datadir}/pixmaps \
+             ${datadir}/terminfo \
+             ${libdir}/${BPN}/ptest \
+             "
+
    :term:`SYSROOT_DIRS_NATIVE`
       Extra directories staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task for
-- 
2.34.1


