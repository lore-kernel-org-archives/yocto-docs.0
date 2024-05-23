Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B83C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:33:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.9950.1716449612402973544
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 00:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LrjLOlUr;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59a352bbd9so300107666b.1
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 00:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716449610; x=1717054410; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8+w02dJucNbP0Ce+8WYuEQvWonMU+PmXL/RRXTsezE=;
        b=LrjLOlUrd27c1T9jugRfUmG8Vt+li9h2xciMvNu8YzQJJypEdo8o+lSZWgvDRj9I1U
         2+mgqzbxN3e29tPfeFT1BmwBb/HXK5HMjrn27gM+Yt4w3i3izXlRDKYWakbX9TngyHsB
         g/ptLqTTIP++/Df7/ZqXfL9fqtY6pp8SNtG3V4Do7IZ97NC1ksy7cXDubjh5MopnqKwB
         caR5F0RlP/dhR7HzAikp6/jX9t14L/LfN52+Wr+SFCqVWiq/uadbbfwFtRFGBTDwyB5Q
         EX1dGlZ5VufIHJr/oIi7COIpjbxMRu/y3sXFIjXQgT5xy/S668g56lLasQyb0E1d3NVW
         8KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716449610; x=1717054410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8+w02dJucNbP0Ce+8WYuEQvWonMU+PmXL/RRXTsezE=;
        b=azwSsx6/2Mv1BrnwGeR3+ndHvpKA5FO+Wab2/Vjx1StdwmAF1CwOPOgfqm7zDIg4eY
         5D+q5bcHSEPbCnBP1g7y/enzE1ByT78HD7Y7oG7YKpBgbLHBL9RTzIGHSg8FWZU5X876
         91aj4BXBltnTQpWK970wcunw7ZUiSOZmbSjTHVDVNVtLnqDOvNOAAMVIH8jgRIQrnOtQ
         yEBUebO5N/fi/KC74eKx//HwKm6wT8KVaCF5zQVEipMGnr9umHUW0lgjBzDhfpSTh4NJ
         KRNjKaDsB0e+AXSY9E9pwoK+dpHyaAGAptWqvl3XgoxjlMf63IhJ874TCE8fiB3q5MGG
         EaQA==
X-Gm-Message-State: AOJu0YzlTtvfaWahdstyNuObU0TIFRGaAEAVaMV1B+PcOrsdAJQzVmf3
	R3wc/C15ATLcWcBmn1iD9XZZMGb21kppvWovYL2X8orJEi3GPov7Sn42Zw==
X-Google-Smtp-Source: AGHT+IHN/Wzap5/18c+WhaHO8k/ANCJ6f8lQ0YIuHcSnZLXQIs+sjEw4cE1wYj6jTIRNvUyvfbEbhQ==
X-Received: by 2002:a17:906:80d2:b0:a5d:3be:f101 with SMTP id a640c23a62f3a-a623e8f72abmr117942666b.18.1716449610092;
        Thu, 23 May 2024 00:33:30 -0700 (PDT)
Received: from goliat.wlan.se.axis.com ([85.235.16.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a90d0e919sm1163469166b.85.2024.05.23.00.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:33:29 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 1/2] image-bootfiles.bbclass: new class, copy boot files to /boot on rfs
Date: Thu, 23 May 2024 09:39:37 +0200
Message-ID: <20240523073938.2135-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 07:33:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5227

image-bootfiles class copy files listed IMAGE_BOOT_FILES
to the /boot directory of the root filesystem.

This is useful when there is no explicit boot partition but all boot
files should instead reside inside the root filesystem.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 meta/classes/image-bootfiles.bbclass | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta/classes/image-bootfiles.bbclass

diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
new file mode 100644
index 0000000000..850e14e4bb
--- /dev/null
+++ b/meta/classes/image-bootfiles.bbclass
@@ -0,0 +1,69 @@
+#
+# Writes IMAGE_BOOT_FILES to the /boot directory
+#
+# Copyright (C) 2024 Marcus Folkesson
+# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
+#
+# Licensed under the MIT license, see COPYING.MIT for details
+# Inspired of bootimg-partition.py
+#
+# Usage: add INHERIT += "image-bootfiles" to your conf file
+#
+
+def bootfiles_populate(d):
+    import re
+    from glob import glob
+    import shutil
+
+    boot_files = d.getVar("IMAGE_BOOT_FILES")
+    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    boot_dir = d.getVar("IMAGE_ROOTFS") + "/boot"
+    install_files = []
+
+    if boot_files is None:
+        return
+
+    # list of tuples (src_name, dst_name)
+    deploy_files = []
+    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+        if ';' in src_entry:
+            dst_entry = tuple(src_entry.split(';'))
+            if not dst_entry[0] or not dst_entry[1]:
+                raise bb.parse.SkipRecipe('Malformed boot file entry: %s' % src_entry)
+        else:
+            dst_entry = (src_entry, src_entry)
+
+        deploy_files.append(dst_entry)
+
+    for deploy_entry in deploy_files:
+        src, dst = deploy_entry
+        if '*' in src:
+            # by default install files under their basename
+            entry_name_fn = os.path.basename
+            if dst != src:
+                # unless a target name was given, then treat name
+                # as a directory and append a basename
+                entry_name_fn = lambda name: \
+                                os.path.join(dst,
+                                             os.path.basename(name))
+
+
+                srcs = glob(os.path.join(deploy_image_dir, src))
+                for entry in srcs:
+                    src = os.path.relpath(entry, deploy_mage_dir)
+                    entry_dst_name = entry_name_fn(entry)
+                    install_files.append((src, entry_dst_name))
+            else:
+                install_files.append((src, dst))
+
+    for entry in install_files:
+        src, dst = entry
+        image_src = os.path.join(deploy_image_dir, src)
+        image_dst = os.path.join(boot_dir, dst)
+        shutil.copyfile(image_src, image_dst)
+
+python bootfiles () {
+   bootfiles_populate(d),
+}
+
+IMAGE_PREPROCESS_COMMAND += "bootfiles;"
-- 
2.44.0


