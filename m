Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C74C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 20:08:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.4068.1736885317529680820
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 12:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9Xr5/Yq;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so11578945e9.2
        for <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 12:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736885316; x=1737490116; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6i+wH0F9MBv3NZItj1PrRI9KGuJh6s6QcggZrMYJH4U=;
        b=K9Xr5/YqJdrmz4QR7j+ZPUiAJ8A5j8+YKj4rLd2QvBFgVYXyg/IcXNeIbWLNgCnq6L
         PQaOa+8/NDjoGNvtCUM60/bL0WFfEXzC4Ig8dxGsjx3rn0A62MjJeUMk7nY0HVSs32zO
         oMVVMZF1VC3VEQW8U5/kkwTNbXGtsbjHPYJtXoPDsrgMDZj2RMJziT9oJo+tiEYHSQuk
         rw+rvNp+RUwk5bul5vk40TK2LxST1N+yzET1lK+OWrNgNyOq/f1wzSfSubOeRsI4z9D0
         ow7E6qUpwupkKgXtJdzdk6plAfTDC5q5TCgGcqztSuFHsv0lKh94TL4hcd1+IeV3rFIg
         Q8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885316; x=1737490116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i+wH0F9MBv3NZItj1PrRI9KGuJh6s6QcggZrMYJH4U=;
        b=XQAS6dEdmNui2ZDM4oTnpLbaGjBJR0kR0YSPkCNW1rZ4exR0WNbF77SPABruRfVEwg
         ubipI3iHSstF+K/cMRbzcI1dtWykBD9LYMF6DCXq1h6L7Cf409VpATUhKXPQLldmT4p7
         w4kNdffuSTAHJG+/+ptpuMwy6rRlCYPtqivOSjfKC5TIEEQqA10vF5f5qVDGnVy1XXga
         5oGUDo9hCJ/xq8ad+1ffc0IW8pmERcCBXLVjUXjI6ECqQgCW8/kZ5AhN5JQERJK5q6d5
         YeWPiZTmvpt5CWwNq6iRfaDUj51oLda/HTPApu0+3rbRnBhyaL2oUYH7LkN6c3O/2ykV
         +7xw==
X-Gm-Message-State: AOJu0YzwLd2BCJgbKbiVQT00NCMZY5gVQqSqYj05UushQ7Wu5O2W8Rw4
	nuVFalzsDYhcGoF8Ei+tioo8XaWfpboG6aciJ/6nHgWD1o4H8JubSpumF016
X-Gm-Gg: ASbGnctvqpogjib5QsNWXFETG3s5iK86lnLiiYTw+LPq3mI4yxJi5cp0D1uYE/qYFNy
	WDccSWUiQZB/vF5LnX89Eh8bmXRUYfN6F+JtyGA5iZIGwRjheebMWJS8KBB8VyyCY/77U2/lWJi
	XmEL8lHG1uiCn200VYTDzcL3Ab7Gy8X+O3KwKqCOUgnU1eR/5Yej5azolyZxsfjyWAVm71J7mYE
	LScKnMZFwfh75pcDNc5ZcaBPC8HXACdzuZx3ziBXSySZEW9ncfoGa2vFmBMT3B0Hl63UIGI5+gr
	dfg=
X-Google-Smtp-Source: AGHT+IEblOKw0cHMSt15YWq2tZfgFeOY6IUNssiysia/NCn542E+nJ0anvseItAhSnJL5/v0UxC01A==
X-Received: by 2002:a05:6000:1f8f:b0:386:857:cc54 with SMTP id ffacd0b85a97d-38a872fc43cmr21661448f8f.9.1736885315497;
        Tue, 14 Jan 2025 12:08:35 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c76esm15463787f8f.47.2025.01.14.12.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:08:34 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 1/4] migration-guides: systemd.bbclass do not add Also services for 5.2
Date: Tue, 14 Jan 2025 21:07:11 +0100
Message-ID: <20250114200734.4191354-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 20:08:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6107

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Covers the changes introduced by commit
https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/migration-5.2.rst        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index cb70e19da0c..c317587ee5a 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -74,6 +74,26 @@ systemd changes
    As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
    :term:`PACKAGECONFIG` option as it is now implied by default.
 
+-  ``systemd.bbclass``: If a ``systemd`` service file had referred to other service
+   files by starting them via
+   `Also <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Also=>`__,
+   the other service files were automatically added to the :term:`FILES` variable of
+   the same package. Example: 
+
+   a.service contains::
+
+      [Install]
+      Also=b.service
+
+   If ``a.service`` is packaged in package ``A``, ``b.service`` is automatically
+   packaged into package ``A`` as well. This happens even if ``b.service`` is
+   explicitly added to package ``B`` using :term:`FILES` and
+   :term:`SYSTEMD_SERVICE` variables.
+   This prevents such services from being packaged into different packages.
+   Therefore, this automatic behavior has been removed for service files (but
+   not for socket files).
+   Now all service files must be explicitly added to :term:`FILES`.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
-- 
2.47.1


