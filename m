Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CCDCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 12:31:00 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.14890.1760445053608205817
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 05:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RSLLR6zp;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-46e52279279so37670555e9.3
        for <docs@lists.yoctoproject.org>; Tue, 14 Oct 2025 05:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760445052; x=1761049852; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSiV9Ok7xXT5Eoi9L0Jz06Zz6oZdhVkicxhwy2KzzNc=;
        b=RSLLR6zpzIJ34SWHt42qDZMxipseYhmurg2CCLgWUvup9ic66Z+vro2wQRr2bT7+gT
         chiRyuCtGr2GDlqT8BUQi05iI8iAMuDaanf+CcvGNN19kJeoQf1EASYP77vbmjXNaHkC
         wtAYUVnd2MxYiQRQmbCauwbP4NRMRPRy8q/v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445052; x=1761049852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSiV9Ok7xXT5Eoi9L0Jz06Zz6oZdhVkicxhwy2KzzNc=;
        b=Gk9md2zjIRVgXyZb5i7umkqKTgCxsxkD+6K3WvgG3Qp45XFKEsah211wT/1vyXPoYn
         CXicFiMYZ9w3cfEfQRiCVAKKy53sq5ykL5Uctr2wddxATDVVaaoa2+IF6VHqYmrrfH+P
         V1w5AAjG5VHZSbeXQ+jdA45iVpNGv5My7wbd9SPc6GlBbRFJ236RGs+yiG3sw2E7AGOq
         cnj8AF3qk/ZutUNBg5tnyhTFeUZYLQeFenvHbj7Vcl0GXjYkp5Fd0ylry+phEOS3ivkx
         e3T3fuVXEUHOqvunKn6dFVGRGguTM9cSE3sqKvDZcipJH4OWq+VR956qnmr7wjcnbqCk
         ClzQ==
X-Gm-Message-State: AOJu0YzekJmbI0Qx6o71gI2gJTTETGRaResdrLQuBxTCpkc3dHnZMJcF
	2mBFTdCmAlmB5dwuSPFado7kewhyMXrJWDc9JX8g0NlxR9N+bWCac8d8bTiVR24LFUuxP/jgFIo
	7sp48ChA=
X-Gm-Gg: ASbGncvzmYUvAEXJ/mxCnGs8JVwfON1UuKp0AYhStaQIG2u+oUIsZ5GhqBygDZgORLS
	ka5JltMKH53jWGJf+7XH2d8n4+8TDfboR7aGzJ0Rd4EbBvNCFWAlXkYAtvg/sKfcGTjbvaiyFKt
	Cxy3P7wxgTEoRPbQ/5tiFcuUyRd04sDUyMbMshYT8cJFYLabjTteCceMRiMRAdKP525tpiowrJ2
	oQZVPdbb8Vewor8S6if+7Tjg67wwXOfVijhXLdBGh2szBD7/WMfM6VPraV7J2T48GalkyOmqJEF
	4NQupcGSeQSPAMkyJ91qhPfRl7RPXcWKY4exmwnOSDPO/BW6au2xbQYnUMHgT1Jo2fRhV9MpBS6
	Uu7PO7+pARNpWAwpWYX/ECHkmdJKiKjOYrsp4WYhrcoecmYY1cuK6yyv1fjFtsJUGaTyq9B+p
X-Google-Smtp-Source: AGHT+IEU1u0wV5GAxxTw+nOYYaMuYynE2jxmoQ+ZmahH/rQvrJezoXFI2HXKxWgNYs6WfKSRdx+JYg==
X-Received: by 2002:a05:600c:1f93:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-46fa9a8ca9fmr177418175e9.7.1760445051892;
        Tue, 14 Oct 2025 05:30:51 -0700 (PDT)
Received: from localhost.localdomain ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3d92c0sm151934715e9.3.2025.10.14.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:30:51 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH] ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES
Date: Tue, 14 Oct 2025 14:30:19 +0200
Message-Id: <20251014123019.3321312-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Oct 2025 12:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7700

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 documentation/ref-manual/variables.rst | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 591c03028..cdcc8b877 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3956,6 +3956,45 @@ system and gives an overview of their function and contents.
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
+
+      You can also specify the target by label, UUID or partname if multiple
+      extra partitions coexist. Here are two examples::
+
+         IMAGE_EXTRA_PARTITION_FILES_label-config = "foo/*"
+         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "foo/*;bar/"
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


