Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E68C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 19:52:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.33967.1641239552472297289
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 11:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fcfc5pOz;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d9so71894498wrb.0
        for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 11:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mpEl66dGBDUc5LrZuTfMasyFyIw+Yb4lsoJmt3Zc1eM=;
        b=Fcfc5pOzuEZUwWgtGrfs8IJRHIHzOJNM365KSX4VNuDUL2/0L1XLDrXjOGxAOHYLo0
         MRzulmAHssFoqc9zwNc0nVBPowec2QY2sUVeBYC4dC3pwIZCT/TjrGFwvlR7xubY7coM
         UE9J3K0tCEUSVSuPo/6QcsAcZ1JLFMeNxXE6opRSpzl87EfgPvShsNG8ZQIpYpEZmWnS
         oZcTTB9rQqEwGrpexMkxTkDJprNxU73azJDPT9mDfFVrOL2KYnf3DFJqvp2lNXJU349z
         f6+6IBuUGlAV32G2JmxMEKaSMueztwHLR31Yqpmt6imBftl3UtM4GhIo6EzHL1WRnjzA
         0ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mpEl66dGBDUc5LrZuTfMasyFyIw+Yb4lsoJmt3Zc1eM=;
        b=r6PTbKtRe6CVY6oVdr/9k/ZSn1STPjueSgXkGEanJgWUoo8xIfRuUTcRzP51yCT+Td
         ye7cIJfjUeRmyARrYAwB6b8GlpxXpE3fhA5cnXoPW2kBvNQ2qp1s1ekU9ZMBFUOqlC6D
         V9IvcpKob0ph176Pxdf4AtIQSWJjrwAQTwOTNh6Oyoz2bbabxrlskxWVMb40przXgEzA
         TScNP3hrMFjgUcZfqmbVVbQxa9c3X1m1sghw3oREz5Z0J8YmkwTbJsr0a/ijfdvzCgPH
         wBFg/OclU9agIm9nVol4JnvoVB+nTR9X1cd08TXRDrlgF+n8OLRHW/7MctzWsGeXlDkQ
         nHyg==
X-Gm-Message-State: AOAM5331ZRnbCovYHId6zOApyH3y3Czy75GHtBYh8aF/Ux9L+lOuMz6P
	2ysl0h49bj3/CImtF0svnTEHL48IQ0I=
X-Google-Smtp-Source: 
 ABdhPJzTOIVPr0UBUtq1Sqjt6skOxjF8Zw5f8B7EFMco+DbaOyP8mllKrucLEV/JCXPvau0t4j+V9Q==
X-Received: by 2002:a5d:59af:: with SMTP id
 p15mr39454939wrr.237.1641239550646;
        Mon, 03 Jan 2022 11:52:30 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 14sm38860530wry.23.2022.01.03.11.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:52:30 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: docs@lists.yoctoproject.org
Cc: quentin.schulz@theobroma-systems.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH v2] ref-manual: fix patch documentation
Date: Mon,  3 Jan 2022 20:50:50 +0100
Message-Id: <20220103195050.466-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 19:52:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2339

The do_patch implementation does not apply patches from an entry in
SRC_URI pointing to a directory.
Remove the claim that this is implemented.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 documentation/ref-manual/tasks.rst | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

Changes v2:
- Reworked according to Quentin Schulz's feedback

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 8d563714a..d484d08f8 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -326,21 +326,19 @@ file as a patch file::
        file://file;apply=yes \
        "
 
-Conversely, if you have a directory full of patch files and you want to
-exclude some so that the ``do_patch`` task does not apply them during
-the patch phase, you can use the "apply=no" parameter with the
+Conversely, if you have a file whose file type is ``.patch`` or ``.diff``
+and you want to exclude it so that the ``do_patch`` task does not apply
+it during the patch phase, you can use the "apply=no" parameter with the
 :term:`SRC_URI` statement::
 
    SRC_URI = " \
        git://path_to_repo/some_package \
-       file://path_to_lots_of_patch_files \
-       file://path_to_lots_of_patch_files/patch_file5;apply=no \
+       file://file1.patch \
+       file://file2.patch;apply=no \
        "
 
-In the
-previous example, assuming all the files in the directory holding the
-patch files end with either ``.patch`` or ``.diff``, every file would be
-applied as a patch by default except for the ``patch_file5`` patch.
+In the previous example ``file1.patch`` would be applied as a patch by default
+while ``file2.patch`` would not be applied.
 
 You can find out more about the patching process in the
 ":ref:`overview-manual/concepts:patching`" section in
-- 
2.20.1


