Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725B6E7719C
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 22:20:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.5636.1736461231201167649
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 14:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lkCpV8Ps;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385d7f19f20so724875f8f.1
        for <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 14:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736461229; x=1737066029; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8W1bbBRcz5pHeUF4Kb6cURlBP1HLhDglUZnBzUj/ksw=;
        b=lkCpV8PsFMrosIyFjZ06D8faK9aDFHeBydvX1LW1bI/k2WUs4/dm7ykrp1T9M1SN93
         y9SpJ4VQAWbe0knum52EPy6MgScFQGKH9yqu0pYRoaCm9dSDCsDLck/uZyc1jqOfU+AH
         VT1GTdwF+8+sJvPPwfX7aY+Qto3wSh3XvTWYyZiYDM+tvVMc54cbx1tHA0D60pqcswz3
         Xk47WeO6dKhdSyMNS0w5wq6e/7I56GqBWcu/EdPU71Cyp92XrDWdSE8DH2ZlgAUQ7/Od
         2P8shKksHczsFyChe/CiO2ozlLOLX44lu32MM7odu5eHfU1i1V0wPHI2ycQKLDu7mFMd
         Xp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736461229; x=1737066029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8W1bbBRcz5pHeUF4Kb6cURlBP1HLhDglUZnBzUj/ksw=;
        b=GzwJ49AOG3iVw9fgaNcnWjaJvi5UiNV2mCxJu7NA4Ej1zc3En/AGF3n1D0fJ3Qwtq5
         4P8UnkRXcLTIB8jJnCA4Kc76BuyFbNTJX4CRwHVpvIrIPxMfLv4/HG9Gz490aXFt1JBJ
         Eb7KjOAkPYNQiLixKvCKUMtEXb0Jf1a3mrdASMeM6TLOaIepEEAcNOnXB+WLiTu5kY7V
         DwZx/LWEiBIJddDVCFYyu7H8b/u01SLMqJ7guTnDKqhJzhifHWniQo1RN1uJIH/vpBPq
         l9QMZLb1F40JSl0dC4mIO7XAd8xn44h4XNeaNAKBHgtnkb1Q6PKw2wRKGdQG3O4ejdIB
         dbLw==
X-Gm-Message-State: AOJu0Yz7cdiREsC6yDPA2CYdht1Y+BtbXUsilyumaaLIjY6EsENXCNbV
	LA6VCA3/AMT8KgrQ7q1TlTTG7H2GQbiupIaIOCvifnn3TvBOn1iZKJ4kYQ==
X-Gm-Gg: ASbGncscjuAXtJckr2i9kWKiLPSbkF2RmCo+03V2Pk/d62Qy+IVxwR81NxqA4bWFJoy
	Z+sxGlSEfkFJMY49g2SRkTn83nhKU9Czl8d4TRWT9H50GF75w89RXwyROCb2uOtPPOyEZOdEMAl
	e3AgzHLZLLlqG9KKiBJ5ft0Du9vW4+MWn+W7rJ4c/TUkB4pPEoCl5no60S3CIzr/T7tO58UNbcr
	89ipJv3q7K7WYHQKVY6u0Rop2KG+RGcuUS0mGOOABww7cOcO+lzcmeTAvahCqtQUaAslgBXA0a7
	XOjs
X-Google-Smtp-Source: AGHT+IELhzyU2dvrurn8gFyfodCCT5TJO/x6ZCDn6deHLvBJPLb5Ry8uHmz0u02ywPC69j8vPDTYjw==
X-Received: by 2002:a05:6000:401e:b0:38a:4184:151c with SMTP id ffacd0b85a97d-38a8730ad01mr7440830f8f.27.1736461229248;
        Thu, 09 Jan 2025 14:20:29 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1dc6sm2853265f8f.96.2025.01.09.14.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 14:20:28 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/3] migration-guides: systemd.bbclass do not add Also services for 5.2
Date: Thu,  9 Jan 2025 23:17:19 +0100
Message-ID: <20250109222015.12658-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109222015.12658-1-adrian.freihofer@siemens.com>
References: <20250109222015.12658-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 22:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6076

Covers the chagnes introduced by commit
https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../migration-guides/migration-5.2.rst        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index cb70e19da..b18ae30d9 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -74,6 +74,25 @@ systemd changes
    As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
    :term:`PACKAGECONFIG` option as it is now implied by default.
 
+-  ``systemd.bbclass``: If a systemd service file had referred to other service
+   files by starting them as
+   `Also <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Also=>`__,
+   the other service files were automatically added to the :term:`FILES` variable of
+   the same package. Example: 
+
+   a.service contains::
+
+      [Install]
+      Also=b.service
+
+   If a.service is packaged in package A, b.service is automatically packaged
+   into package A as well. This happens even if b.service is explicitly added
+   to package B using FILES and :term:`SYSTEMD_SERVICE` variables.
+   This prevents such services from being packaged into different packages.
+   Therefore, this automatic behavior has been removed for service files (but
+   not for socket files).
+   Now all service files must be explicitly added to :term:`FILES`.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
-- 
2.47.1


