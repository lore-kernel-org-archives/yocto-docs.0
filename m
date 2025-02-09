Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84B0C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:33:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.39778.1739143973681752909
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 15:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2B8nTsYI;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283dedso37164375e9.3
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 15:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739143972; x=1739748772; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te5YlT/KS4ltbg6hJaPPj4SJjgnJ87vbNLJfwZU+dFo=;
        b=2B8nTsYIRMhsVukOmmqPcwADLu5P0iS93DJJdasTYkx0W0fpOAvHfnpE1XAK2vE3mZ
         qGLUKALfRDemoFQsbVSp4uMBqMTyVJvbjZcEAzcm5YT0eqRP+p0prO9nFnr8ZSj78lQY
         Rr3826d91Pr7G4GX75zUEPFNvQDR3yiKYb7/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143972; x=1739748772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te5YlT/KS4ltbg6hJaPPj4SJjgnJ87vbNLJfwZU+dFo=;
        b=QTI5yoXu2bpxXzvvRn8BQmC0WHVYtqFGsNd7tRyDNIaUU1zatSTIrXi2L2cRu4+rt4
         /aDMrjUzg2GU+gn04Ie+QLj/cwae4h2uC60pYVXJ/Ndq2eNequ0aN33kIafVWrQrYReE
         TmD5dEVBYkgEp05Dh0CcM7I0lQ/yGkLI4u1uUaXq6GVfTwBiSfdkRiGN3Yz5LQzvov0h
         vsXjHOus45qlzKR6D36lIKj1O9LXL378vwLp6WTJ+n5ZXlbvfVpkt5gzTOXgvVZiv6Ox
         1JdYn94d6k1sRVS2Fi1+lBh+bjLqfAdlZ6POlQCoziCV/pc+rSmEGTIFh8cP4fYv8QhA
         Q3OQ==
X-Gm-Message-State: AOJu0YzFpnYH82lUX+/nWYplZGpPqNsqyzx8ZlzzYCKsVY6mYQU1xJQy
	pllx3EIjdda7HqpccfkQMH9G3bST6wszieJinFH2rUDpo/S7fi7zrVGClduLXy1+LA6a4J/aqQe
	n
X-Gm-Gg: ASbGncuJRaiqPH/bax93K/hhv8WZRbF5+xiz8rY/6k9Jvq1135socwk0rqUTXxaoNfi
	sMfQy3/GuzvkH5dJ3s8j8w0Od1KS8JOMSwoligzrjvptglh9k1gFS/EKeHwbJcUhVdDl4lBqQG+
	zMFepme08Louf+Vmg0uv0gZL4pdxL53ZfAre1k5nr3glGIx8x3tfQacRQdUVsQ7beaJHNwNaaqO
	W8TAIqWuMJBS4ARLXqlfkM6VIJVdqgbAbGK5sHnZ2Mb0Y26X4QaPyNKA2MSLpJB71gcS7eYPYNJ
	Vu+xk3pfaF7iqQ1OO2tHTuO82Rmt2nxEIQ8l53uvfN5Bn/lNZBL1gverKbLb41Sm7IJFeJCvcZc
	CJsLtB1IBXCD+BSEVicWTRg==
X-Google-Smtp-Source: AGHT+IFnSL3rBELhRBRoKsjOzxl6JCOu0UM7odwUePX1VnS64GiqtrLtzdPCCcNeXJXrtnrJwNnQZw==
X-Received: by 2002:a7b:c001:0:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-439250df455mr90971105e9.29.1739143971914;
        Sun, 09 Feb 2025 15:32:51 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm17027895e9.40.2025.02.09.15.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:32:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 4/4] release-notes-5.2: Add new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Mon, 10 Feb 2025 00:32:45 +0100
Message-Id: <20250209233245.1397155-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250209233245.1397155-1-yoann.congal@smile.fr>
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6316

From: Yoann Congal <yoann.congal@smile.fr>

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v2->v3: Antonin's Review:
* Add OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS ot release-notes-5.2
---
 documentation/migration-guides/release-notes-5.2.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index b0e538700..069e34be5 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -17,6 +17,9 @@ New Features / Enhancements in |yocto-ver|
    -  ``linux-firmware``: Add the :term:`FIRMWARE_COMPRESSION` variable which
       allows compression the firmwares provided by the ``linux-firmware`` recipe.
       Possible values are ``xz`` and ``zst``.
+   -  reproducibility: Add the :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      variable which enables a reproducibility test on a single recipe (without
+      the dependencies). See :doc:`/test-manual/reproducible-builds`.
 
 -  Kernel-related changes:
 

