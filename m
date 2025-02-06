Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D9CC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:16:14 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.38294.1738840565335081019
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 03:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=XRVLtada;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516BExXE011331
	for <docs@lists.yoctoproject.org>; Thu, 6 Feb 2025 11:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=Y80yl
	X3l10HT/0qUXZWlkhSrJQJ81LZAJ1tdeW5NzF8=; b=XRVLtaday7kA6hhtslsDM
	eBxlB8byoyCQxl4ZQ9LCbkWijNca6fgNtcWffD7y/C3Bv4YF+0bgf5zeHY24uVbj
	VtcFnCMGifmfuYWfyIxsp5RznZhm8mRw4LRYxhp4wItXs7fCpzIs1uOpBxvEhFiV
	oIWhaozSA+mSYCJfdycOQYVsG8mnDZHznnqQ0XaAHlnbR5nA0zq7rTK4MZ4LBU1+
	FEYFnbCr/xM10jXG1Gu0glqiDdAT6AQ/uop7yheNEFY/VwP+H/VU+NInSfRmoW/y
	r30usOuku/757O58fpPqeud2IBpMSKdxrf2jB7G0lNld1YLBLzhzsw2By4GK9Ru8
	Q==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mv18r0me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 11:16:03 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 12:16:02 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 12:16:02 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 12:16:02 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <docs@lists.yoctoproject.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH] ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE
Date: Thu, 6 Feb 2025 12:15:59 +0100
Message-ID: <20250206111559.296944-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ySKADvBgLNOkQdJqWE3nfIKTGyXPiqrN
X-Proofpoint-ORIG-GUID: ySKADvBgLNOkQdJqWE3nfIKTGyXPiqrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 11:16:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6257

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47d4e814f..c80696b64 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3984,6 +3984,9 @@ system and gives an overview of their function and contents.
 
          IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
+   :term:`IMAGE_ROOTFS_MAXSIZE`
+       Defines the maximum size in Kbytes for the generated image.
+
    :term:`IMAGE_ROOTFS_SIZE`
       Defines the size in Kbytes for the generated image. The OpenEmbedded
       build system determines the final size for the generated image using
-- 
2.48.1


