Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.870.1606872226215854186
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 17:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: P2lLnWRK2T7xzRJtylYjbQJmVM7JDssKgZG2Z5HG4g3RJ1PcJpGOnCCVRtU/KMuaCg9OyJDnh8
 cIwurT0DvoJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="159991719"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="159991719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:23:44 -0800
IronPort-SDR: oIHsTgYefXZY1lZBednt8iryWRLdH9iWR4erPbvEM4Z/vK5nDnO9qNZGRXOE6Pd+nddKas9vwV
 LNv3JuoYx6Tg==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="549818529"
Received: from kshekara-mobl2.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.112.62])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:23:43 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [gatesgarth][PATCH 2/2] releases.rst: add gatesgarth to current releases
Date: Wed,  2 Dec 2020 09:23:30 +0800
Message-Id: <20201202012330.20273-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202012330.20273-1-anuj.mittal@intel.com>
References: <20201202012330.20273-1-anuj.mittal@intel.com>
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

