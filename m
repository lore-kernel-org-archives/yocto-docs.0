Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03717E7718E
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 14:03:14 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.33680.1735048987595683657
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 06:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hj9NpRqT;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43635796b48so31810585e9.0
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 06:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735048986; x=1735653786; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0L7X1YHRJ7NW10dvgt07ZSFG0FSho7O/bbzeH/BfLI=;
        b=Hj9NpRqTSYCRdS6mkyrPxv3BOfU6i1MTi1bxDO6KnYFdTTImGtEyRScCrdjLWTB76p
         dtnDxyOyMq1FuGt+ZYWggWgDrikC5vMLu81kLePtBOmuoiOUoD1N44Rt5KdeDLgPmGzP
         wzKU6Wix1CTkumB2PlqSJMxspr9KZhFz2WyZ70c/RMLU1rZiOW18P21Yo1aTTb+GBT6k
         JniOBO+QxREy73AGYAgOrLTmpg/+zxKTzGrofr6Z1drpdltHJAL3i/G6OxieUymi5zuU
         MNzm2GoQv3+VOze3BGuDe9SyMrEpZ/JmgOMgCQxihIxTRzKf4x/v8/2gxUusbA/rpR8n
         5+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735048986; x=1735653786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0L7X1YHRJ7NW10dvgt07ZSFG0FSho7O/bbzeH/BfLI=;
        b=ngerXAxj7YsvEioNhp7OuBK0tdR7qsS///gLAZRW+RDAySZQBAxkF/WMGbJCJkoplJ
         G3UZ9c346vrBkd1d1X2OQa9+zAMD6AvTCEFkbGG3DkuOf41MZxmk8aAjRmcYrEVhBZtK
         cJHa3MAY65T/NtYQarOmM1/kG/Jyl1g1HwNI49Q0acQw2/J741CFyvymLePDpyTh/bUY
         4HsqUvo+BoLqGKDaAVHsndarQ/nEITN+6A85wRv4ywxfXpiITDRcnSI0DlrpSitAOOeL
         bj6y7gUA97Ylc23Q+HZKgKlcardsgXFq7eJw72bmqOL1jNGGr9hAr1L7U+iXwQWH9IKA
         GxcQ==
X-Gm-Message-State: AOJu0YwoF7WsmQ2eJzQz7pViwRVCfhFLeSrEEm28AKdYqxjilVYR7tfJ
	69rxBl8I2y3OKxAdNxiacGTNwV2X19F3m5QMbALoOjQ0SwctOtbx1/Zy8A==
X-Gm-Gg: ASbGncuPY+4oPLn1GPYwdARwILuDnsr+gXuCQXYNdx7WwooY9RgLCffsWm8m8QkktKJ
	Gxj65zmH9d+cT/oFEuBVz2bByssn7C44r5kGh2k7qIG8S35q3Wp9FnS5tPayxHXQDHYKHym63kG
	P/yLlTTntFrDkZ0j2oIftzTpGZUBON3E0A/93UyNGHC16TPNDwpS468HoTBOZViJhLC/qNREuph
	YjCUOq0+GLyhXT9tV8JrqLoXoSgQPq2e6dJJp69notyzDTGsNIyyURUIDb2132xGxOB50veNS4I
	jq72
X-Google-Smtp-Source: AGHT+IGqF2/CGnJcj0/+xcfqP4ZWb8IH6gaOZJRXJF+twKG1vfkzmxOcm84wFkvjjAuAiA8o//hmvg==
X-Received: by 2002:a7b:cc0f:0:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-4365c775154mr180876385e9.8.1735048985522;
        Tue, 24 Dec 2024 06:03:05 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847214sm14204033f8f.46.2024.12.24.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:03:04 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/3] migration-guides: systemd.bbclass do not add Also services for 5.2
Date: Tue, 24 Dec 2024 15:02:14 +0100
Message-ID: <20241224140251.24389-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224140251.24389-1-adrian.freihofer@siemens.com>
References: <20241224140251.24389-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 14:03:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6021

Covers the chagnes introduced by commit
https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../migration-guides/migration-5.2.rst        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index cb70e19da..2ae8e73a7 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -74,6 +74,25 @@ systemd changes
    As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
    :term:`PACKAGECONFIG` option as it is now implied by default.
 
+-  ``systemd.bbclass``: If a systemd service file had referred to other service
+   files by starting them as “Also”, the other service files were automatically added
+   to the ``FILES`` variable of the same package. Example: 
+
+   a.service contains:
+
+   .. code-block:: ini
+
+      [Install]
+      Also=b.service
+
+   If a.service is packed in package A, b.service is automatically packed
+   into package A as well. This happens even if b.service is explicitly
+   added to package B using FILES and SYSTEMD_SERVICE variables.
+
+   This prevents such services from being packaged into different packages.
+   Therefore, this automatic has been removed for service files (but not for socket files).
+   Now all service files must be explicitly added to ``FILES``.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
-- 
2.47.1


