Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6548D1AD23
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 08:11:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18333.1729066267759266831
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 01:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0019814858=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G4agvu016496
	for <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 01:11:07 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3988bhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 01:11:07 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 01:11:06 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 01:11:06 -0700
From: <liezhi.yang@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] release-notes-5.0.rst: NO_OUTPUT -> NO_COLOR
Date: Wed, 16 Oct 2024 01:11:06 -0700
Message-ID: <20241016081106.1917900-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6jzw3_lbVFDBOBZ63oye642-5x-PIpbY
X-Authority-Analysis: v=2.4 cv=F7EFdbhN c=1 sm=1 tr=0 ts=670f751b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=RShPybgiAAAA:8 a=BW9eQpOUXT_OX68Q8iwA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=YLGRqFcrAwIahUk1acIU:22
X-Proofpoint-GUID: 6jzw3_lbVFDBOBZ63oye642-5x-PIpbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_06,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=787 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410160053
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 08:11:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5495

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 800ba20a2..2bf78c633 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -217,7 +217,7 @@ New Features / Enhancements in 5.0
       state directory (i.e., ``/run``).
 
    -  Allow to disable colored text output through the
-      `NO_OUTPUT <https://no-color.org/>`__ environment variable.
+      `NO_COLOR <https://no-color.org/>`__ environment variable.
 
    -  ``git-make-shallow`` script: add support for Git's ``safe.bareRepository=explicit``
       configuration setting.
-- 
2.25.1


