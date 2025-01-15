Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F942C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 08:08:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.16279.1736928492139036993
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 00:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=khCUwVaI;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: simon.eu@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3198312f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 15 Jan 2025 00:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736928490; x=1737533290; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqkkAnlvPqkAb0UwH3IHeezVFsaEIfM4UjLI8mZ6WXg=;
        b=khCUwVaINuphjXq0hmwIco474rPLKADWwMe2Q8uIe5SM00gOU1jqe0NyJbgrl2y9KR
         dP9YeWH5+JZqyMc1ifZpYuoHBKzGpLStOYw+aKPGMSv+CpF9AqhVoxpqSBp6KUUCAoHi
         FWGh4wklPp+c331DcvnphrGF45W3jjb8rWSlMlUwSj3Z/3Qk9XqlqQ16D+9GGGLoR6UR
         SidbqcSaUSgfJK/Of7aucvcVbEURtVbA4wc5VecI4g4yxEskmzKeNltnkG1eqccuGn09
         kMiHuUMa9aThnEZ7z2lmiIy4WihwhU38gQzlfWSWnQKY2uAVBxb4Eilu6HQi0mLcKJRt
         Ys7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736928490; x=1737533290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqkkAnlvPqkAb0UwH3IHeezVFsaEIfM4UjLI8mZ6WXg=;
        b=vVSxt7b/34cVGe7yJi2QDNu02RK+IQo1NpcxGqCzcg4TFKmQWJRvi3710yatK/KR4j
         +woFU5asBsOytrVQRiNSkeRCz7kj+EHJZwg6DaJx+vUxiLlcoLWpBauqnLPhB9jN34TW
         o3veJcpONBQ3GsT8SenEDtKZ5aYajL0KzcEmkql4haCwmt6++kOmyJfvJ/SkWxEJnUi0
         hTRNkJB2CmCcF5KzlJw3c2wNiL5vySmYHa5RWgJ6d/LeTZJLTUk4tMp99lMKlX9vbJv+
         m7iws1HuPZdomF2xZW1Zy0qS+OWCjZ0hv7iBSxgOCr7ietuegRescpp8KKE7Iy5phjTl
         OOSg==
X-Gm-Message-State: AOJu0YzXIne/b0UPEDU8wBr0OZip4u2tcjHKWIsWCBNvhWZCbPt0g8Ch
	mwsn4f3ChPMWqnUqu0w5cW3rchIOj4oWTPgTRGfSMQ4GKauf426Qkufd5A==
X-Gm-Gg: ASbGnctkvmpxuaNQZLISrg/JMuG3D8mjh/qcM1oaoG9r+II7xsqjiEOZQXla4be5gzh
	NdmbkshCf4VVLOaYdigHdN2xnRbSDfprA11KH/SjmLZUdFowvVjC4MdZxkgiHEhIVm47MtNmDwh
	72B1B+hw/6iUHGqfBddd5uBIdZ3KUvPJugjOzn9O6IffS7iV8g+3dZGoCPpyG8+iogj/Yi8lGXp
	IkqpRZIn4E9OJcVw59ausm00MVUtkRrzcvPDVZx7s+HomYOcgYHoBM3iYrv
X-Google-Smtp-Source: AGHT+IFf9uPyFCGy2ZcldMtUqmp+kS+qTSB6aQuq1vlbBBg67aczWAa+AL5JiRXYXDlg+1fshkWb/A==
X-Received: by 2002:a05:6000:1847:b0:386:3825:2c3b with SMTP id ffacd0b85a97d-38a87304672mr22918797f8f.18.1736928489908;
        Wed, 15 Jan 2025 00:08:09 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm6457164f8f.43.2025.01.15.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:08:08 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: "Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
Date: Wed, 15 Jan 2025 09:07:58 +0100
Message-ID: <20250115080758.27000-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jan 2025 08:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6113

This patch describes how to use overrides for grub-efi-cfg because that
is otherwise only clear after reading the .bbclass file. It also adds
a description for GRUB_TITLE.
---
 documentation/ref-manual/classes.rst | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 761be7b545..460f94b232 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -987,10 +987,14 @@ introspection. This functionality is only enabled if the
 The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-specific functions for
 building bootable images.
 
-This class supports several variables:
+This class supports several variables.
+The label specific override names are ``grub_LABEL``.
+To specificy an override for the label ``mylabel``, the override name is ``grub_mylabel``,
+for example ``APPEND:grub_mylabel = my-appends``.
 
 -  :term:`INITRD`: Indicates list of filesystem images to
    concatenate and use as an initial RAM disk (initrd) (optional).
+   Can be specified for each ``LABEL``.
 
 -  :term:`ROOTFS`: Indicates a filesystem image to include
    as the root filesystem (optional).
@@ -1004,6 +1008,9 @@ This class supports several variables:
 -  :term:`APPEND`: An override list of append strings for
    each ``LABEL``.
 
+-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
+   Defaults to ``LABEL`` if it is not defined.
+
 -  :term:`GRUB_OPTS`: Additional options to add to the
    configuration (optional). Options are delimited using semi-colon
    characters (``;``).
@@ -1011,6 +1018,14 @@ This class supports several variables:
 -  :term:`GRUB_TIMEOUT`: Timeout before executing
    the default ``LABEL`` (optional).
 
+For the label ``factory``, a custom GRUB menu entry titled "Factory Install" with the additional parameter ``factory=yes``
+can be achieved as follows::
+
+  LABELS:append = "factory"
+  APPEND:grub_factory = "factory=yes"
+  GRUB_TITLE:grub_factory = "Factory Install"
+
+
 .. _ref-classes-gsettings:
 
 ``gsettings``
-- 
2.43.0


