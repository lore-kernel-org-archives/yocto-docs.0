Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8B4D3B7CE
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 10:11:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.42408.1732615855354321020
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 02:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wFUQuwKe;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53deeb6d986so22844e87.0
        for <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 02:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732615853; x=1733220653; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+Bxcrrxi5ugzO/IIa9wLoKBdJ9FRATht5aptg9qmTk=;
        b=wFUQuwKen6g++R168/AQ0TL8kjCAls+1K3M/WUg7N36AXDl62+ZE1eUtSaVqB9xHPU
         kq/pDK2aUfy/YeVN+iQmotDbnq4Hk81EEshkDgDAFaPKkBMy7e5cwMidwcOhERX1hnbY
         tK/0QidV5Epf+LY7ZJfSOAwOYqD2FBAqv34d8KwtVnl1T6DICmgGI0FCitAaCeVAQR9m
         CU8+hkM8m0jeOxK/dgYgRiOSC9FRvEO5ZfQfSczxH2w1ZvgriZYVL0Ny/XRDaf5rzQti
         hvSnDY9t7sKQk/YciseAAQCpmotP2w0DcHbtSOZX+UBtxfxtTe3v7GeDytd4PgZP1mJe
         WRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615853; x=1733220653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+Bxcrrxi5ugzO/IIa9wLoKBdJ9FRATht5aptg9qmTk=;
        b=AHNEIBCs8xgC/IsjTYrh2WiVv8gBtIIi38xcHeqoW0yKIqVC8mowJg/NmVWSeJpj4q
         ane2Nn2yIHBhhx45AjEOsxsyrQXRiTKxpyT4/6nEvyAK8aw0qjqAWLnTofOe3NDa21ju
         4r2hVUk+9EUScHz+BVOQ2lbcO96kPihff0LpO0OOw0U2TOrYPCpKO1C7qrtnEzx+jS4b
         hVceYEiCv3hS/yxyZ2R2PUqMx3J+KucMRehfcB4RqZ7cRZaJPuovhReOZ8aEs7pTm/Oq
         MQISfT7GD0BczmhUGTBDihCKleLnN33piesm7FwjRP5MBgZZA9t9Zxy8mFvy24bkgYuV
         51pQ==
X-Gm-Message-State: AOJu0Yy/6GRJAknPMRPpCZAOYB/DwZy8p+u/l8ziApiR+/Wzgs3hnZ/S
	uSCdGg5r1KaXzprOkV0BNyFFZ+7J7GhzvGjz8lC6IOt3C7NykqGSoY7V11kIUvHws5Y7m9cwB+O
	O
X-Gm-Gg: ASbGnctZa1YaFyAMAlCBbnGfgUJgUn5CZYORB6hyB/TvjLlciDZS/CTZuyDpK9gpA7A
	zF3sULV/a/G0FYwAGAbDrOSB7VttuLt1blDrDs9oMgYkB3v7ioWBWF1/nNunlvprk6gf4JSWeoP
	bTV/xu4ttvvOzGGD/T2J/EQYZD7K1aRpwTtWROomA4QQ8bwCUs4MW9wKgHP82al7I3K4bL4TyNt
	tXJUidC19VqHxc3g5u07uFUIaI6nOcXBN876vpVv7O11fdHSxFpIzwkJG8gb/C407RUPqe02Sn+
	/n9r1LOxNFlai+rAfGaaYT4UA//CB9giu/eMww==
X-Google-Smtp-Source: AGHT+IFZXU0ckdC2AHXhuJOauV0vIhX1E0geKdohrDg90R2Q5G4QvCKnBEzdU8gJZCxFhf45pqNRzg==
X-Received: by 2002:ac2:4f03:0:b0:539:8a9a:4e63 with SMTP id 2adb3069b0e04-53dd39b55d4mr7317518e87.42.1732615853420;
        Tue, 26 Nov 2024 02:10:53 -0800 (PST)
Received: from localhost.localdomain (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd245183csm1956555e87.88.2024.11.26.02.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 02:10:51 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/2] variables.rst: document uki.bbclass variables
Date: Tue, 26 Nov 2024 12:10:19 +0200
Message-ID: <20241126101019.302943-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126101019.302943-1-mikko.rapeli@linaro.org>
References: <20241126101019.302943-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 10:11:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5814

Documentation for the new class.

[YOCTO #15650]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ec4d7ab73f..65fea43a1e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9846,6 +9846,38 @@ system and gives an overview of their function and contents.
       passes and uses "all" for the target during the U-Boot building
       process.
 
+   :term:`UKIFY_CMD`
+      When inheriting the :ref:`ref-classes-uki` class,
+      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
+      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``ukify build``.
+
+   :term:`UKI_CMDLINE`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the kernel command line to use when booting the `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``rootwait root=LABEL=root console=${KERNEL_CONSOLE}``.
+
+   :term:`UKI_CONFIG_FILE`
+      When inheriting the :ref:`ref-classes-uki` class,
+      an optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command.
+
+   :term:`UKI_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the output file name for generated `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``uki.efi``.
+
+   :term:`UKI_KERNEL_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the kernel image file name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
+
+   :term:`UKI_SB_CERT`
+      When inheriting the :ref:`ref-classes-uki` class,
+      optional UEFI secureboot certificate matching the private key in :term:`UKI_SB_KEY`.
+
+   :term:`UKI_SB_KEY`
+      When inheriting the :ref:`ref-classes-uki` class,
+      optional UEFI secureboot private key to sign `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
-- 
2.43.0


