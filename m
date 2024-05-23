Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87959C25B7A
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:33:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.9951.1716449613320670149
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 00:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUQzcoSN;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a599a298990so1141439966b.2
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716449611; x=1717054411; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPMGszLmxqrgRbEUYpOB9JaWRu0yBdrakM2O5lKUkVg=;
        b=QUQzcoSN7oURgbgO8klRgmTGbYhvtD/WlRCmYHsnmEjgkP1DecSYmqwxvdN1pKryor
         CxuTGm9gj3eXpJC4yPNs8qg+HfRH52QghWf116Cw48Pejvpm9cEfdJGCTD2ljigK1GC4
         RiCENaoAR68CuvDHGjsn1F0AOmst+/iycLwYyHp9KPka7rsVODtoPhbSSvM0RYWgkpOv
         6el/owQ2c5acS/YEOJEXLmR+VKUx2eQWmevUZsUtolX1YyMYb11Wa5OwJtmaBnWhb9Nn
         JHwt2C/qg3V7jJtzgrecdPAEMGuLs9YZrPFaIrmPKc6YHKysZ5EP7PORfK2YaxwL89e7
         keow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716449611; x=1717054411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPMGszLmxqrgRbEUYpOB9JaWRu0yBdrakM2O5lKUkVg=;
        b=UqNeRGoT4h/HAVke4IZQDE+LNJD9S7Ddh5nrPWO/iZu66HDI8SQRDEjWS6BTNdYfuO
         Yye1sdktbdoOaX/sPjNLSnWZMg9TfM6NvC9KIxHMDoUpnPhNs7p28F7P08g+nSt/YTWV
         tra+7v/f5ERp5cgSxS8enM1L+OWV/1+xNJa8DC0i0W2LJm0c94XrHtY01TBbLMZhVqlr
         ZN/RS6pRue/iy7MLXBk3BDG3TtIc1iFpAkYpMp23ipHR3pT0Bmw1Nwd+skdlqe9CwjkX
         qqiNUNGqapnyJWsxrrs+NWrLv7qCDL9QDUAIFJmSy2bBvq8ijaT5uxAoEgIjIm6w2Xfi
         NNVQ==
X-Gm-Message-State: AOJu0YzZTQuG6Vq4dSrWC0wPcNzJ5ewpOwpfyrMVYPjvvaLn8XWKgtga
	SQZn95sM5Y9IZbl2hy9C2zMXY1EBDeXU0/oaGqgHKripoZPqO9CPsrDSfA==
X-Google-Smtp-Source: AGHT+IHWrFv6oRsDxFF1dcnd7oT3eUmJRXlCwiV7w3ZU/eN+5AM1lGXzTay73ME1VUATyT7nX3p+ig==
X-Received: by 2002:a17:906:f258:b0:a59:9c4d:da38 with SMTP id a640c23a62f3a-a62280a2185mr299396066b.45.1716449610992;
        Thu, 23 May 2024 00:33:30 -0700 (PDT)
Received: from goliat.wlan.se.axis.com ([85.235.16.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a90d0e919sm1163469166b.85.2024.05.23.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:33:30 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 2/2] ref-manual: classes: add new image-bootfiles class
Date: Thu, 23 May 2024 09:39:38 +0200
Message-ID: <20240523073938.2135-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523073938.2135-1-marcus.folkesson@gmail.com>
References: <20240523073938.2135-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 07:33:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5228

Describe the newly introduced image-bootfiles class.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 documentation/ref-manual/classes.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9520d0bf7c..53b3697bee 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1169,6 +1169,20 @@ Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-image-buildinfo:
 
+``image-bootfiles``
+===================
+
+The :ref:`ref-classes-image-buildinfo` class copies over files listed
+in :ref:`IMAGE_BOOT_FILES` to the /boot directory of the root filesystem.
+
+This can be useful if no separate boot partition is used but all boot files
+should be included into the rootfs image.
+
+:ref:`IMAGE_BOOT_FILES` is the same space-separated list of files used
+by the ``bootimg-partition`` source plugin to populate the boot partition.
+
+.. _ref-classes-image_types:
+
 ``image-buildinfo``
 ===================
 
-- 
2.44.0


