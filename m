Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C709FC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 12:46:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.37606.1640695592452122057
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Dec 2021 04:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DwbyLFn3;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id e5so38164450wrc.5
        for <docs@lists.yoctoproject.org>;
 Tue, 28 Dec 2021 04:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mOMSrhWISGr17iiOhVd8PAj1nMqkPThQSILIN438/M=;
        b=DwbyLFn3RG9G2EGHlgdKwLnpPYXge0BFUXoldxvN5sohXMq76Z5BucpgIPLF2RlsZP
         Cj8v7F5zF7eJ5NyYSI5u4C6fMQsM7NwhdPKVj9F65VFn1X2d4XXtA/l74wIQ1GBIQwmo
         kWhOvQW9HQjyn4LNhPMhf1k4FBB67EL6p/rGsaiGyVwQjiAbfEsvW8VMlZKJuVm1zedD
         2/JGyIkH0pYNmMnoUBSe+5c8l4k61cKmphRCw33fdj0RG5cMmvUaDxekk+p4nbhuUI7+
         RFDx6Kel2Hd6syWBbT8/wpOIqgBu4oP63N/H718c4MxqRXj7EPKE+m7Te3AxI+emZDKT
         FO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mOMSrhWISGr17iiOhVd8PAj1nMqkPThQSILIN438/M=;
        b=ALkyI4FPI+WnS/r4V9ruzMjlum3dH11dhH2ptp68VDBNQ+z1gITenHRbMGYHY1C7Ab
         m2qaOkXflvbfr8nP5JhXLqHy/insS6iB7aqUcw3DkWEisyzvAB9tt2KoTEt/lfusWgGg
         UEaIU33kg6m+QqZ0bmcuzcsbE+HkyJpYaUrkF1o4abCJ53LBonqrU8UPQ1ey2Dy+H6iD
         oXS7W4Dy0o+iss6JAU1cmOQ/yJvc6PBlydNGnP+PRj3Wy6YL3oagBExKuO6+SDmpRIdK
         pBVZE9lDSIy73SHZNBwuAXOvenZGDFl8bkqjcrDHiea7yaQrTH9nMQ13ZouemPvagRNu
         Xlbg==
X-Gm-Message-State: AOAM5308GtFcvX1OZXTNFaSLIZUGpLxmkVp7Y+xODD7UOHxVs8rQBoPE
	aDsWbwUbW6epbQS0jm49siXhen8HCsQ=
X-Google-Smtp-Source: 
 ABdhPJzhsvtGwSzEo5EdKXw5J1AGc8dp6Ym4dQyWyXoIBXKqzChnZONl+N4x7EGjdljjHfN1VhSU1g==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr16389550wrp.683.1640695590538;
        Tue, 28 Dec 2021 04:46:30 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id 1sm9943017wrb.13.2021.12.28.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 04:46:30 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: docs@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] ref-manual: fix patch documentation
Date: Tue, 28 Dec 2021 13:46:02 +0100
Message-Id: <20211228124602.3268-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Dec 2021 12:46:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2325

The do_patch implementation does not apply patches from an entry in
SRC_URI pointing to a directory.
Remove the claim that this is implemented.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 documentation/ref-manual/tasks.rst | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 8d563714a..76f55e1ff 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -326,21 +326,19 @@ file as a patch file::
        file://file;apply=yes \
        "
 
-Conversely, if you have a directory full of patch files and you want to
-exclude some so that the ``do_patch`` task does not apply them during
-the patch phase, you can use the "apply=no" parameter with the
+Conversely, if you have a file ``*.patch`` and ``*.diff`` and you want
+that the ``do_patch`` task does not apply it during the patch phase,
+you can use the "apply=no" parameter with the
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
+In the previous example file1.patch would be applied as a patch by default
+while file2.patch would not be applied.
 
 You can find out more about the patching process in the
 ":ref:`overview-manual/concepts:patching`" section in
-- 
2.20.1


