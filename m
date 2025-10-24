Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC9CCCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:45:09 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.5443.1761295501083854523
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gEWwWzXw;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42701b29a7eso942769f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761295499; x=1761900299; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/MTrt8B10X7ffRwwO42TMfnpnytmtCblxUKNWcURAY=;
        b=gEWwWzXwYKe6WyG7l0sbyzmn2KcNGe2i0BH8+1tnOYmeC7Jd6mFGiCFMUymdJlHc58
         KAYaG7bmkLGLQHrGYdtDWdLieZvqtmPxvkUEKWyNfR9eRZYmHjMZLYKr80yhF5XFZKhU
         KHBB5x5qTuC+EDa7Z2dWBEDB+nq7UlM8OMUO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295499; x=1761900299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/MTrt8B10X7ffRwwO42TMfnpnytmtCblxUKNWcURAY=;
        b=c1PMnutZJYR7DNKBWGo1KHEfcLFVeK/P4ow9c/yGjEUs56JQCRwv23UKWVrJfIlL7X
         ++P58IF2TRE1nb2c/Dj8V2YcF5tU+reZI0splR5jzw4UJpzyf54d1Tn+wQAcgNRICWZF
         TZ5Q7G+6yBSYl07N62Y6kdmmQqhXmg1BXEq4yZyLs+431FuewQs+O1nweW09IwZJIDhG
         vNeruhGbiJBSKra6t11WfiLOyaIfIn321qNgTETJWHLr34uzrwSRaGqLT/jUV5eJ1KNS
         wbuq8PH7KdXrmOm9FmIVSBY5/0KJJjBviEMhaYQ/lCuqJY3QYeVgfYo1bwoXAw+cOPFL
         KFIQ==
X-Gm-Message-State: AOJu0YxVR85wmh6fmusthX7eJdHXlSbOJ5CWKQNt3ZwSm3kJpnKTnvea
	xHtivL4B4AqxG2+7Z+rAjL2JxBz2ueTx6Qbo6TNn6pINTBM0YD99Qa3rk5gARpn5lJk9ID1wE4+
	1XUuSVtg=
X-Gm-Gg: ASbGncvcQCwqHOuBoVoUPIhQmkb/8QBdO0ozW3YRbRxrCh+T90YI996XtFRx8rIvZz3
	6QfMtVFL1AbeSAIZOPLmDAuBBQ+obqIck+zCjLTLFauC54FD1Q41NJVP88JYQFQmTXHVM5LKVLh
	BdiH4sN/nMaqr2rBvjAfkJsVxr7V6vyEELX801i2gabDsz0O2t5xvYRNw5UXPIz/tJ2KMTJqjfN
	Lg3SzgUAXq5+m8OgmuQVV/1crlngDbspGaAnYsleoxGBO9a/+4/6ptaB5yi/NGZnQTkyqpWypre
	UAP+QKk8TTq2qtRp7Tx6m0AmcRhJCkqX/hXDuo2S0A8/nwXYFLJIUZyAheCmBbZ1dmeO3LhGzyO
	Gb+G3yy9rfENpIreCozxw8RyXGfi1OnLYv1AH1jB4MBUXDdt5OzSMvtFl6jMvbu5waB8ja6gwJC
	zbWeCH3IvIlasx8VCvsxlucHlous1yDOv77CFJGZ3FscYdTIo0EoVcEtlpc299da+sHWQJ/EKkZ
	j7HSgW83DGw0Sv8dQ==
X-Google-Smtp-Source: AGHT+IE0AvTN15XWF08UoRjne5+tWa8IYO3QINIeixfy/ce1rnGlRzDBUQq0AEKJaQneQ9nEtZoJpQ==
X-Received: by 2002:a5d:5f93:0:b0:3ec:db88:bf1 with SMTP id ffacd0b85a97d-4298f53c6eamr1793901f8f.12.1761295499430;
        Fri, 24 Oct 2025 01:44:59 -0700 (PDT)
Received: from FRSMI24-BLUE.home (2a01cb000301bd0006147b1ba480ee12.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:614:7b1b:a480:ee12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e74cdsm8178782f8f.9.2025.10.24.01.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:44:59 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH v3 1/2] ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES
Date: Fri, 24 Oct 2025 10:44:45 +0200
Message-Id: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:45:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7807

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
changes in v2:
- apply suggested changes

changes in v3:
- rename example filenames for clarity
- specify that hidden files are ignored and that the glob pattern is non-recursive
- change 'partname' with 'partition name'
- expand the last example
---
 documentation/ref-manual/variables.rst | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 591c03028..a608a61f2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3956,6 +3956,67 @@ system and gives an overview of their function and contents.
       material for Wic is located in the
       ":doc:`/ref-manual/kickstart`" chapter.
 
+   :term:`IMAGE_EXTRA_PARTITION_FILES`
+      A space-separated list of files installed into the extra partition(s)
+      when preparing an image using the Wic tool with the
+      ``extra_partition`` source plugin. By default,
+      the files are
+      installed under the same name as the source files. To change the
+      installed name, separate it from the original name with a semi-colon
+      (;). Source files need to be located in
+      :term:`DEPLOY_DIR_IMAGE`. Here is an
+      example::
+
+         IMAGE_EXTRA_PARTITION_FILES = "foobar file.conf;config"
+
+      In the above example, the file ``foobar`` is installed with its original name
+      ``foobar``, while the file ``file.conf`` is installed and renamed to ``config``.
+
+      Alternatively, source files can be picked up using a glob pattern.
+      However, hidden files are ignored, and the pattern is non-recursive
+      (subdirectories are ignored).
+      The destination file will have the same name as the base
+      name of the source file path. To install files into a renamed directory
+      within the target location, pass its name after a semi-colon (;).
+      Here are two examples::
+
+         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
+         IMAGE_EXTRA_PARTITION_FILES = "foo/*;bar/"
+
+      The first line in this example
+      installs all files from ``foo`` directory
+      into the root of the target partition. The second line in this example installs
+      the same files into a ``bar`` directory within the target partition.
+      The ``bar/`` directory is automatically created if it does not exist.
+
+      You can also specify the target by label, UUID or partition name if multiple
+      extra partitions coexist. Let's take the following example. This would be
+      the WKS file for the image currently being built::
+
+         part --source extra_partition --fstype=ext4 --label foo
+         part --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d
+         part --source extra_partition --fstype=ext4 --part-name config
+      
+      And the following configuration::
+
+         IMAGE_EXTRA_PARTITION_FILES_label-foo = "foo/*"
+         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "foo/*;bar/"
+         IMAGE_EXTRA_PARTITION_FILES_part-name-config = "config"
+
+      Then:
+
+      - The partition labeled foo would get all files from the ``foo`` directory.
+
+      - The partition whose UUID is e7d0824e-cda3-4bed-9f54-9ef5312d105d would get all files from the ``foo`` directory, installed into a ``bar`` directory.
+
+      - The partition named config would get the file ``config``.
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


