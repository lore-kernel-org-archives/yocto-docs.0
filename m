Return-Path: <aatrapps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7974DCCA479
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 16:35:58 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.487.1656434151436560756
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 09:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GsaxkSUn;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: aatrapps@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id r138so10033471qke.13
        for <docs@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvVJpo4vMlaGwACxiJ4L+bIuSeFGzfXb5VVXCt9VHus=;
        b=GsaxkSUnngm7S8NlkFjubQ87AOtGGdyyhp/3m4N1Rcq3VxweLQ2cz87q50JAzVIEsV
         g5v5dUIgx2nDrbUCo+MFhj+LNCs5wpAcnn3wZebcscYrTlcKvAiizs5FQ671CoMX/X9o
         uu3lgmYnvvVXEmQoLq+7VMMDfGJ3OUUgkfuKf8321mWG1YdBlfydRIA4L7LuFXb9IzVR
         PEoYV7nZDYen6FSvqIf0LciY3yvYR9+bBncv/xQhlifDBrZG4VVje8LFaOR6nJ0MpPuj
         wtxifV7OaPAI4U4TNe3hNjPIMJYSsBLklgObs8MCycXZM0iOSPZqv8ECkBeFpRuxTGYL
         /PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvVJpo4vMlaGwACxiJ4L+bIuSeFGzfXb5VVXCt9VHus=;
        b=DZAmpmxMPpYPjmUGlYU2ML6mpSYjUwDuhxVPNUl2OlOFQrNRVuvxTOzCH/P1IEDNKn
         9rugfbIYlZS68zAsm36mOSbU/PtSxBUoJBcm0a2nRnLXtQydB0XkysTrYpyEBPQD0BPM
         7hZVrvkFOSMIU4dvg+DzoTkZ+CuVMeL94mGvoeV4arLeoPnIsEMXda2Dy0ZSVzsA36fo
         lP1cdmvpLwpKEpxW6FtG2RGnV/1eRMSgphmHD2vYR4oHNzhFUVYoA+6ByMCnZ/VRnkzd
         UnJ61f9on3x9L+lkM2nyLrdV/4HLUltLILmpoucNn1CeEtSJeDCE9+GF7tZCBmBjOuJ1
         EKYA==
X-Gm-Message-State: AJIora9d0xBOGP++amugLeAW8gdVngG9xTKXT6JaUiuF5Ykzr8ZGr85c
	Uy8GyHBwXt17AZX3MCUKzseEEqRamCo=
X-Google-Smtp-Source: 
 AGRyM1sH3Re+k/XGVVD6CeCdTzN7sFFQ+1uzcdbIHg8WBvUxDcdJ4lH/WDBM7qwDiCUeTSi4J5d3Mg==
X-Received: by 2002:a05:620a:2711:b0:6a7:9aa0:aba4 with SMTP id
 b17-20020a05620a271100b006a79aa0aba4mr12252991qkp.232.1656434150474;
        Tue, 28 Jun 2022 09:35:50 -0700 (PDT)
Received: from localhost.localdomain (ool-4578ffd8.dyn.optonline.net.
 [69.120.255.216])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a37bb06000000b006a981a2c483sm10942881qkf.39.2022.06.28.09.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 09:35:50 -0700 (PDT)
From: Aatir Manzur <aatrapps@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Aatir Manzur <aatrapps@gmail.com>
Subject: [PATCH] docs: add CONVERSION_CMD definition
Date: Tue, 28 Jun 2022 12:35:29 -0400
Message-Id: <20220628163529.3198-1-aatrapps@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jun 2022 16:35:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3036

Signed-off-by Aatir Manzur <aatrapps@gmail.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8f7b01c12..600e68372 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1297,6 +1297,12 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`CONVERSION_CMD`
+      This variable is used for storing image conversion commands. 
+      Image conversion can convert an image into different objects like:
+      - compressed version of the image
+      - checksums for the image
+
    :term:`COPY_LIC_DIRS`
       If set to "1" along with the
       :term:`COPY_LIC_MANIFEST` variable, the
-- 
2.31.0


