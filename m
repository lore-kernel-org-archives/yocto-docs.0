Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0FDC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:18:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.18075.1738325885629173327
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 04:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/YOA90I;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: simon.eu@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38634c35129so1494307f8f.3
        for <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 04:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738325883; x=1738930683; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAw9MoO4ZWLvFbIK8rRakuXxcTsImH7+MjVzy7WyAmo=;
        b=l/YOA90IJYCGn2rVwWCo0FBR7sjdhtqtBt1yv5JvywF6ZP4tfMIJspBfBjg5tycbcj
         B1x/iwZ/RNIvTP7FYtUZb8MspjU6iASh4ag3sTuCNWT3/WA3xNWiBN75QsJuacYILDX/
         0SV3ZEMD6i2wdo8h/R1ySG6vvxucY3uzge9EuWpJJY5KKXjVlx/bwFVhG39giOI3AA6g
         KmCFuYQ1hVzYPSoCY4jTRw776bE1APSb78bcGd5S2pfDVqOxm/i4V9aT0nRKgudxysSp
         NoIMg4VfFPh2aEKycm0v2pXazjmaYt8imeWZxNvdXP7NWgetP02rqMMtazKTV7LVymXo
         zfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738325883; x=1738930683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAw9MoO4ZWLvFbIK8rRakuXxcTsImH7+MjVzy7WyAmo=;
        b=l3YIkvLJQ60sQJC/HK/2gvvctSJM2i1ZQTCiqOREsrckRjHpKXi+EBxnsThD0Elx6p
         bnvnjK7Q3fuYvO1p0b2nllAUWpBthRbQxMvhcKuHhHW2uKJD+OCh55uNUygwXbni+X0S
         D71o8JqZTVYR8fOrqUhqEURIeRLz5NGdEN9ucu3a+2N0bFDHZDvMg1Xjsa4I4Oc61kLj
         DpqeO195UCl9Xb7wIYLDuotusymX1Ib74OuhfHGbXjXTkhEHhBS1Kz67HFb8/iiEO3yM
         2UcgvN4nBb1fd0d5nbRgfN8xsoI8UDnzWnjbNzZGBZC0dEEk28p9f4geZ9GYhqJZGxit
         A55Q==
X-Gm-Message-State: AOJu0YwC68usCKdx+lMyJLn60SyPIht77eEIBdd4KOGC0z+y8MT3sFI6
	BfBLPKkwFaxjx+NG6m4g345G5O2sDoPO9k1Je1lDJmVvsKOJqlkh+t3ukA==
X-Gm-Gg: ASbGncsR78DaPecwsXMWnw14GMtLpHgi+PB5RxDhLDB9ryKR9gHpX32fzWhe9WE1Wrw
	hTyIQKJWEn0r7uHfrLV9DWikO2wV2OhzWGTphcKU0jqAXL2jJJmRtDDa8bIsQLt2GuC8mRfosFK
	T56STGyMYtBf7YP7rt0pNQXIE3VoQszipa8SCfM4/dLb9xDKWQiYKwdcPy3k6PN/z3Q+M5DETTw
	coRSK+TNHTj5poM4UWwsHBm9yOYn8gHwLOr0kzAqbu6Gem9pkeryU/IhSaT9yqC3UBXQWBSfgqS
	aoNiw57u0OeJYvCVn9I=
X-Google-Smtp-Source: AGHT+IG4AvIKQN2RL2uGemnx6srLqCtVeJJg2w7ECr/gVWlEvExxhNIw2yYhTa7E8XQ9VsXXqN54tw==
X-Received: by 2002:a05:6000:178d:b0:38a:41a3:ac4 with SMTP id ffacd0b85a97d-38c520b88a0mr9663579f8f.45.1738325883000;
        Fri, 31 Jan 2025 04:18:03 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm4599304f8f.98.2025.01.31.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 04:18:02 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	"Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH v4] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
Date: Fri, 31 Jan 2025 13:17:05 +0100
Message-ID: <20250131121705.88535-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 12:18:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6229

This patch describes how to use overrides for grub-efi-cfg because that
is otherwise only clear after reading the .bbclass file. It also adds
a description for GRUB_TITLE.

Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
---
 documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
 documentation/ref-manual/variables.rst |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 761be7b545..8bc60e24aa 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -991,6 +991,7 @@ This class supports several variables:
 
 -  :term:`INITRD`: Indicates list of filesystem images to
    concatenate and use as an initial RAM disk (initrd) (optional).
+   Can be specified for each ``LABEL``.
 
 -  :term:`ROOTFS`: Indicates a filesystem image to include
    as the root filesystem (optional).
@@ -1004,6 +1005,9 @@ This class supports several variables:
 -  :term:`APPEND`: An override list of append strings for
    each ``LABEL``.
 
+-  :term:`GRUB_TITLE`: A custom title for each ``LABEL``. If a label does not
+   have a custom title, the label is used as title for the GRUB menu entry.
+
 -  :term:`GRUB_OPTS`: Additional options to add to the
    configuration (optional). Options are delimited using semi-colon
    characters (``;``).
@@ -1011,6 +1015,18 @@ This class supports several variables:
 -  :term:`GRUB_TIMEOUT`: Timeout before executing
    the default ``LABEL`` (optional).
 
+Each ``LABEL`` defined in the :term:`LABELS` variable creates a GRUB boot
+entry, and some variables can be defined individually per ``LABEL``. The label
+specific override names are defined as ``grub_LABEL``.
+
+For example, for a label ``factory``, the override name would be
+``grub_factory``. A custom GRUB menu entry titled "Factory Install" with the
+additional parameter ``factory=yes`` can be achieved as follows::
+
+   LABELS:append = " factory"
+   APPEND:grub_factory = "factory=yes"
+   GRUB_TITLE:grub_factory = "Factory Install"
+
 .. _ref-classes-gsettings:
 
 ``gsettings``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0c5c7aab97..4eb11abede 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3320,6 +3320,11 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-grub-efi` class for more information
       on how this variable is used.
 
+   :term:`GRUB_TITLE`
+      Specifies custom titles for GRUB labels defined in  :term:`LABELS`. See
+      the :ref:`ref-classes-grub-efi` class for more information on how this
+      variable is used.
+
    :term:`GTKIMMODULES_PACKAGES`
       When inheriting the :ref:`ref-classes-gtk-immodules-cache` class,
       this variable specifies the packages that contain the GTK+ input
-- 
2.43.0


