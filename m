Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676FCE9A03E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 09:27:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8495.1771406813449992374
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 01:26:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Gk2Exvah;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3749608f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 18 Feb 2026 01:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771406812; x=1772011612; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+DcenFMWrYdXV2ZiAsZmgZ1XCAMjajDSuu8+QI7PXo=;
        b=Gk2Exvahp187O4RAmrsFDNGVgETuS0iAJopubF4t1HhxpcXoO4IkBqgkMKmZGxAjTN
         ghYnFC3EhShiWPY23YXOU/kApra8qlCBnKo898zy5c2VEffUMFKlrcu0ljepw377Hfao
         MoMZBxaUtDTiLuyj7bxdkxFZod92+gI/M1ShI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771406812; x=1772011612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+DcenFMWrYdXV2ZiAsZmgZ1XCAMjajDSuu8+QI7PXo=;
        b=uySZLwRR4uvhlv8+AnyBEBA3xspiuswFNOz2zl8kt2HZrDD46i2Oq6loOa6k0M7VFX
         aOuZFNOT0kMxb6zdHU9P4T0eUSRZKbjSYHG6gsgid0AUwP86ZB4XJSuwwaAG4HuA8MaB
         bLsG40IrkYCsFGoLqz2zh2Cr5/s2bRVBey9f57iuf2XxDJY3S30irXyn6kQOydkcVVW6
         pemHqy5j66l6gKKp9wRFcyS1uvEK+H6nDalLZGlFchH25c+PBoIZcXVuFFVqGvlHEquY
         E/u/ABAYe959i/J1ViyMafqpx0NJCD6hbycI+qogmDeVT0bqaaVWuRH06zzz8qTpdIOa
         LdEw==
X-Gm-Message-State: AOJu0YyYZKh/SfCCKsNeLCwjxk1cxAzq3HKNSWI4yazlYjydWCl+IQ5F
	wHSuEy05GJg+v04yq2DTuaaUeFDmJvM58nMR8M1WCzIqhiGCpWrZ9mpL1yowOHvlaVDvKrMXTuE
	kBFlh
X-Gm-Gg: AZuq6aIj+8Wjr38RAkGBem8/V2PuDm9nHwNwqVNGac2KVANMUvT9ZSI3o64jf3zjZvH
	PQ3lqM+qtaoWeQJBUA/PD2cB+55vpjVy0S1CiuimtvKTx9XfhrT7Qmko1A7xJpQaIhafEgmERfz
	S7eLHSzR+1pLEGGNuCL94PzypvwTimKiDggGKe7fVbWACBEyU/TdEgOSDWz0jPCtMm+aZsYJz7Q
	ItToOpfUKJoNhEqdXrlD4Mfyt90m/eu2NgtnpVSe+Lsg7hfDS/KYat7FowREw0s/cj4TPEBtNtO
	2k+NRXRqPFe7+jDz5CkufdZirzV5wUxk50R0HDwSI2l7bXZgtN/61bTpPvaUpyJblqatAqcnxdi
	dvXk+pCPlJfu7XzY0gdWZm6plg6lWUiCcw2a2ZkN6Yhqhjx/vUXjrO+rchMle/WLiQWKLmNagcr
	SP/c9t6YtKwhJZrnzfdFYEHch9+1euCeKQL7/Pq5A1SRMXSLUeghmtXPp2+7qiiCqBj/wJbJZhv
	RJLJpf8b7ivbNa4dY5kflexwz6pMr/G+Q==
X-Received: by 2002:a5d:5d12:0:b0:435:bbd7:18e1 with SMTP id ffacd0b85a97d-43796ab18d2mr27411588f8f.9.1771406811471;
        Wed, 18 Feb 2026 01:26:51 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac7csm36943805f8f.7.2026.02.18.01.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:26:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] ref-manual/system-requirements.rst: update untested distros
Date: Wed, 18 Feb 2026 10:26:32 +0100
Message-ID: <20260218092632.517998-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Feb 2026 09:27:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8947

From: Yoann Congal <yoann.congal@smile.fr>

Some distros were removed from the autobuilder 5 months ago:
* 070e6bf (config.py: Drop ubuntu2004 workers, 2025-10-01)
* 8238327 (config.py: ubuntu24010 was replaced with ubuntu2504, 2025-10-01)

Update their status in the supported distros list.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/ref-manual/system-requirements.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index ad7c70727a..44f054544b 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -71,10 +71,8 @@ supported on the following distributions:
 -  Fedora 41
 -  Rocky Linux 8
 -  Rocky Linux 9
--  Ubuntu 20.04 (LTS)
 -  Ubuntu 22.04 (LTS)
 -  Ubuntu 24.04 (LTS)
--  Ubuntu 24.10
 
 The following distribution versions are still tested, even though the
 organizations publishing them no longer make updates publicly available:
@@ -86,7 +84,6 @@ organizations publishing them no longer make updates publicly available:
 
 -  Fedora 39
 -  Fedora 40
--  Ubuntu 20.04 (LTS)
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
@@ -103,7 +100,9 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
 -  Fedora 38
 -  OpenSUSE Leap 15.4
 -  Ubuntu 18.04
+-  Ubuntu 20.04
 -  Ubuntu 23.04
+-  Ubuntu 24.10
 
 .. note::
 

