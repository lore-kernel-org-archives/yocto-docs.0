Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0F2D167EB
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:33:36 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6813.1767951209034921004
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wjqqS6Qe;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43284ed32a0so2056798f8f.3
        for <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 01:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767951207; x=1768556007; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uerVv05ujti0S/welIu43r8N5D+DqF2KzpaNiFEz6+M=;
        b=wjqqS6Qe1TF0GjUSyPswZza1plxkPf1oaGsqsaX4lH2tYVHtUz+f14IyjPxMGoATfr
         A5wskPJi1bLCnCPDcIQdcXKgMmS4qXvtkDOgRtDQmXSb/ccrJBRQLU1y8DYRAZ6do4yN
         XlJu2ZLkCvnRysegkgIgO1tkRExhWaf8jaig0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767951207; x=1768556007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uerVv05ujti0S/welIu43r8N5D+DqF2KzpaNiFEz6+M=;
        b=cuiUC8Tmy5jLf+ZFIr0z9ETSL2B0Mbz3ZJhC0QFV9nKvtNC/CeZIojBz2UuBX1I4cb
         h0USr+5Nn642gEPh3OJ9SXTL02YI32YMfae+yyESyMTsgKYGqGksFjqJu+ByXkY+o6ap
         UWF+SotXyYHUleZBZmgaM/sqfRGi6A5yc+5AUZTmQiStNdxft/oLVtN2BroC0n+XeRRa
         KI7zSQf56HeO2YTVv6Qfko+/vp4hLU7EpfNB6e+b57My/+jTEnTr9uTljudCFNiWaff5
         Cl2vbwz7pesVsKmrs10X6W5OGM/0RugLquKXC+sDTPb2MBACTe7vw8AtnMss9TXNzRf/
         oXaQ==
X-Gm-Message-State: AOJu0YwHKoJhx+05HfwY3OlrlMyjT6r8oDDYUbqKNlOOxWvD4muI4Bng
	inkWKgZ+6P9voUjXaEC81qXkwPSGDmc4nzHh2GLyKkfWHEeOhoZ8ruPS2mFS+KHzbXojLg9s5Z7
	4lAVf431Mrw==
X-Gm-Gg: AY/fxX6/96+RLFE+VSxuVEOIYr2DOsDCDd+5mwxWsHpFs9gSKjsxLcEqrerPSU/k+vY
	lc/TmfWQsuw/Cm7p6RiPx4KEK3Msp700mOKBXZIdrLvUYsKhIOAlJx4nTrcoFba6ZFoNgGM6ZpN
	ktw4LlU83y3PRyO1kfce6GE6h98Eenm8fli6gdb57BOU8TZhHGv4TfnugOVjb5e6lkZlK+sYRlb
	9gAQVWPAtb6stPeuheXnJWgbU3toNsVVz7iZI0WiULPWQBjOxMol2CP4U2XowMxdwrK4WcU/Osy
	SWASl16KlZr9JYrop1AFhedmSwUvkhH7WkPjEK8PFEy4FraMID/1WbewLdeem+Uj+0OMSXE4+GY
	M/xVOUXyvGxJSeGLtaHtFxrJJdv2zuZBI01502XehU7Kkun4pQ+ndTLHqckOS6IMQ0VhZyXE4q+
	MFMMt/ddqU5OT3258aRVvD0jXaumwyLF+2gy+iW46I/HUY4762HPuSxvw1JVP3izv7Cdc/TZJ0L
	QG0q7jAncoTFbIv2StXQdZD2M5zBC7KgbMQKJS48544RUM3Mu2IF3i0sRod7u978FS4KwI1Ojrr
	QMGOeP8rPe/B0hrAPeMvRK+a
X-Google-Smtp-Source: AGHT+IEZC3y5DmQ1XQ2gP3Nz0rwOnqZGLz32OC9S0XexPmYP59mGGFMQIvJOSdnPJPYyMVimRYn4Xw==
X-Received: by 2002:a5d:4b42:0:b0:432:ca6c:7b03 with SMTP id ffacd0b85a97d-432ca6c7ba1mr6380710f8f.26.1767951207359;
        Fri, 09 Jan 2026 01:33:27 -0800 (PST)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00fac876ea81338aac.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:fac8:76ea:8133:8aac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm21452920f8f.33.2026.01.09.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:33:27 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 1/2] ref-manual/variables.rst: document UBOOT_INITIAL_ENV_BINARY variables
Date: Fri,  9 Jan 2026 10:33:04 +0100
Message-Id: <20260109093305.1137281-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:33:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8440

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
image") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Cc: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Rephrase UBOOT_INITIAL_ENV_BINARY
- Add link to WIC doc
- Rephrase UBOOT_INITIAL_ENV_BINARY_REDUND
- Remove empty line
---
 documentation/ref-manual/variables.rst | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ee776c110..b5d072983 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10974,6 +10974,52 @@ system and gives an overview of their function and contents.
 
       See the :ref:`ref-classes-uboot-sign` class for details.
 
+   :term:`UBOOT_INITIAL_ENV_BINARY`
+      This variable enables the generation of the U-Boot initial environment in
+      binary format.
+
+      Its default value is "0", set it to "1" to enable this functionality::
+
+         UBOOT_INITIAL_ENV_BINARY = "1"
+
+      If set to "1", you must also set the size of the environment with
+      :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`.
+
+      This variable is used in the :ref:`ref-classes-uboot-config` class.
+
+      The resulting binary can be flashed using :doc:`WIC </dev-manual/wic>` or
+      any other flashing method at the environment offset, overriding any
+      existing environment if one is present. Below is an example of a WKS file
+      to flash the binary::
+
+         part --source rawcopy --sourceparams="file=u-boot-initial-env-sd.bin" --ondisk sda --no-table --offset 4096k
+
+      In this example, the U-Boot initial environment binary
+      `u-boot-initial-env-sd.bin` is flashed at offset 4096 kibibyte.
+
+   :term:`UBOOT_INITIAL_ENV_BINARY_REDUND`
+      If redundant environment support is enabled in U-boot's configuration,
+      this variable should to properly generate the redundant environment in the
+      output U-boot environment binary file.
+
+      Its default value is "0", set it to "1" to enable this functionality::
+
+         UBOOT_INITIAL_ENV_BINARY_REDUND = "1"
+
+      The :term:`UBOOT_INITIAL_ENV_BINARY` must also be set to "1" if
+      :term:`UBOOT_INITIAL_ENV_BINARY_REDUND` is enabled.
+
+      This variable is used in the :ref:`ref-classes-uboot-config` class.
+
+   :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`
+      This variable sets the binary size (in bytes) of the U-Boot initial
+      environment. Both hexadecimal and decimal values are supported and can be
+      set as follows::
+
+         UBOOT_INITIAL_ENV_BINARY_SIZE = "0x4000"
+
+      This variable is used in the :ref:`ref-classes-uboot-config` class.
+
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
-- 
2.34.1


