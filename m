Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25367D19523
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 22:28:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33763.1769466497679356923
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 14:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=F/JbnXHX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QLW2Bq4101085
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:16 GMT
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93g3w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71d3ac508so4734424eec.0
        for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 14:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769466496; x=1770071296; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY2krERVNMW1rY9Sl0iRg3yaPXKyr9CUfjCuYN8uong=;
        b=F/JbnXHXHCt4ew2DSxR9JRVEOEHDYHYPCCPC/j4q1TF4OA9eobAYk7HOLE/r49wdFm
         0K3wum1uAA1bg2sSZ0Coj43z/vsffZ3SNILynpJ9iLXZB1PlbBnI4jUQgjXVdtzVvCuz
         S29jJvU46ZqMejuV33XtqQu2LTaFKeoy6SNFsd4X8HzN0YHMpiUzo1N4mqfPDkg136lL
         PRWJ6J6ezotRRjC6WqlSwsu0iC20Ane8IFU5BdFIrcyR+k5q9lIsNr/ttUwaNmdE2Y/+
         wV2SzArlIZCCzK+gPUCCN0VZ6Paldykq64xDVMR1VWKb9ZAJwgPcHvWTZGENrPJR9oYK
         xKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769466496; x=1770071296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dY2krERVNMW1rY9Sl0iRg3yaPXKyr9CUfjCuYN8uong=;
        b=drdPLNxb+xhZhDunpNnFGQ4E5gPwVV7BBOqn1+P7ywNxZ5uR2/Ab4pu6MFNaKEbOyO
         SbVvqvAaSC7x1xNuhe0OtTgdG4h9q81fnEWC7kriti8dmS/ZH3gRLE/Pe9RQFxGVvpPi
         SSh/DBx9+M9hE8yA9K15TPkHa7W5VMEdlx6MkDUbBBSruuZXYgXwdcr3Ocj9CUNUkxvJ
         l24YDpxMELFU1QS0It89i939FSiHIRs8ehjwqLFHxy0tsrgu9BQobjMKXQZr3voqTyck
         qilJtvEg6lcAd94OZUGyjEiYi9Mdrm/PYz9iuZ7MrwXM2dGTM/nZox5evMM2s6J0jSek
         9NfQ==
X-Gm-Message-State: AOJu0YxdV3pyqdWi9IXVb3TQRvhIL8OP6Tyx7vAhsUCQqPI81LCx/4AQ
	hHbEqa65oqSyOzcnYBc/LuTpie08IK0mnfz0+DH167jm2P7Cgto73mWONLWBMMV7N76XnnAmPsl
	s8RsfNNVsRmcMh6z3K29VK4m2qPhDRCk2mVvaEEaPeBCg8zmj8U4zcan/Ibbgp6cL
X-Gm-Gg: AZuq6aIMujUDugfJB8lWLpfBE+ZxhT0/FhM2QSozJ+YF5yRWuX7+cxeAS9tdpN6gImo
	bS6jBIrRA+49Dk2gwH+WMismaUW6lyyjkUXv+lOHGIOJ/qhblrUknpkr8+BBbr01wuDcjenvSlt
	pjV9hurtiIm8Q+O7MAlmZsfQ1rd8s4d2b2gQShdKOviN3YhVHiN4wXk/RjXYbIhg32EOKJEfS+x
	LRm88UDkFsuOoe2iOU6pur9/mPOw6hhDgqhnmhdi1sCdUL4dkretzrY4ptwUfBFhwBSNfIJhL/D
	wBg0OscEb6tC//jh2c/iqiulSKJzePVM3yfRdVP/doAjFG08UDxs0qKDx8C3ApsmETZ45eNlUft
	dlrMXWcMv4AeEPxjp4Lw2P1WLplGHHTdaOQv9ucO003ZT4ZdEo6pLqWYY1AWqxYfHhDAJ1AnWX2
	GpXA==
X-Received: by 2002:a05:7300:7fa7:b0:2ae:5f28:eafc with SMTP id 5a478bee46e88-2b76451ac6bmr3218204eec.27.1769466495751;
        Mon, 26 Jan 2026 14:28:15 -0800 (PST)
X-Received: by 2002:a05:7300:7fa7:b0:2ae:5f28:eafc with SMTP id 5a478bee46e88-2b76451ac6bmr3218186eec.27.1769466495337;
        Mon, 26 Jan 2026 14:28:15 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6b6227sm15057543eec.8.2026.01.26.14.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:28:14 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH 5/5] docs: Fix sources as required
Date: Mon, 26 Jan 2026 19:27:43 -0300
Message-Id: <20260126222743.411405-5-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126222743.411405-1-daiane.angolini@foundries.io>
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE5MiBTYWx0ZWRfX7XY2rgViLxDq
 zVidvMoK90DbqicRdGyHOCVs1t7FtwGavAL4Zh+9R/ahD/4VxwhVflkKFq5abH943bObf+3xNmP
 s5aujg9UUD1ATXUP/8b2EuX/zIRUhpQ19DAG04XXb3gAUmkfGrE4aN0YATiXNf1JGETMt4QFaVR
 Poi6lb0c68RITcwg42Rb7RpVFr6N+Wmg9E8wh1gx+3U9lnAjCmSrrYXW0RIBzqmQDT/7VuCQGWr
 FhhvJGvWR4NWISK4Yj5VQvvdsMK9egjHXeZ7Eui4SP3Ab9aMVdFdr282NRzwrrALN6ToP4BudDZ
 tR5QN9ujIAsoNMNn42qIWZ7XQYZOwVrKAR9pjXUefrxalTIh2r+9J4cPINLehbEMSfbSG2aubM7
 Z7IAL7fi8stDI4Khajky1ofVTYN+0kfwMoyJwBPzpHXMqjTsqWcqIpAz2U4rJjeiIW1oikTiU+4
 14WZYKBY16+bcUYzRAQ==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6977ea80 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CihtY_vhn8dth2W4YvEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: FWnay23XEIhxM3PsGfTSr5IK0oH51Gm0
X-Proofpoint-GUID: FWnay23XEIhxM3PsGfTSr5IK0oH51Gm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8657

If sources is empty, nothing happens. So let's just not say it's
optional, and let's say the minimum is bitbake source code.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../bitbake-user-manual-environment-setup.rst               | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index 700e02216..5d6bcbea1 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -671,8 +671,10 @@ They contain the following sections:
           "description": "OpenEmbedded - 'nodistro' basic configuration"
       }
 
--  ``sources`` (*optional*): sources, such as git repositories that should be provided
-   under ``layers/`` directory of a :term:`Setup`.
+-  ``sources``: sources, such as git repositories that should be provided
+   under ``layers/`` directory of a :term:`Setup`. Although the list of sources
+   can be very flexible, at least BitBake should be cloned to generate a
+   :term:`Setup`.
 
    Example:
 
-- 
2.34.1


