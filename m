Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.6937.1581405370780616617
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 23:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=dGRDWIHS;
 spf=neutral (domain: iki.fi, ip: 66.111.4.29, mailfrom: tanuk@iki.fi)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C429C214CE
	for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2020 02:16:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 11 Feb 2020 02:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=i0G0BVSNnC1t872At
	84EyFoGXBBTv4zdDuFt4owf3xM=; b=dGRDWIHS6iNY+aOwCCFj8whGGjpGNFsHQ
	/NfjGRYwj5s0IHPELbaoDpP5oIdDsegzRpUTulx8HEC149Qi/YVZYCZ0L6yajhNl
	a+sdYdV8WQr18paQ5TL3usY0cdx/oO80Rk8unmTiHpOd7ACsYcUoZ+fMQFJGjevZ
	Al9BXHQCfXQRRM+dRwTuced/AlRWWLg0tHXwt3+/MZbvUacn2MXnqrz5EX33RLq6
	NR5EdC+89YeUtcqVs9xJU4cAmHSMPPqfXiF2AK6lxPfB6PNaPnIYQR8VXktP5fsm
	b/gaL5ZIpgMPYuMyNz5lU+ErtU/lf/64GD1QKlG7GVj+ae0PGdQDA==
X-ME-Sender: <xms:uVRCXgYAAEL_whazpD_5NlqGum2h9p-6FfXikW6CEe-hZgo3i1R3hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedvgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhf
    iheqnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepudelie
    drvdeggedrudeluddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:uVRCXhYGISz3pX__8Ozex8Iff0MXH9e2121iG4i8oYBFYu5CVeZWPQ>
    <xmx:uVRCXolRGFoc1837nfSxm8yuKSBfyr7FByP0SzH8fJrGkfMJLejkIw>
    <xmx:uVRCXlwWwlUvmbd3fRKLA2dLm4ALlbmxDkUWIShX8Z-vsG7BEmlPIQ>
    <xmx:uVRCXkbTJnxdg5XgP15mCkDjs6EIP5WBXFs7LLu3Rtc3NDagEPaovA>
Received: from localhost.localdomain (unknown [196.244.191.106])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3D86D328005E
	for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2020 02:16:09 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] README: A couple of updates due to recent changes
Date: Tue, 11 Feb 2020 09:15:25 +0200
Message-Id: <20200211071524.40834-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---

v2: Added Signed-off-by.

 README | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/README b/README
index 62c2a3ffb..6a7f3abe6 100644
--- a/README
+++ b/README
@@ -11,15 +11,13 @@ Where to Send Patches
 =====================
 
 When sending single patches, please using something like:
-'git send-email -1 --to docs@lists.yoctoproject.org --subject-prefix=yocto-docs][PATCH'
+'git send-email -1 --to docs@lists.yoctoproject.org
 
-These values can be set as defaults for this repository:
+The To header can be set as default for this repository:
 
 $ git config sendemail.to docs@lists.yoctoproject.org
-$ git config format.subjectPrefix yocto-docs][PATCH
 
 Now you can just do 'git send-email origin/master' to send all local patches.
 
 Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
 Mailing list: docs@lists.yoctoproject.org
-Please cc: Scott Rifenbark <srifenbark@gmail.com> on changes.
-- 
2.20.1

