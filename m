Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.870.1606872226215854186
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 17:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FbXtIAcze/QnuOzzZEsMQIa+mYvpU3CfRtInagA6Vfx+MjZzUYZkNZh+SQQX4XzggZUIzyNcCt
 njXrK3ErOB0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="159991717"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="159991717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:23:43 -0800
IronPort-SDR: Wl/+C1SU9aFin/6y7jRrMQCOsWAfvpfg+/LvvQlbHwSkNJJvLSBLXn6RrNjO2dwwZlVqsObe3d
 gNrCDtBBRLHQ==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="549818527"
Received: from kshekara-mobl2.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.112.62])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:23:41 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [gatesgarth][PATCH 1/2] sphinx: releases: add link to 3.1.3
Date: Wed,  2 Dec 2020 09:23:29 +0800
Message-Id: <20201202012330.20273-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf395d0af044f6e9826a8235b760b2d285602b26)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/releases.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 536c3a6d2..9992f97d5 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -11,6 +11,7 @@
 - :yocto_docs:`3.1 Documentation </3.1>`
 - :yocto_docs:`3.1.1 Documentation </3.1.1>`
 - :yocto_docs:`3.1.2 Documentation </3.1.2>`
+- :yocto_docs:`3.1.3 Documentation </3.1.3>`
 
 ==========================
  Previous Release Manuals
-- 
2.28.0

