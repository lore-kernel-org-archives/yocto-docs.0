Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD27C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 12:40:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.19932.1747744814168240492
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 05:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=WNdRZPVW;
 spf=pass (domain: snapchat.com, ip: 209.85.214.175, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2320d2a7852so23332865ad.3
        for <docs@lists.yoctoproject.org>; Tue, 20 May 2025 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1747744813; x=1748349613; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kcXQAzKskCuyTdh3wUZa0+hQFtKINxlrKrNP8MPtVU=;
        b=WNdRZPVWa8t7x5EtJdmUNLZ6l7aF1Yoff2jPqkp77ylWSeM2InBBtEr+1RSgSIPNn8
         rIYCftlgw2vPUbQMbEAbQQjmbtqdWAGnSN25gkwi3E88lwq6sBi0CyXgD+Z62EPJ0Yw0
         LiLylYSyRYrVl61jPF08Ejyuw2X609u26R4JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744813; x=1748349613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kcXQAzKskCuyTdh3wUZa0+hQFtKINxlrKrNP8MPtVU=;
        b=UR7xCyCvIOTjoBNeuLWzYa+iffqEEfQL5r7JPjw+el3bOq1bCrmPJkToOy8RW5zx4w
         6JYxv+410jYMfm9/zO0s4pP5IfPCDJU7zRpcivxjM6IHK4eL4bHnJkw+z5chYBLdZzzh
         WC7or2TB1O05pBYMHskZS72qPAUPKjxoqCwIDtH2+JjZfMegM40YDdMJAgUqadOyDjOi
         VtPNHMHUSokjRNthx6vqMOi8XMu0wBgR6Ov8QOF2g/zNkYXlQnnXPD4A62yBOcz1KCCU
         JdjHXoVWUXKBfBW8lVxM0PSBcPaZwMuZvjuMxz0WclE13/WJtFIHQKaWVlaIwC3AL5Eo
         Fdpw==
X-Gm-Message-State: AOJu0YwQ6/8D0PZuG057pFm6zoYUl+zFU+xcAzeZ9lri5pjmOyoqBb3u
	+8ACujUt0hXD6y2C1v++REpunp5vTafMQErgTuWdylDjyZvmTCHLWTwCeBQC7MTDu82gbAog4zd
	dvHbA9yM=
X-Gm-Gg: ASbGncsFRFgtHOrbKSHw3jbmJzS/1Kn5z11Jk8B9pcd5Jo+mTKflyxCENxf6sBSc2MY
	tel4OiefaRd6C1uZSlJystrRBbYDf/Wm0k2rs6wjOSF713vYD1I80zMxZ6kHgUAUan8Q9xVCO6v
	tkkJQCHhhHQnuc0DKlYFw3B2ge4P8e1/+k716smm8V7lOBEkTE1MK9/BBpc0Oz4Tuzc5sdWWv+S
	9E9DbMGO4yPgBhcf7EgbLiJ7eEczoOlyORFuveXcpyUa9JgP3MHO8OBYo2QDLyRs1QHpdTqTs5b
	9XrYPblt8VU5Ah0mBFFwuZbRBBOTKzQIwOu2mdW+EWMr+WKjij9SqWKtNCvRBDzY
X-Google-Smtp-Source: AGHT+IFSWbwCn9iEanwdXgAD2getXo4OevuFo0tnzy8anuezsLocFkNS+4UQS4NPgpJkJHa83uaWfQ==
X-Received: by 2002:a17:902:f78c:b0:220:d909:1734 with SMTP id d9443c01a7336-231de35fd54mr231125825ad.14.1747744812958;
        Tue, 20 May 2025 05:40:12 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb3a2sm75741765ad.57.2025.05.20.05.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:40:12 -0700 (PDT)
From: ecordonnier@snap.com
To: docs@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] ref-manual/variables.rst: document SSTATE_SKIP_CREATION
Date: Tue, 20 May 2025 14:39:55 +0200
Message-ID: <20250520123955.2341427-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 12:40:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6856

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..7d8e257b9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9049,6 +9049,12 @@ system and gives an overview of their function and contents.
 
       For details on the process, see the :ref:`ref-classes-staging` class.
 
+   :term:`SSTATE_SKIP_CREATION`
+      SSTATE_SKIP_CREATION variable will be used to skip creation of
+      sstate tarball files. It makes sense e.g. for image creation tasks as
+      tarring images and keeping them in sstate would consume a lot of
+      disk space.
+
    :term:`STAGING_BASE_LIBDIR_NATIVE`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
       directory for the build host.
-- 
2.43.0


