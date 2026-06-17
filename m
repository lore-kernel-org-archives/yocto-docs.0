Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3FECD98F4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:41:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9499.1781678492290954153
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 23:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gp/yKYyu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0628fa2e08=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H4wdpD887882;
	Wed, 17 Jun 2026 06:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=TNJ7iYomKqrFL5q6ZNgIfUiOxOAXSH6sKzjbB1s9u4g=; b=
	Gp/yKYyul23owhmJONPGwkOwwcUrJpnBYFJK5SJOezI9KRjUa84wagz5PPQr9Pp2
	BUMTu1c4B9+9ttmMDRS8M1jonzgcd7/q9K0MNWd+LuC2FaiBSL5PwxR0g/bwxe6p
	oGApQ4wz+owYrYUfUGiDcw5xmVkDPl/z6VUtx1VQtPrLoZINtyienVIDuNxkRIpG
	CEN4Vp34YObaRfwwB+RGsNIxPi14f3wcWGboDQfN+5TEKUFQcSSPb2GNfP9fKijU
	bglwAyJ1sjxzMzX6vsmRTat0WR11OmP+Zu5H9+8ckaeUZhCeFnsFGuKnOXyOpex3
	S30RU6FlFwsFxbh8QwQMhA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc0jn5-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 06:41:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/cPZAnFYDvkORSwtqjV9hmqH8qHkOSbwFVBXNDMEgTjD6vprDqO4PfHUMc3aiZMkBXUExnO9UAM2lZbzyJW4v4DOFwXwC4nkrSOCE7pNmLL1CRknoPE4w36FAC2WD/8LhSFmBS+xM14k6t3qx2Q7HklJWzoxcmCoI14lpp0+7zDAIG4PtnvC+lU9PPYgwueC3pHA5hpfdsOVR5HLfszGDW0Gkwq5ZUpeStmCYzok2ARRJXJ4igsrJYQqWKwgjqubCVBre80+9zuev0F/Gf0Ft9gCKvJR4xDn3tbqjbLq6lkpD0yziY/CvRlfnL7ZMXZjqwJwZtWsKgYcg4Wo/P4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNJ7iYomKqrFL5q6ZNgIfUiOxOAXSH6sKzjbB1s9u4g=;
 b=eI4aBvkv916sJEi+b0SsZYCTouqhXBVLTcj49iyVamgMLxwt8DVUlKic7vmwg08FWBNebwvhoV9CR9aGqj9Q8cPfGhbrgFLMFJm+jbiLh1+krVGaMP2c+Gp26G49DaaGctjKt67FU+yAzAi8nNiVIsAy68BjRBqFI+5NUR2GX74FInwJOsXYkP5mwbU/oa4GT5O3pchOvg0Siftkj7+QtIB4FmFXhUqZxP/GJ/zCo7Zb2RqZFZnh4crmg889/m7NDyEsnG3qdmIgMPx8/V4q190Kp1I25a97LrH5hVcmydZhqJhTTZ2tvwjRVYLX+N+ieu1ElDQzeYAAW2tN2m1YnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:41:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 06:41:25 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, paul@pbarker.dev, Randy.MacLeod@windriver.com,
        antonin.godard@bootlin.com
Subject: [docs][PATCH V3 3/3] ref-manual/release-process.rst: add patch acceptance policies and stable point release upgrades
Date: Tue, 16 Jun 2026 23:41:15 -0700
Message-ID: <20260617064116.2672321-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617064116.2672321-1-Qi.Chen@windriver.com>
References: <20260617064116.2672321-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: f99d3e93-2ebd-48bc-475f-08decc3b7371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003|5023799004|38350700014;
X-Microsoft-Antispam-Message-Info: 
	XOGx/M6wwDYv0HIhRTVPjbaKIHxdcd9k/+Zic9poeM4up4xnSaK5p1h10GGMGuVHffNSVnWLMToDuYe+4F03GLnm10K1SumbBHPrHRwrvmAC/h4eyM2TDHkzKr9kUoQGZKj7UBnb2ABleiF8QWTrh4Ubssg+NixNXgW/ODBSgizBwdKPoCfWdDiAi4cEvhaRlbkBUEfcH2P8gY2m9axr15z9KhyO1kDJl0hC5Q6zg8d4iHMrQRQQglnMcVwovtRpH2ZKvgqzev8bim62MjwTYikeINlReEkV/H/f9F6C4MmqD+jDME9UfX+5AgRmBts6Nns3L5fPkEDjeqYgHbFI32wfp9XJTQ6Jz1GjMFD2kjG8mt7G4iAlIJKZUQ5SbzvqjPIflDQiQKCTrebiY/P4vxbESo6P4ImoC43vAkIolHaLIPCPImZWKzh0soRV/Wgd3kS4Z2weT4ZNsOP1YJ/btIxnRvOYpZm+ngIlFj7lTcQHxnLyJEFzQqESiTWawvM6Nx7Sr7TV3Tt4kbuwdlT1++MQBhG/jPo0KlybY2ex9BANeDXPlt5ltKTvb1n7MDfIwiNpD9btCQLzjQpytPGwf0bZiWCsRCddomLKO+CyKwar4XYrotvGwb8PXEb2HT7k+St0RqLwCx/41fCoFBc61bL0QpKPjvAVhFwjsR5jo7TBGE4R0mMX5m3dftO1iM4x3h3NNd+788zgNW3Qb0DiUtGAb5gODbkXWB9vVJZXVfMPY+MaSgvUeYKgqgYVpQ2X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(5023799004)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QZtrXrhivckZ5axWCiUVmjyMY0xyuCKQ1xx9rolkGqfFYvxiBbNIj6Az6fnJ?=
 =?us-ascii?Q?DSKNUDyMb8CHRrFtzVYIo75TTjx1vnC4hAbYa/kwt6YuANMHHIhOP1voedIo?=
 =?us-ascii?Q?QHwpPtN1ewcIq85oTMlhF0JsuFdyaZWyjXcM4MxcBiHLEPX2/fGkaXeBKU9O?=
 =?us-ascii?Q?DoQq8B35/XGsh8xwuprvrENe9A0KPcTZvHg++UF151ch6smRDVKWu7GUBotb?=
 =?us-ascii?Q?uQbJja++RkDk+Td9jAEQxKMDMCn8R91LVrjly0cV0UC/7ZoMrqup1IWngTXJ?=
 =?us-ascii?Q?H+fbjqnGPixPtqtyzb6NRziiZEKAUVdDIytf8/XgstPFEi46LDBA5Q82g/e0?=
 =?us-ascii?Q?y5lUNKeyp4yuIGPbsM9/JchyO1CZRkd6S7xQVlhEEX8ltL5nR+13Qv1Gf85p?=
 =?us-ascii?Q?AZxj8la3upRN+c1KSSzPOyQC6m0UotjooDxubKg/D4x+MteUO25GnzwWWkfX?=
 =?us-ascii?Q?X2LRflqg+sRpEur7PEb62iIv0D3kQ3lmTtmtOPkD9RtNi4mpvNM9m4kcGhLR?=
 =?us-ascii?Q?6Qc+70ZFkg3FY1Iqz3iVlbvquHCCNvoWAvyx3yc4B+t8BhV3ZIpPouIuT3d8?=
 =?us-ascii?Q?+9lrIja2XKTD689e6AcFhJiz6oHQhsBGbGVCMo3vNfl7XJCBpSCA7NGKclQa?=
 =?us-ascii?Q?N4XB4t62DmcKwJTsguZEFMV0QBnBQLWl9IHR/C38R5L099KyV4uZSMztTDMx?=
 =?us-ascii?Q?z6LH0LEBIq6QgT78A0hQi/IZJukVwanIQNAqtR0o5sqecE5p8WCWw/TNcQ5e?=
 =?us-ascii?Q?mUPbMCS51Wp8QZTapsh9fR39hW8VTxdXGftFDwOUlBHXVeQLFWclLlVk4Xmf?=
 =?us-ascii?Q?gGluXdfr6ddXpaQAZeSw6X+Ir9W7swoJ7dSiKGKfOBG+pPywtYZjsjPz3IfR?=
 =?us-ascii?Q?UJsUIsqIICJj2QepnRN5S5NgG2nlp9doCFsjU42Gw9Xf5gqovypcNcGWuz5s?=
 =?us-ascii?Q?YdrlwgojSxntWIZn5sh4ukin8GzdAMnXQ4U02V/qqLszAkqBkCDOFX78r8J5?=
 =?us-ascii?Q?4RzmkmBJ4W04iWfPIxK3TUZ+k8lXhsONq6e57vwjhzmGZ2b4tqnvgaDDeTMA?=
 =?us-ascii?Q?Uxtj901tFEvsGpmvcJ2dtxk/puJKGFMF5KTUrXo/g6uhxbz3sQICUorZSePZ?=
 =?us-ascii?Q?g7M9Zp3hpwQgSBCoVoRh3IIhuB6AuriDlE7lWxrZVxMsTge422DcsDp9XMTu?=
 =?us-ascii?Q?j6W+womIbAhZKHXg3NmlN4kE30kE2nGgmENn+ixF7bmDlpVxkCUYZFSFLERb?=
 =?us-ascii?Q?mMewIOINM3+ZrV9RJ9KGrUKh8SxRMojBvKGBDShFd8AX/BsOseqsdLgDRzpj?=
 =?us-ascii?Q?W5CZ7DgxqplGMhMPGhm9Oh9yytiBKrWqWRtitVEo9zd0gWsUlrRCsqxtbmaw?=
 =?us-ascii?Q?IF9mYM8vPDvHp37GNeocJhmwglg9xlGx0OZTotTVDn42F9pq3bayLK9XIaum?=
 =?us-ascii?Q?88RQJciYWRl2wJfAIk0sHpTqmEOfXFTQPnPaeeXctcuzXUMz5Myalxu0b3fG?=
 =?us-ascii?Q?Ny0aP84c3nETAgzduh9WIYG7eV0dbDAxMsbfiWBniRUkNY3u03YCk1gv4tgv?=
 =?us-ascii?Q?8i4L+q1D93sYoVRddp1b0UJoZ1XEP2n8U+Uj8L5u2RLgmKUQ7EKYpcEYCp+b?=
 =?us-ascii?Q?f4cnUvJjl7/WNxw+2XpWC9JV/AbhWfBZZGdC5k8Ez0reAUNrH5mq+Imo34qs?=
 =?us-ascii?Q?8OsDNEo0oe222oJ/CTWd6ZfqjwiqFYpRqZDN5XNugaeqmVI5aMII9hHKz1SZ?=
 =?us-ascii?Q?jV3GMwZdlA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	lsG3mRAmJ65734MXh5jVFm0aBAm8NaTHr/1LxFOspaXFyH6cC1deGSVMU46kddcE3sHtMIk1nH4WjgSNDy5wKp1WzTDm6xx4+N1daTH197zARdCsD7PEu/1YCXLf4xrGkPrggjf7uV3/+qUkLo2CI+t4+EFPd6Bv/LttQFl4nrfYMDn1xxKp4TMR39k48Wn4XaI+rc0TtMlTxE5QN9wil04S8dDEm1eTsQucFoyBwWgq6vw9IormWT+i/2COq6kLh8814vJhB3PDi1slujncIf42Cg/kPAnvPaiEWxqiZWL6K+Jlb7fxgV/Y1c67g82J3+r1+XJ3qMdJE1AL+Ua2YQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99d3e93-2ebd-48bc-475f-08decc3b7371
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:24.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9mu6U5wdyGJshzcG1YS81a/Q9kRA3r4aQfwzvrOXsdjhJ+TORpcGJjEdw1cav+DElvArwAMvKyuI6kz4+Hwsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA2MCBTYWx0ZWRfX5difaicjAXm3
 p9fuXW/DBdGXNudRVkjmUbuOQ2R56sHaYr8ruedVnRgGej9DVMoL7R7vqgKoT8roKudgvpTq2LD
 TUBQgmDVrJKw9zsICvCVVwjYpPDzW+ZHderk3Qpl6ETlPTx1KFke
X-Proofpoint-GUID: njnD4cBe1XOFQUneXmZgqfy3MGnUndgi
X-Proofpoint-ORIG-GUID: njnD4cBe1XOFQUneXmZgqfy3MGnUndgi
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a324199 cx=c_pps
 a=+4AL93Ollhzyglb1kYk7Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=QpPr8eI-N4npw5oLFEMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA2MCBTYWx0ZWRfXxuoGiMTWzU/0
 VG6kdLRZoKSpgLK2BlYnf08E9CgjbmFg4yyJ3pP7gsKijGtV/G/dxNc/QII/QDSzjji+TpVs6sR
 BmcLDHkIWkeWmOx0wTPTfB5gu1H6sF2bE/r5X7h3xMH9LBsXjz5Llyr5HSEGtj0nX/LFNjEwGOt
 MOg0d3meN1k0B5oLKhcsmTCq/JGLl+K7l4vJC3QPFDw2/3ctJ3D9NBG6dTncmvdFa3CPBu4Az3H
 2B8d+k79e5LgP5RhRXuj1bHDAhPunY94OEP4sHYwZT9sISljE6zicNQqYOcENJggi+eHIcx8AJh
 BfFOl/fnOgjugYwPosFNHpNzJlcBVqP69AU1EIg4zTqrzgmuY6g0C8CFWo3a1VicqE0EGgSUWTn
 8Ftya6KG4b3b5neptSs/+zKKSQLYLnIjC7Kqctzfss0/colycMDpyChLxXoWp2IvVdZmQ5CFT5j
 KaIlrxJoqRpDHf/ATnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170060
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 06:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9767

From: Chen Qi <Qi.Chen@windriver.com>

Document patch acceptance policies and stable point release upgrades,
including criteria for qualifying upstreams and how stable release
regexes constrain version checks.

AI-Generated: kiro-cli

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 documentation/ref-manual/release-process.rst | 119 +++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index a55187c14..3026b54cc 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -127,6 +127,125 @@ stable release.
    exception to this policy occurs when there is a strong reason such as
    the fix happens to also be the preferred upstream approach.
 
+.. _ref-stable-lts-patch-acceptance-policies:
+
+Stable/LTS Patch Acceptance Policies
+=====================================
+
+All changes must have already been accepted into the current master release
+and any other release still within its stable support window.
+
+**Acceptable:**
+
+-  Security and CVE fixes
+-  Fixes for bugs
+-  Version updates which follow an upstream stable series or LTS that aligns with
+   the original release (based on compatibility). See
+   :ref:`ref-manual/release-process:stable point release upgrades` for details.
+
+.. note::
+
+   Once :term:`UPSTREAM_STABLE_RELEASE_REGEX` has been accepted for a recipe,
+   version upgrades matching the accepted pattern are considered acceptable
+   by default (with the usual ability to reject if upstream fails to follow
+   their own stable guidelines).
+
+**Potentially acceptable:**
+
+-  Fixes so the codebase works with newly released distros, e.g.
+   :ref:`ref-classes-uninative` tarball updates or build fixes for new GCC
+
+**Unacceptable:**
+
+-  General version upgrades
+-  New features
+-  ABI/API breakage
+-  Metadata improvements and refactoring, unless this is a dependency of a
+   required fix
+
+.. note::
+
+   Exceptions to these rules must be approved by the TSC.
+
+.. _ref-stable-point-release-upgrades:
+
+Stable Point Release Upgrades
+=============================
+
+Some upstream projects maintain stable branches that only collect bug fixes
+and security patches --- similar to the Yocto Project's own stable release
+policy. For recipes tracking such upstreams, it is possible to perform
+*stable point release upgrades* (e.g. upgrading from 1.0.2 to 1.0.3) rather
+than only accepting backported patches. This is the mechanism behind the
+"acceptable: version updates which follow an upstream stable series" policy above.
+
+Criteria for Qualifying Upstreams
+---------------------------------
+
+Setting :term:`UPSTREAM_STABLE_RELEASE_REGEX` for a recipe means that certain
+version upgrades can be confidently treated as stable point upgrades under
+OpenEmbedded's criteria. The
+:ref:`Automated Upgrade Helper (AUH) <dev-manual/upgrading-recipes:Using the Auto Upgrade Helper (AUH)>`
+will then automatically send patches to upgrade recipes with this variable
+set during stable releases.
+
+.. note::
+
+   Patches to upgrade recipes without this variable may still be submitted
+   for stable branches, but the barrier for acceptance is high. The commit
+   message needs to justify that the version upgrade follows our stable
+   branch policy or that there is an exceptional reason for taking the
+   upgrade.
+
+A recipe may have :term:`UPSTREAM_STABLE_RELEASE_REGEX` set based on the
+following criteria:
+
+1. **Upstream stable branches exist** --- the upstream project maintains
+   branches named with a stable version component, and there is evidence
+   that these branches only collect bug-fix and security-fix changes
+   (no new features or ABI/API breakage). For example, util-linux version
+   ``2.41.3`` has three parts in its version and upstream has branches like
+   ``stable/v2.41`` with two parts. This demonstrates that bumps in the
+   third part (e.g. ``2.41.3`` to ``2.41.4``) are stable point releases.
+   Similarly, systemd maintains ``stable/v259-stable``.
+
+2. **Upstream maintainer confirmation** --- the upstream project's maintainer
+   explicitly confirms that a bump in a certain part of the version is
+   bug-fix only.
+
+3. **Clear historical or common-sense evidence** --- the project's change
+   history clearly shows that a certain class of version bump is bug-fix
+   only, or it is widely understood convention. For example, openssh's
+   ``p`` suffix increments (``10.2p1`` to ``10.2p2``) and kmod's patch-level
+   bumps are historically bug-fix only releases.
+
+.. note::
+
+   Patches to set :term:`UPSTREAM_STABLE_RELEASE_REGEX` are sent against the
+   master branch first and follow the normal review process. Once accepted on
+   master they may be backported to stable release branches. Exceptions may be
+   made when necessary, e.g. setting :term:`UPSTREAM_STABLE_RELEASE_REGEX` on
+   a stable branch for a recipe which has since been removed on master.
+
+How Stable Release Regexes Work
+-------------------------------
+
+The stable point upgrade mechanism uses a *filter regex* to constrain the
+upstream version check so that only versions within the same stable series
+are considered. When a recipe sets :term:`UPSTREAM_STABLE_RELEASE_REGEX`, the
+version-checking infrastructure in BitBake's fetchers (git, wget, crate)
+applies that regex to filter discovered upstream versions. Only versions
+matching the regex are considered as upgrade candidates.
+
+For example, if a recipe is currently at version ``1.4.2`` and the regex is
+``^1\.4(\.\d+)*$``, then version ``1.4.7`` would be a valid upgrade candidate
+but ``1.5.0`` would not.
+
+For recipes whose version uses a dot-separated scheme, the
+:ref:`ref-classes-upstream-stable-release-point` class can automatically
+generate this regex. For other versioning schemes, set
+:term:`UPSTREAM_STABLE_RELEASE_REGEX` directly in the recipe.
+
 .. _ref-long-term-support-releases:
 
 Long Term Support Releases
-- 
2.54.0


