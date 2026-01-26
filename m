Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5BED1952A
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 22:28:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33760.1769466494772015251
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 14:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=WJ/DODxs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgUwW2942978
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:14 GMT
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2682p8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so23873887eec.0
        for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 14:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769466493; x=1770071293; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFCEUUgWDqmsNldatAZmr/rljlDaOIPSpMPKTpXcvJA=;
        b=WJ/DODxsX3jxi2YcPZiJhtpYjHsv9liWl3gcOJuoACV5xN6R6MPchh1MUshYDFExzl
         RDxkS1ZAmtAFPamrVIYhASbHshxUIIARbONA+dXjGtIynmeEaFYamKNZrLsco6S1W7Yl
         lrEy1P1vDHbk3OZyKLa1AVbU/0QqVIh9VaTEQv+64vxdUWa1Iq5fk9ENv4mjcl01b0LN
         29FEePxnKnUpkRanJHUjMf6uFRqkGnhYuN27cTHCuHdoR7CEcHqciWoRukesUGu32Rcz
         QHboKW1LU79CxPDU6ewbUyPzuIcL4JpXVbikOOawjFSHGWASWNheQQpTt5c//eOm7srm
         jx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769466493; x=1770071293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFCEUUgWDqmsNldatAZmr/rljlDaOIPSpMPKTpXcvJA=;
        b=O8Bm1mHkCvpIqgvyQUS2kqxFKv9lGqE4xa3qlMbVpTW42X/l01WwrOuvzRPaZWyKbz
         wKCZ7NiP5YcagiHIxxcy+10yc/R5SlHJZrXQYAyBdDFB0mbO1nWjOAeiqde1EDRXqENQ
         x1JQO33zdYyE9+KOFERqI27fg9c5+lxPefuVdsoXODIKCv3VRQx88gH5HkrnuMbQhzhk
         Ca/aMSzIJCF7F/2gHtJI7USZ4knq4kpS0fgpV4EjeDZuoW0nE3C5E0/og6r6lvPOXs2f
         rDITz/waYYlebh2aHtz0BqUpTa5mpFRzowDEqV2Ua7Wb14tjgGMwHX6LMwMJ/lct3Yoi
         Tviw==
X-Gm-Message-State: AOJu0Yz5LKrisrUwtgcbWEpqsr26qODuQV3gOqipBc64XWDQrehj8xDZ
	+JYa+t3iSS0qorU3YhKLG4bRfBzdm14DsX2gc5CulKu4/bGN9+z37E8Lhe44wWgxgnOmMqlesDC
	AHMGfJtae3Cus/Xb+SxNBWcD7gsWaoOjt+nvngMUd8H3eeYvcOFz/hBnwPRPbf4dmpMq6/MZp
X-Gm-Gg: AZuq6aL9004kXXVd0JNjwAQmV2joDAldnBagtzj4g0/6nKiXmy+LhvzdFwP9GGqvOIB
	/SYgix+qa+HOfPVQCpH9XmowobLAlhSeOz7cMgR3zjMYKJd+MQ0rQ+H0KQOSqgpYaTqCcloYphJ
	e3GYN6lNVUhHiONVa43VEfTk/p2LmzMvGxi3Bue9M8ItDWxrWq8UiSMY5tMyHn2W+ixgH7skTIa
	dZgXq4CedQT+p+0P65+Ce57A0SNrBS+HhYu7SG55ljdZY7VKM18p/zY6FghADlXwvj9ssrdWfKj
	AP23LJvw9ihq+17W1EIrtHURrpzJZTrPgGJAE4jr5yZpP7wI15FozajqGxLFczWYlwVp6j3NYcB
	sLa2syoNYZZKgP0jMDFFUXrfY1vtx3U1YnXNSFX0DbdFniehvYdspW1PKD2Pu5ofFgoUv04jyVn
	UvNA==
X-Received: by 2002:a05:7300:cd9a:b0:2ae:5ab4:e932 with SMTP id 5a478bee46e88-2b764628d6bmr3226024eec.43.1769466493493;
        Mon, 26 Jan 2026 14:28:13 -0800 (PST)
X-Received: by 2002:a05:7300:cd9a:b0:2ae:5ab4:e932 with SMTP id 5a478bee46e88-2b764628d6bmr3226012eec.43.1769466493101;
        Mon, 26 Jan 2026 14:28:13 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6b6227sm15057543eec.8.2026.01.26.14.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:28:12 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH 4/5] doc: Add the term Variant
Date: Mon, 26 Jan 2026 19:27:42 -0300
Message-Id: <20260126222743.411405-4-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126222743.411405-1-daiane.angolini@foundries.io>
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6977ea7e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KQc11KMpeXEtGPe8wygA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE5MiBTYWx0ZWRfX8KKR8CMkvCkI
 G0X0dgmZRpjsMNyQhNtAFBHiWMZpg1qbczlFiq402U7xS6RcanB3+KwPeUbvbWyFI7FDadW5cwa
 kUe6Ws8yG4GBgnKE9LSo46zmGfuXM8Cn2/JeAchIkd4XXJRyfz042NxM2YWchEHCy8hil8Qo5bh
 WDTVgtO0LIc1gfgnGrZQvcyhDxh7iY7bqWZWscMjW8biN5B8OB1g2nvph/T25TUhuw8ZOGTxziz
 3BwsHPYqYWh47GPhEoObguWGge7xzgcaHXb6qLXAI1pVvPk51Z5kC7873UmFKndciJMz0+Hv4D5
 n0A6ULg2wHiGbdy6ad2OuJAeEFZVPslC2PWxPTC9S6o3mo5o4Yyr/koblm+iPpSl0uTopg4L6Ov
 CknrncBex/KyHdo7JE6Mybb34tJDxOLaMevJpNOAtskkPKw/uixLZTzzJWDNSRY1gbmSfCqBc1J
 gHg/4ENcvMBHIj0nBOw==
X-Proofpoint-ORIG-GUID: 3A9wZigcNSIK9FhRhEVx3QvAVHf7lLYI
X-Proofpoint-GUID: 3A9wZigcNSIK9FhRhEVx3QvAVHf7lLYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8656

It also add a description for the term based on the concept that a
variant is a fragment or a set of fragments.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../bitbake-user-manual-environment-setup.rst          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index e316ead56..700e02216 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -212,6 +212,16 @@ The following components are involved to create the content of these directories
       It is also a Git repository, that contains a history of the setup instance
       and updates made to it via :ref:`ref-bbsetup-command-update`.
 
+   :term:`Variant`
+      A Variant is a fragment or a set of fragments grouped under a name that
+      makes sense for a project. It is a nested configuration within a
+      :term:`BitBake Setup Template`.
+
+      A :term:`BitBake Setup Template` can contain multiple variants. Users
+      select among them during the :ref:`ref-bbsetup-command-init` command to
+      customize the :term:`Setup`. Variants enable scaling configurations by
+      sharing common parameters in a parent while differing in specific settings.
+
    :term:`Registry`
       A configuration registry is a place where one or more :term:`BitBake
       Setup Templates <BitBake Setup Template>` are stored.
-- 
2.34.1


