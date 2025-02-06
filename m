Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF32C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 13:20:25 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.40770.1738848016770720457
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 05:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=WmSXLQi9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516BKVeB020710
	for <docs@lists.yoctoproject.org>; Thu, 6 Feb 2025 13:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=v9dCh
	6hbLTaU21JALCdGqq2y4zst4SSMzNJvCRorPKM=; b=WmSXLQi9Rimdl2K9sZ86X
	UURrFYEyQ9XLNM5LKgY0RgVlBAoqqBApvwiUtS3AuoFOPBE4ZwG73+rgrlEEaK7K
	WaQJlMrVnRnXfFc63ZXgtTIv8FOBXQb/9LeBe3aD1+Gd5YoDjYg1yt/8OYc89JwN
	QSPz1pMCJ9kin5XemO+XK4JHNfG8H8rNtULgTGifkWu5Aof9JQy/330axankIp4A
	iBDXIdBfJbG9RvW3/35/UaKYyGThglu0ZqYBIZuBDJOFBi8kJ9QqFCyZxDJzoMVw
	OEwSwNsB1L33hZzAd5boyw9lIPyxLUeBdNHcDFM2YwlRbyLmURpSE1zjI6eZyVu5
	g==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mv18rs6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:20:14 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 14:20:14 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 14:20:13 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <docs@lists.yoctoproject.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH] ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE
Date: Thu, 6 Feb 2025 14:20:12 +0100
Message-ID: <20250206132012.359126-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3ZI_UiEORuW2kJqGtzBRaqxQBFuYtwvv
X-Proofpoint-ORIG-GUID: 3ZI_UiEORuW2kJqGtzBRaqxQBFuYtwvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6261

This patch adds the missing documentation of variable IMAGE_ROOTFS_MAXSIZE
to the reference manual.

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


