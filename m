Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A3ACD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:56:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.138633.1712674569916095320
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=WZSyfl67;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-343f1957ffcso2254557f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712674568; x=1713279368; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYtp7fqhDcJYv1Fqxf31oOmard5/DkNHoKVN/2oLJ2w=;
        b=WZSyfl67BKO0YIw2dj0fOKGyf9JB557a0xHzt5eiwMjVPzcObvEzRd4ccZ9XYA6aeL
         IBhjEe9cmVfplIGvxu9TWN0pHvRKzVKOchm+eUNdM8zN2RzDfKwQWtHOQTG6bV23Fvjl
         Qu0TB4vz3UjdhuhExBTE7US89brEdIjzzEVSXxFuy4SUxZ6xd0O+2efJ+sOL7cDckS62
         3I/jo9Gumux1jeGyPW3ZhdK+nmEcRXuXoV9S1MiH9vvEP8nUU+gwPhDfP2mFDViB4UQA
         Vqmx2svagdv6W803Ta9jefRch/wJcm3/KfXJdgOYCSgZyjwlcfms4xUOzG81wSz/DtF5
         w2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674568; x=1713279368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYtp7fqhDcJYv1Fqxf31oOmard5/DkNHoKVN/2oLJ2w=;
        b=AYIm4uhug/gmltunL86mO1G0hidBy0nwlaL5jNtKGRCXs7M3KDT9BzfXrod/ypzlPy
         lYBbTDwIjd9y6FFAjMtT7N+S6fZQdpEHnPLj9xJU6uT1Nq4ENpni8DpuQZxJxhOqbb2M
         ipixgBzxvzCyJC1+F2MeK4X+UwYn3r55y8W673ZrxJF0gQP1FZI4G7jhzuJja2vglPTj
         JXj/CLAxXhoJHzI9v6z+B0TtN2chgo/2fgSjDP9LPoo5GMJ17BwKb+SbZdAPjoWgBNQz
         8A/TfGylN8asUERl5rFreGLvvQW9P9BW5JOQdl+p8xhd61R5laaGTad4ycuTQg8r2WHm
         ByhQ==
X-Gm-Message-State: AOJu0YyCw5ZlWFYFwKmU49RIsaddnLV/L3xVIHAex3bB4yZd0vTRPnoc
	q+HEqGV+ds/yvGPgirEZ6lz0K8WlDzRPorNlIJE6WyZUFkctHFCgN5fTP2yN9fGX96B7ZBAvHj9
	D
X-Google-Smtp-Source: AGHT+IGYauRaY58Aygr2GsPq9YGWBWjbMpYANrJQIkcAz6AYB1VUF05P/7KGBR7cAkrx07L3J0fUIQ==
X-Received: by 2002:adf:ff83:0:b0:343:44cd:7d1e with SMTP id j3-20020adfff83000000b0034344cd7d1emr2597528wrr.17.1712674568220;
        Tue, 09 Apr 2024 07:56:08 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id r24-20020adfb1d8000000b00341b451a31asm11788693wra.36.2024.04.09.07.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:56:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] release-notes-5.0: Document some work
Date: Tue,  9 Apr 2024 16:55:44 +0200
Message-Id: <20240409145544.3115398-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240409145544.3115398-1-yoann.congal@smile.fr>
References: <20240409145544.3115398-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5094

This patch should cover those commits (from poky) :
* 789b10030c6 (cve-update-nvd2-native: remove rejected cve from database, 2024-03-15)
* 19f27037b2b (cve-update-nvd2-native: add an age threshold for incremental update, 2024-03-13)
* 6ce61b43570 (strace: disable bluetooth support by default, 2023-12-13)
* 381ef628fab (ref-manual: add documentation for the unimplemented-ptest qa warning, 2023-10-10)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../migration-guides/release-notes-5.0.rst      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 8df95ca21..441c5d7d6 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -10,6 +10,10 @@ New Features / Enhancements in 5.0
 
 -  New variables:
 
+   -  ``CVE_DB_INCR_UPDATE_AGE_THRES``: Configure the maximum age of the
+      internal CVE database for incremental update (instead of a full
+      redownload)
+
 -  Architecture-specific enhancements:
 
 -  Kernel-related enhancements:
@@ -44,6 +48,9 @@ New Features / Enhancements in 5.0
 
 -  Testing:
 
+   -  Add an optional ``unimplemented-ptest`` QA warning to detect upstream
+      packages with tests that does not use ptest.
+
 -  Utility script changes:
 
    -  New ``recipetool/create_go.py`` script added to support Go recipe creation
@@ -54,6 +61,11 @@ New Features / Enhancements in 5.0
 
 -  Security improvements:
 
+   -  Improve incremental CVE database download from NVD. Rejected CVEs are
+      removed, configuration is kept up-to-date. The age threshold for
+      incremental update can be configured with ``CVE_DB_INCR_UPDATE_AGE_THRES``
+      variable
+
 -  Prominent documentation updates:
 
 -  Miscellaneous changes:
@@ -64,10 +76,15 @@ New Features / Enhancements in 5.0
    -  ``systemd-boot`` can, from now on, be compiled as ``native``, thus
       providing ``ukify`` tool to build UKI images.
 
+   -  systemd: split bash completion for udevadm in a new udev-bash-completion
+      package.
+
    -  The :ref:`ref-classes-go-vendor` class was added to support offline builds
       (i.e., vendoring). It can also handle modules from the same repository,
       taking into account their versions.
 
+   -  Disable strace support of bluetooth by default.
+
 Known Issues in 5.0
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.39.2


