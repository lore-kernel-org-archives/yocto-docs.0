Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E391BCCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:34:30 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.3318.1760603663522855483
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xRNTl0IJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so391009f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760603662; x=1761208462; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4Cs1Z8MCkYC/oBd14naatQA0ArN/6lPLL+COmGcHXU=;
        b=xRNTl0IJCi/FBMEgDuzFV3KUe+RwYu0LNDAcsA3oI/gNo7pxl2lAsLjO+MURyUriJf
         f7Jn0DgwBu1GdFd3Icmpk8mmOy2glCNWiIsX9efVHM5gVI8UwMQO6m4UjSoucNIum2W+
         B18ZlwHOa+/BEtLUGa1ZHE+RkBQ4vMP0cDZDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603662; x=1761208462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4Cs1Z8MCkYC/oBd14naatQA0ArN/6lPLL+COmGcHXU=;
        b=RMqAzsHDrCskA8WkemMXlqjSqnQzqesz/An6dlC+B9M2LDOA2a3TedeQ0sI1qFCTdJ
         Ev3Zj3UOTRSC3FF4uD4269N7IZnCzMzvr5AwHCecV1JrBwyxkCrP/x3fkJK+dnW1lI/w
         /Hr6R/uvxoHeqMX2T7S8p4GGasiFX5/bDBrsHGj11VecFVjvBP3VfojcmT71g7v4TTxZ
         z7SOO232LfQWLw9iV+VzJpSXmj25bMKH9bPbHL1a+jylFTT+kbCI3j4L17FKYLRyeQG7
         scE07HgWVP2xkRGh8sUOqNPwwgm4mR98x2Wu5PsoaJDRN/aKBjelt5RoemfXhwVJRhXJ
         CKcA==
X-Gm-Message-State: AOJu0Yymy1rYD/eRFH4O/RfUgX9xlSTekMqjMp2o43LKZOlNBFPuLaGI
	FE2O/6+7JVwrw0UVqBW+ZrLhHUZRrYmvEgkPWEYHmN0vbFLhDx0V4Q0KWJxcFSRxkbz7B0E11U5
	nKGS2k4U=
X-Gm-Gg: ASbGncu6VqaCO1nMYqlNmFImOXj/QiX2d1fr5ZgQyX6wMEiGkaf9si+XpCUMenQEdf1
	6+oLtE9ocZp+/1nPJzAwR/q5PziTQUwTv2VFjwcIaQuI3eDe5YDgw1i8LEcxgErQ+HDuI6rZ3KT
	ARmk9yj7vc2YD+ghsxqWN78UhQRpZrfqdy4Q76WBX8MhM2oLFaRzVO2JmjbEPLWNdDw0w9cu+cT
	5PyAXN+LqE44DFHVkBFjMmWweAmM+GdnjDSU/ARx0VI5wvk80C4BIXa+IQ6SV1GvUhhDlWLIg7Y
	KLJUD9aJ3l2Ab7TOw8Dj3xvstpNDpggHClw6cLixj1ftURbBP/6b9XYt7Hb+j2JqOrFGT/UFdfX
	2gXEUU5ezNLW7FkMnWbFpdYUiL4Hu9yE+3yF+T7hDpi56ELKGo1CIjbF7FhmBh+Q+snSBV59ayv
	srshyHzBgOtzEyqCNyudAgblB6u8NCheI=
X-Google-Smtp-Source: AGHT+IHIo8BjjysL18rhC2m/oyTS7w2FzW4vSuVwLoKu9VEP+GGn8mXKYh0xDJ0SFlZ9JZbs3Cu2zQ==
X-Received: by 2002:a5d:64c4:0:b0:425:75ce:9f5f with SMTP id ffacd0b85a97d-4266e8de573mr18172130f8f.48.1760603661824;
        Thu, 16 Oct 2025 01:34:21 -0700 (PDT)
Received: from localhost.localdomain ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0efasm33234674f8f.41.2025.10.16.01.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:34:21 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2] ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES
Date: Thu, 16 Oct 2025 10:34:17 +0200
Message-Id: <20251016083417.1286684-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:34:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7709

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Cc: Antonin Godard <antonin.godard@bootlin.com>
---
changes in v2:
- apply suggested changes
---
 documentation/ref-manual/variables.rst | 50 ++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 591c03028..72791f8f3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3956,6 +3956,56 @@ system and gives an overview of their function and contents.
       material for Wic is located in the
       ":doc:`/ref-manual/kickstart`" chapter.
 
+   :term:`IMAGE_EXTRA_PARTITION_FILES`
+      A space-separated list of files installed into the extra partition
+      when preparing an image using the Wic tool with the
+      ``extra_partition`` source plugin. By default,
+      the files are
+      installed under the same name as the source files. To change the
+      installed name, separate it from the original name with a semi-colon
+      (;). Source files need to be located in
+      :term:`DEPLOY_DIR_IMAGE`. Here is a
+      example::
+
+         IMAGE_EXTRA_PARTITION_FILES = "foo bar.conf;bar"
+
+      In the above example, the file ``foo`` is installed with its original name
+      ``foo``, while the file ``bar.conf`` is installed and renamed to ``bar``.
+
+      Alternatively, source files can be picked up using a glob pattern. In
+      this case, the destination file must have the same name as the base
+      name of the source file path. To install files into a directory
+      within the target location, pass its name after a semi-colon (;).
+      Here are two examples::
+
+         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
+         IMAGE_EXTRA_PARTITION_FILES = "foo/*;bar/"
+
+      The first example
+      installs all files from ``${DEPLOY_DIR_IMAGE}/foo``
+      into the root of the target partition. The second example installs
+      the same files into a ``bar`` directory within the target partition.
+      The ``bar/`` directory is automatically created if it does not exist.
+
+      You can also specify the target by label, UUID or partname if multiple
+      extra partitions coexist. Here are some examples::
+
+         IMAGE_EXTRA_PARTITION_FILES_label-config = "foo/*"
+         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "foo/*;bar/"
+         IMAGE_EXTRA_PARTITION_FILES_part-name-foo = "foo"
+
+      Here are the simplified corresponding entries in the WKS file::
+         
+         part --source extra_partition --fstype=ext4 --label config
+         part --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d
+         part --source extra_partition --fstype=ext4 --part-name foo
+
+      You can find information on how to use the Wic tool in the
+      ":ref:`dev-manual/wic:creating partitioned images using wic`"
+      section of the Yocto Project Development Tasks Manual. Reference
+      material for Wic is located in the
+      ":doc:`/ref-manual/kickstart`" chapter.
+
    :term:`IMAGE_FEATURES`
       The primary list of features to include in an image. Typically, you
       configure this variable in an image recipe. Although you can use this
-- 
2.34.1


