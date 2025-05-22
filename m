Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A25C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 18:09:21 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.30432.1747937356930344617
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 11:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=npC8glF3;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54e7967cf67so9696919e87.0
        for <docs@lists.yoctoproject.org>; Thu, 22 May 2025 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747937355; x=1748542155; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7B9CdegrD0o/3xTxsBkd+iXXR/l8hR5nh7iCWuVNjLw=;
        b=npC8glF3Imnz8y8DKr0VJDnqlkzWwVhORFxSfqX40ooXBzH4pU+gGsub8QEactweos
         7qX6gv7iQpOVxUNpciAZn4rttXuit4mTIcngSgbIBrgEHnqT0j+xHKK7uAcir1i3/Hge
         ytXQgIB2y3ZycLcFAJxIMxiHw+cLLBZhgTeLf6wgmdMTa4YELvXzR15tqOMJ4o2LVPjO
         0gCAg2E12t4x95LT83LAjtuyumrErytO2mIXzUy5B1Ug5weHF0yS3alYKg9L9gi2Sy+l
         Y9CgpnbaZj7y9msnSgiYqNy7aTC9VWiF5tCHKrAnW/lKYpzfCJdksHM4LSY1UId9Ps+d
         5ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937355; x=1748542155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B9CdegrD0o/3xTxsBkd+iXXR/l8hR5nh7iCWuVNjLw=;
        b=I2BwEJXUKsbZm/DXlgdDciT8R6SdTYGZJGxSwqryIQ+GgMdiD5HNnFD6OOfoUkW6Jc
         bAmlghBOgZQS+2AazpyfklxBxSHAr6D2o+5STRyTwcdLPLkBKUvLMvzarwADINbiSsXK
         BT9y3qSsSmo7ihroBEMpB4JIE9kk7v2GnoOsAlUyUFIpQu2DMrzGHuK2G1f2ygNjjHvo
         khtOL1DQMrw0hakQgbNYeuWLDH2uqqh1iQ20AiuOWRNPCvEkS7RIAVanSbhEu7bX+1GF
         JX13bGtjYCTGqZrGuDqF3uYbSQce/l6lj/vOlE4OeahRISOzkKEx2cvl8mwn078+4DUY
         KX1w==
X-Gm-Message-State: AOJu0YwDkm2CMFqUVSg9f2k/0Ab/eVNIS2Dn2hckX5bnQ7IuwG5gHYHn
	d6825+JlcM1PaWtMLPdDEC9f9pDFsR4cZiMSLW8foDQ0Ignrkm1grYOlTgV4zTNu
X-Gm-Gg: ASbGncvHM/t2eas4dIdfVX0RVVAwFYt6bVTN4YASJGM5ZvLNjmqozicJ/4ZT18AAqCq
	SAgRqDYELWmOxgZ63DcS3LfUUHxhJVJ9P4Lb3QwOpA+fdzjGbgkbv6vYN9ZmMoGZrubg87xpHWZ
	aTD5VaFiTLySbTl1aPO+geDTvx5DNfnUpgPnqa5mnqLY+05ReG2eT3KfiezPMa0nSac+Ayoe7Kk
	/WOWi50Qt9S4MJz88GVOV+5pVbbG4n8APS06rJQMYvS9oPPWN8CiBtgOu011L36rgwvbGf1rHqq
	T00xwvmOVD60uLxvKs+8ZA3wzCeZiq0zRwRi4au7RVHmmy7VxF2jQSpot8FdkzViwRLa
X-Google-Smtp-Source: AGHT+IH9+H+yiBb6SoMIOxO7vvXfurEquIXmKUfMQ3vmeRT6/C2+/8brcHT8JXFNaLq3Ino2NDZFsQ==
X-Received: by 2002:a05:6512:6619:b0:54a:c4af:29 with SMTP id 2adb3069b0e04-550e7268103mr7682878e87.52.1747937354377;
        Thu, 22 May 2025 11:09:14 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.152])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dbebsm3516409e87.206.2025.05.22.11.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:09:13 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS
Date: Thu, 22 May 2025 21:09:03 +0300
Message-ID: <20250522180903.109356-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 18:09:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6882

Fix [YOCTO #15753]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6d1b64ef8..bf098ded7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4601,6 +4601,24 @@ system and gives an overview of their function and contents.
          even if the toolchain's binaries are strippable, there are other files
          needed for the build that are not strippable.
 
+   :term:`INHIBIT_UPDATERCD_BBCLASS`
+      Prevents the :ref:`ref-classes-update-rc.d` class from automatically installing and registering SysV init scripts for packages.
+
+      When a recipe inherits the :ref:`ref-classes-update-rc.d` class, init
+      scripts are typically installed and registered for the packages listed in
+      :term:`INITSCRIPT_PACKAGES`. This ensures that the relevant
+      services are started and stopped at the appropriate runlevels using the
+      traditional SysV init system.
+
+      To prevent the build system from adding these scripts and configurations
+      automatically, set the :term:`INHIBIT_UPDATERCD_BBCLASS` variable as follows::
+
+         INHIBIT_UPDATERCD_BBCLASS = "1"
+
+      By default, the value of :term:`INHIBIT_UPDATERCD_BBCLASS` is empty. Setting
+      it to "0" does not disable inhibition. Only the empty string will disable
+      inhibition.
+
    :term:`INIT_MANAGER`
       Specifies the system init manager to use. Available options are:
 
-- 
2.43.0


