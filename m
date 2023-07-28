Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA69C001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 16:50:38 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.36916.1690563036569063237
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 09:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PD/1Z9xj;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5221e2e69bdso2956093a12.2
        for <docs@lists.yoctoproject.org>; Fri, 28 Jul 2023 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690563035; x=1691167835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xPeM4r6fouFqqbDlvoCxE0KuKCrXjQ4UNnNnJ9q5ZQ=;
        b=PD/1Z9xjpQfm9oeuOvJxnfjTU3A0WhZLL+eM9wgv6Yr8I+3rlklfwdELx2byRwgaLN
         5YJBEZ7cWF04c3LkUXv0bC6UGmBVrqKx/L388C2xIzNe1zLX+TanUZzVNyGWvOqJQ/al
         s9paeTI1gGwNp9bgICKzEHZm/+lAdsW4xJwc2qchkl7e2p1GBbHxJDDmPmGhFph2oxn6
         fI772nh9cz/dFZoOk6J9WEdjH5o/YOsv8ZZ8+O5EabgTPg/whieuZfS5gaY28ECJ6NT3
         YS8u/TjRcZAOGxHvBd/HPBIZb1p4DoJ4S0Hwn5nWj/AFEYQRg5PC5ctuANqM3am8mT8O
         JVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690563035; x=1691167835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xPeM4r6fouFqqbDlvoCxE0KuKCrXjQ4UNnNnJ9q5ZQ=;
        b=ZqG3i39h7k9Ok7ClgbUOBNFR0TdkUWRcqLHZKqgvK7HPguUH8ISeI97eGxrB//t89P
         kDUvV0BH8pQ3HTvEJtAXIW68ysbWj7Jz5tvcvz5g4S0ofU5Qid0XTrYPhmzWH4UZAJml
         Rdo4LwGRVOBl6htj6M0y4jMAq+rnvIfncGZhKCOFERvlc+aKJjxbHtlvcwGwDdmRzng1
         FjUy3yN/tlEpcLlVmoHKBXJGvvcfieh5O4G5fE8bin3Pq+NOcQkF52RZN9ULqo8Yf1QN
         LXb74CXlkRkfIsXerBYqL/sDGyOh7vduZSSLkoHqDrHHMI+tmgM2hXEv2oNbOI3CC8k5
         99ZQ==
X-Gm-Message-State: ABy/qLYgF3HEGVD4e60zOhQHZsrQW4tTmvkP0wI+Tq2Llhq5/9ESDfIv
	X0pSAiSkdQsrs+FquFSQHNIHVX2Ozko=
X-Google-Smtp-Source: APBJJlF3NV9wQeKCKQ+f/SaqCIO6VArmIYTNbXUCVko2wOSYWgVNBWW6t+PmPsQ0+hmKKFowo+gkCQ==
X-Received: by 2002:aa7:d6d0:0:b0:522:1a98:3cad with SMTP id x16-20020aa7d6d0000000b005221a983cadmr2366175edr.22.1690563034777;
        Fri, 28 Jul 2023 09:50:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402516f00b00521f4ee396fsm1966872ede.12.2023.07.28.09.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 09:50:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ref-manual: document image-specific variant of INCOMPATIBLE_LICENSE
Date: Fri, 28 Jul 2023 18:50:26 +0200
Message-Id: <20230728165026.862640-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jul 2023 16:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4082

This has been around without being properly documented since 2019 (!!!),
and is nowadays the preferred method for enforcing license restrictions,
especially since meta-gplv2 is officially obsolete.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/images.rst    | 16 +++++++++-------
 documentation/ref-manual/variables.rst | 13 +++++++++++--
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index d3aeb0829..19c31e0fc 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -14,15 +14,17 @@ image you want.
    Building an image without GNU General Public License Version 3
    (GPLv3), GNU Lesser General Public License Version 3 (LGPLv3), and
    the GNU Affero General Public License Version 3 (AGPL-3.0) components
-   is only supported for minimal and base images. Furthermore, if you
-   are going to build an image using non-GPLv3 and similarly licensed
-   components, you must make the following changes in the ``local.conf``
-   file before using the BitBake command to build the minimal or base
-   image:
+   is only tested for core-image-minimal image. Furthermore, if you would like to
+   build an image and verify that it does not include GPLv3 and similarly licensed
+   components, you must make the following changes in the image recipe
+   file before using the BitBake command to build the image:
 
-   #. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
+       INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
 
-   #. Set :term:`INCOMPATIBLE_LICENSE` to "GPL-3.0* LGPL-3.0* AGPL-3.0*"
+   Alternatively, you can adjust ``local.conf`` file, repeating and adjusting the line
+   for all images where the license restriction must apply:
+
+       INCOMPATIBLE_LICENSE:pn:your-image-name = "GPL-3.0* LGPL-3.0*"
 
 From within the ``poky`` Git repository, you can use the following
 command to display the list of directories within the :term:`Source Directory`
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ac5b97a52..e0d3b880d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3905,9 +3905,18 @@ system and gives an overview of their function and contents.
    :term:`INCOMPATIBLE_LICENSE`
       Specifies a space-separated list of license names (as they would
       appear in :term:`LICENSE`) that should be excluded
-      from the build. Recipes that provide no alternatives to listed
+      from the build (if set globally), or from an image (if set locally
+      in an image recipe). 
+
+      When the variable is set globally, recipes that provide no alternatives to listed
       incompatible licenses are not built. Packages that are individually
-      licensed with the specified incompatible licenses will be deleted.
+      licensed with the specified incompatible licenses will be deleted. 
+      Most of the time this does not allow a feasible build (because it becomes impossible
+      to satisfy build time dependencies), so the recommended way to
+      implement license restrictions is to set the variable in specific
+      image recipes where the restrictions must apply. That way there 
+      are no build time restrictions, but the license check is still
+      performed when the image's filesystem is assembled from packages.
 
       There is some support for wildcards in this variable's value,
       however it is restricted to specific licenses. Currently only
-- 
2.30.2


