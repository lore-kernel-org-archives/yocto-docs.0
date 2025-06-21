Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03894C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 07:14:52 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.2921.1750490084786242076
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Jun 2025 00:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtoqq25N;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747fc7506d4so2000055b3a.0
        for <docs@lists.yoctoproject.org>; Sat, 21 Jun 2025 00:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750490084; x=1751094884; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmcjULakiR/B7DqqVdgkga5UtIIyitT4uLzJwBY1xqk=;
        b=jtoqq25NnVE7QeKUuDT8ApKJtXfY9xCOI7e+aoo3gSV3/9VGI9DP6+4a9FgABCDI0q
         cOnpkrEgGy+COWIj/7lq1WjBMJb0Es+Z676YO7tgJDDQBZ8fLS6KoDI0UmINgM0UZNdd
         eU1zvM8n4t62XS974s4drhAz6nLOUMNpFQHZi9gi2REdhtwcB16saAjOihVFhJQKrWkJ
         Tb1KiM0AcBEvgNwuHsnoSyABDQY6hK1GkHiijyuBiEhLujDaT0j/y4xjzVY2Q5ezi4cs
         DzO9oIeuHZHYCUlUlQ07wZTihTvZ/B9RwNWUIl7k4U8Ftgei8NSeLaylighVex+4a2M3
         El7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750490084; x=1751094884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmcjULakiR/B7DqqVdgkga5UtIIyitT4uLzJwBY1xqk=;
        b=oaNmcApUYau1AjmX5we12kUBMKzSkKGBuwdYv8l6txBENb9DQhN2VTDd2wGfRd29Kb
         31PIaUPEgDNktGw/aKok8KWOynZrqPkKWljk21lELN428PCSteUC2nXDum6AFXGWqy3j
         uo3dsDuMnuehCK6ks7QyTks8cujU/nAUBiIXuibMNlBf0+5+F9pmE3P0bFIUq2E0LAWn
         7gkaIEgShz+g4QVV+ZsawrgDbenZvqniW2w2Ee636aDbys7GnagnAFsDtZa2CeGkHrdc
         786yVNOhn8BnDbjD4f+rc+Kec4bk42lboEIHdeochPbkOzNj9PGpzW0rzmXgJ6WdnJgH
         acuQ==
X-Gm-Message-State: AOJu0YzV00EKA5hGmaCAxumBjPnmAMrydUY4EqP0b4K6IhFXWDSIL3mM
	wNBYG0M9Nl+RTPPd53YQ1nKLX4tR+ri1uhEeLC9Ae5ToBWmBnnxYsQ+RWBjiMA==
X-Gm-Gg: ASbGncvrRzqjUnqsYwoDeV/KMypOkaQ+ovx4wfqf3lcBH0R+HZ8gkgQVN5ec1dunxpC
	TqeZCp/QHntUZVglJ5zmPqUKU5jIs+MmmXRdpJkikmpE/EATz3Cp4faue/1/SmEC/qcUek5aqIx
	42v/8yL6qo+FPcUwfPucMeFuGj5BcPg2TsVrprXS8GOeLo4Fkr8XKqTn7wUdYWUhJDRkz1o/w1K
	SkjqRfRJx6KhPZssNSr+Q4KOgQxDkS1U1ktKbl3q6GznZl/LAz8V1bypMSyzMBYq8EMVW/PyR+x
	755Z2OUqqSlIzyCgtcohd8mjnU3CCoWT1yDZXsqdNLE+nwAe6mCMQJO+K7NKmREOIQ==
X-Google-Smtp-Source: AGHT+IE9nYd7RIy/Sggv8RoTX1PTOFoISW+8c6Pw5hIP2TQ5u9L2jWJdQSUXWPKI15Rj4LZ8nzCYog==
X-Received: by 2002:a05:6a20:ce4f:b0:1f5:a3e8:64c1 with SMTP id adf61e73a8af0-22025ea3dedmr8771075637.0.1750490083795;
        Sat, 21 Jun 2025 00:14:43 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:93d9:15ef:f694:5c2a:2c89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1241f07sm3176025a12.37.2025.06.21.00.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:14:43 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH v3] ref-manual: document KERNEL_SPLIT_MODULES variable
Date: Sat, 21 Jun 2025 12:44:34 +0530
Message-ID: <20250621071434.46558-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 21 Jun 2025 07:14:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7129

This variable controls the kernel module spliting.

[YOCTO #15771]

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c6ae3fb8b..0bbd08eac 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5350,6 +5350,27 @@ system and gives an overview of their function and contents.
       the :term:`KERNEL_PATH` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
+   :term:`KERNEL_SPLIT_MODULES`
+      When inheriting the :ref:`ref-classes-kernel-module-split` class, this
+      variable controls whether kernel modules are split into separate packages
+      or bundled into a single package.
+
+      For some use cases, a monolithic kernel module package
+      :term:`KERNEL_PACKAGE_NAME` that contains all modules built from the
+      kernel sources may be preferred to speed up the installation.
+
+      By default, this variable is set to ``1``, resulting in one package per
+      module. Setting it to any other value will generate a single monolithic
+      package containing all kernel modules.
+
+      .. note::
+
+         If :term:`KERNEL_SPLIT_MODULES` is set to 0, it is still possible to
+         install all kernel modules at once by adding ``kernel-modules`` (assuming
+         `KERNEL_PACKAGE_NAME` = `kernel-modules`) to :term:`IMAGE_INSTALL`.
+         The way it works is that a placeholder "kernel-modules" package will be
+         created and will depend on every other individual kernel module packages.
+
    :term:`KERNEL_SRC`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
-- 
2.43.0


