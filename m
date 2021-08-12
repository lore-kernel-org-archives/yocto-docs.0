Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.24232.1628784632871926681
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 09:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: tom.rini@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id kl2so3404631qvb.11
        for <docs@lists.yoctoproject.org>; Thu, 12 Aug 2021 09:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=FHRZ1ZFfi1NIbZtJURsvJQrf/XD/PaWUrCKYJ/1YYVE=;
        b=iwt0tAgKZ7IqlSg2ePmH7YV6njZ6kQ5O5YQzJoJvhhvFM1zYuWNlF5Gum9rOQzt5OP
         Bav8HZq4MPZM0vJr/iplLXZ0vjngvFDcLa6xKbOJebwZSOnbzHUq2YdMiWm0uQc0jQVV
         4sD03vXT40d6iLWvuXNATKtowcPGaspuN8t4MQDge9h2qAX959T0seR9KwsX67IqYJpk
         ajGE/V3v7iEHDGJUOjRfzqRkd1nvj6iF9VJPC74oVkl4X97uUilIIjBMPihh9EPoeOvf
         HPBmAGGAy53lHTtAcmYJy/PRajujVotJSHEOdOkCtyR0RYw5pSmYiZJDmd5M5LAmPhGX
         El2A==
X-Gm-Message-State: AOAM530+O6aLWTkWkkmUa+jdr7q10uLTmJ+YwIWl3du3lqn1A0ZyWjTP
	EvIU7mLgb9+pfY/nPRbKAFGgVa8p4Q5e
X-Google-Smtp-Source: ABdhPJynQS/iXkjR81TIPH0S4zwL3fjvBX5qK6fSoboDV93TAKoEc+KcBoFjOYPfs3amekHbzl0Ybw==
X-Received: by 2002:a0c:c441:: with SMTP id t1mr4558341qvi.25.1628784631524;
        Thu, 12 Aug 2021 09:10:31 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-04e3-07fe-0933-9252.res6.spectrum.com. [2603:6081:7b01:cbda:4e3:7fe:933:9252])
        by smtp.gmail.com with ESMTPSA id h2sm1549773qko.127.2021.08.12.09.10.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 09:10:30 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/3] common-tasks: Add a summary to the end of the bbappend example
Date: Thu, 12 Aug 2021 12:10:25 -0400
Message-Id: <20210812161027.580-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1

Try and make it clearer what the final result of this bbappend example
is.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 documentation/dev-manual/common-tasks.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 37077d72d451..2d8ef96e2600 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -545,6 +545,12 @@ important as it ensures that items in the list remain colon-separated.
    allow to add build options (e.g. ``systemd``). For these cases, your
    append file would not even use the :term:`FILESEXTRAPATHS` statement.
 
+The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
+``rpi`` will exist in the list of :term:`OVERRIDES`, the file
+``meta-raspberrypi/recipes-bsp/formfactor/formfactor/rpi/machconfig`` will be
+used during ``do_fetch`` and the test for a non-zero file size in
+``do_install`` will return true, and the file will be installed.
+
 Prioritizing Your Layer
 -----------------------
 
-- 
2.17.1

