Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5155.1794036884477825417
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 23:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ypDsmgGX;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: saeednourian82@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2460935e9.0
        for <docs@lists.yoctoproject.org>; Fri, 06 Nov 2026 23:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794036883; x=1794641683; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rl/NILLfH6Flc7QJPsmShcvdGrmhGcZKpeBKB4uuF5w=;
        b=ypDsmgGXBcoF61pv36EEIwYLUxUvI6DDtcWJh9L0l2XVcCOw8YgHdI98+DkkEjlhGN
         gvT5s/EiRm8THYlxTuXiPUcpUVX2piAJI1RPTUI3ZvTcCiZEyDZH+IUUAs4PUdVNhufi
         RSuz7Uir9XMw3e3OFSxBboTvYo0Ftto0NLyKoH9kaViz3jxtXyP7cQxZHN5bf1aBqJll
         BxJW/567BL5EXAUytRZeViYseScPnS7KorBXNn3jGT7lTdFSndioGve3iE+VK8m6ipRQ
         xxTSAkc7OxCPBxRKaqIDIvZ1/8KfmDixidaG63a61tBG0bxsIhwTjU2rGiKzvfMzbY9d
         z2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036883; x=1794641683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rl/NILLfH6Flc7QJPsmShcvdGrmhGcZKpeBKB4uuF5w=;
        b=mHU7ymuqat96ahFem2ZYxSF8lrFU+T6NblWrlQCIYAjnEA9WRMdXWfWHEZa0TH8UDN
         0G5P7vm2JHjMGwQkUChU4U5uRvNBsPqpr1p5la93BYu00DIKtjGhEJwPVDSeV7FJSgmo
         QeoUaHvP5WQ3Nf2NRt7FnXolr3D7aS2j24Kd30IdefxNprdU1D3WvP2MiDAMIS+Qu2t/
         ZTRd3BLMJDzgj/v8y1x+UC4H0sZFSqMR314vGCqKBtW3ZX758VlxH4wuVc13VOOm1ZR7
         Dxt1cb6q9j4dbX0GvVAXqsTZg6jMEfYHuCd8Xfnxy3ge1vHBZe53MVJLsp3EIOS9DeP/
         sM1g==
X-Gm-Message-State: APuU4Z/5SI879Oi+yy1Vq/t7Ydj0juHeLYwiSaxiXwLqIDNit0/uAIeg
	kXSiLHRTTgxJHRFL/2qx2yxq/sQwCGK8E16x11lhl9baYT6uHqZrXBuBOhaBUBgYcBf9Qz0bhW0
	=
X-Gm-Gg: AYBFou3LknrVmbdLweWezyAgB8dHVdcD3FuZ1krlW/YwHOiAbFnyNyNK3t2fjX/vken
	Kqv6ZVAh1Ln94XOXjjS9HspD+Z9SzVHfLlnWm4CgqdYmdjiLhHfPjt+a+KHjclMnYdYagat5e7/
	EO08a0flFJ0TS7/scFraanxqp4zJOGF/UVusIClWCo2ydyemo3mocMzF43e+K/6R7mzayDFXFrZ
	HrpJ9bNmBuKfwrNX4rsR7wcVaF9N9HL4+ZMwQ1Ttblw5hX7a5hIc+piJQKRjXOFa88CLdniphSS
	UdEyl1RY9icBR+iBk4FrGjGxPWwt4ZzEW3GphpdIRrq1vCtDP5W7MHU5U5nSzCPQIN/2LCDEsjd
	p6Zz+1Mv/0qMKl3pimymvHMKKwoKsDt1fdgairo5RiycouYL68YI4Y0y2zd51U5U/kTBmxCAGz9
	uifrC/PteOFVNUnmU5kJGcxRugRSecW+xuFROpsOCUIvHovzW/7f1votJKcjn0Zjq7r9/KLbdGg
	NqTaQi9weJ3/ztuNAzAa0PI1CF2RpFHVQ1uk8QDR7Fy2LhoEzkZ5SXJinafnxK5rtde1+wGUDfi
	feyeLqg1F793CNpi88jCBaKSSiK+hSLY41jvXhuvjIEG/9v/8TNzfjMVkxSSpivApkOnioDTmA=
	=
X-Received: by 2002:a05:600c:8b08:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b82056738emr20823615e9.17.1794036882610;
        Fri, 06 Nov 2026 23:34:42 -0800 (PST)
Return-Path: <saeednourian82@gmail.com>
Received: from saeedvft-ubuntu.. ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm56975595e9.1.2026.11.06.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:34:42 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH] docs-wide: remove trailing whitespace
Date: Sat,  7 Nov 2026 11:04:37 +0330
Message-ID: <20261107073437.1570845-1-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Sat, 07 Nov 2026 07:34:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10776
Content-Type: text/plain; charset="utf-8"

Remove the trailing whitespace reported by "make sphinx-lint" in
bsp-manual/bsp.rst and dev-manual/layers.rst.

Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
---
 documentation/bsp-manual/bsp.rst    | 2 +-
 documentation/dev-manual/layers.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-manual/bsp.rst b/documentation/bsp-manual/bsp.rst
index 93af13f78..9d9e19f3d 100644
--- a/documentation/bsp-manual/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -233,7 +233,7 @@ section.
    .. note::
 
       Alternatively, you can source the ``init-build-env`` file provided by
-      :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>` 
+      :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
 
 Example Filesystem Layout
 =========================
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 5c8bf32b4..5da222693 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -131,7 +131,7 @@ Follow these general steps to create your layer without using tools:
          compatible with. For example: "&DISTRO_NAME_NO_CAP;".
 
          This variable is a good way to indicate if a particular layer is
-         current. 
+         current.
 
    -  A ``recipes-example`` subdirectory that itself contains a
       subdirectory named ``example``, which contains an ``example.bb``
-- 
2.43.0

