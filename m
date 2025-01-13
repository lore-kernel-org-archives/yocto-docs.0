Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA05C02186
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:37:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.32932.1736811471354905395
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 15:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9jyNEtq;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2499649f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 15:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811469; x=1737416269; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov2Ya6gYP+3Sl0IaRwWZLdaSL6ePcsVI9JVcLR0rRsY=;
        b=V9jyNEtqfBU9pwWHZ0ZamRyx0ebwYCa/OmH9sonxFlDR7Fe/1Q9nhGIjFBHrgS4LkW
         Y1WraWfRpFkYrH+Z99yMDSMV0t2pfimCdMUtY7T0Rv9vEM2Qa5iCpJ6ha1bHFrG0HaZ1
         nygGFP2N7/RSe1mqmO78FkjSPkYhahZwj8+nD3LOMUKy55oFuwicpEU9c5dJQsei3GCs
         3cf7G7a+kCDHrYjTL6JrhbtjDPyA2DgJeZbFWZhSAq9ki4/+BjuFRSEJv1VMfHoc59tc
         UVXhOTn1foluIEqUNJ2ZS6FwIDpITkqvoRrw/u+IPQf/Pf8qH4J3L3b8FEr0jKYjn1bz
         aAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811469; x=1737416269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ov2Ya6gYP+3Sl0IaRwWZLdaSL6ePcsVI9JVcLR0rRsY=;
        b=woTm/1PfWvaOxoVCYNjhvmO8uABXbZ7ZstcbL3HR/RxHeLa7LbZGiQtQjtJDPcPzfX
         bZudpWwcAcoxz7J3WWE1UByF5gE6JyrB8EYtIdSOWaJOQgpd0J70O8pNQ495fl8/rnyX
         hZKTOqcH6sFpdEwZPyJhjIUKhm4m4M2No1qixML2w8VasvTYasZGEYovMGv0+TueZfus
         XikrGH+inKLqBg2Ja/JLWltiIvArmxbQKAe/dJyuimX+lULs3BYit+/zlOzwz8XHtfGk
         GqjIEHpcDuLeeIxhaPpOntwica+oqYirjDs0pfJfV9Gr5mzijDB2EwsXv4SxDWulEQBF
         3mkQ==
X-Gm-Message-State: AOJu0YxR4a9z0yK8vMskw/8OkdM+yOvUUQloEdqmFaogT2ZLkHdBbHiA
	H5p0/66UKJSt+p0B9qxRTjKL5dzbfM/BLSerxMlbhPP0DnHOtzLQ5cTYy7kH
X-Gm-Gg: ASbGncvGNIiXBEv/L/0Rp1CxEcx9OFvKr+QsfzTQZDCdxJaJXnhvE0lOXpAIzALMWhp
	23Dyy1UR8N+oH2oWss1C8fgUipcQ69AoEtEe9r24F/VZIC4qOQmadpiOpJmV6B8DYq1iW8e2FQ+
	4n2Uctz1azqbrzBEsC2hPrjFpL4k7ODVNTZ4ZeaXl++IjyGttLACRSe4f+1NnPZi9m7rF4My9AF
	I1zF0ABhWtsM28Dz0mcIkbfMOYbZHyIY+KfoAnu0Tda2KzmTFKqQu+Ahh03WOdEX6rI+ngBYB53
	evw=
X-Google-Smtp-Source: AGHT+IHBzqYVlx4+3GBEeZbhy9lJKHM7irxmXKZyE2XE9WWDBuvlaAUHh6ZrJ6e3Cmihwlja/+HqWw==
X-Received: by 2002:a05:6000:1849:b0:386:2ebe:7ae2 with SMTP id ffacd0b85a97d-38a8733df9emr22436857f8f.45.1736811469475;
        Mon, 13 Jan 2025 15:37:49 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm2898727f8f.43.2025.01.13.15.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:37:49 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 1/3] migration-guides: systemd.bbclass do not add Also services for 5.2
Date: Tue, 14 Jan 2025 00:31:16 +0100
Message-ID: <20250113233736.4181201-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
References: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 23:37:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6095

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Covers the chagnes introduced by commit
https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../migration-guides/migration-5.2.rst        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index cb70e19da0c..0e0566fa6f3 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -74,6 +74,26 @@ systemd changes
    As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
    :term:`PACKAGECONFIG` option as it is now implied by default.
 
+-  ``systemd.bbclass``: If a systemd ``service`` file had referred to other service
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
+   If ``a.service`` is packaged in package ``A``, ``b.service`` is automatically
+   packaged into package ``A`` as well. This happens even if ``b.service`` is
+   explicitly added to package B using :term:`FILES` and :term:`SYSTEMD_SERVICE`
+   variables.
+   This prevents such services from being packaged into different packages.
+   Therefore, this automatic behavior has been removed for service files (but
+   not for socket files).
+   Now all service files must be explicitly added to :term:`FILES`.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
-- 
2.47.1


