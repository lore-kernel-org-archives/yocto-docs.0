Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.821.1606872129807138039
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 17:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3CKr2nf/cRbB5RafL24YmNQt66SZATc1gX6NIcvWK0cDhYfA1Bqfwwxf4VdgWebn4LQj5OJCon
 Ga50GR0NNRgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152191588"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="152191588"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:22:08 -0800
IronPort-SDR: Q1R2OHqkFk43beMx60zWxv2rqM2qoILN8+ChHAXmjgtc7ZRZfMY6KbRbSGYN0nWCXy59isaTMU
 os/B1WaoN1PA==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="549818222"
Received: from kshekara-mobl2.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.112.62])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:22:06 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] releases.rst: add gatesgarth to current releases
Date: Wed,  2 Dec 2020 09:21:58 +0800
Message-Id: <20201202012158.19944-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/releases.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 9992f97d5..dbdc173a0 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -4,6 +4,12 @@
  Current Release Manuals
 =========================
 
+*******************************
+3.2 'gatesgarth' Release Series
+*******************************
+
+- :yocto_docs:`3.2 Documentation </3.2>`
+
 ****************************
 3.1 'dunfell' Release Series
 ****************************
-- 
2.28.0

